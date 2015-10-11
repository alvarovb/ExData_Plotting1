plot1 <- function() {
    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
   
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
  
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
   
    hist(dt$Global_active_power, col = "red",
         ylab = "Frequnecy", xlab = "Global Activity Power(Kilowatts)", 
         main  ="Global Activiy Power", cex.lab = 0.7)
    
    dev.copy(png, file = "plot1.png") 
    dev.off()
    
}