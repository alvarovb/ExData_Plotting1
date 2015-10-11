plot2 <- function() {
    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
    
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
    
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
   
    dt$Date <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
    
    plot(dt$Date, dt$Global_active_power, type="l", 
         ylab = "Global Activity Power(Kilowatts)", xlab = "", 
         main  ="", cex.lab = 0.7)
    
    dev.copy(png, file = "plot2.png") 
    dev.off()
}