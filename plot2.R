plot2 <- function() {
    
    if (!file.exists("data")) {
        dir.create("data")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, dest="./data/dataset.zip", method = "curl") 
        unzip ("./data/dataset.zip", exdir = "./data")
    }
    
    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
    
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
    
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
   
    dt$Date <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
   
    png(file = "plot2.png")
    
    plot(dt$Date, dt$Global_active_power, type="l", 
         ylab = "Global Activity Power(Kilowatts)", xlab = "", 
         main  ="", cex.lab = 0.7)

    dev.off()
}