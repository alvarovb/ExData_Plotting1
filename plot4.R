plot4 <- function() {
    
    if (!file.exists("data")) {
        dir.create("data")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, dest="./data/dataset.zip", method = "curl") 
        unzip ("./data/dataset.zip", exdir = "./data")
    }
    
    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
    
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
    
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
    dt$Sub_metering_1 <- as.numeric(as.character(dt$Sub_metering_1))
    dt$Sub_metering_2 <- as.numeric(as.character(dt$Sub_metering_2))
    dt$Sub_metering_3 <- as.numeric(as.character(dt$Sub_metering_3))
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
    dt$Voltage <- as.numeric(as.character(dt$Voltage))
    dt$Global_reactive_power <- as.numeric(as.character(dt$Global_reactive_power))
    
    png(file = "plot4.png")
    par(mfrow = c(2, 2))
    plot(dt$Date, dt$Global_active_power, type="l", 
         ylab = "Global Activity Power(Kilowatts)", xlab = "", 
         main  ="", cex.lab = 0.7)
    
    plot(dt$Date, dt$Voltage, type="l", 
         ylab = "Voltage", xlab = "datetime", 
         main  ="", cex.lab = 0.7)
    
    plot(dt$Date, dt$Sub_metering_1, type = "n",  ylab = "Energy sub metering", xlab = "", 
         main  ="", cex.lab = 0.7)
    lines(dt$Date, dt$Sub_metering_1)
    lines(dt$Date, dt$Sub_metering_2, col="red")
    lines(dt$Date, dt$Sub_metering_3, col="blue")
    
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
           pch="_", col = c("black", "red", "blue"), cex=0.6)
    
    plot(dt$Date, dt$Global_reactive_power, type="l", 
         ylab = "Global_reactive_power", xlab = "datetime", 
         main  ="", cex.lab = 0.7)
    
    dev.off()
    
}