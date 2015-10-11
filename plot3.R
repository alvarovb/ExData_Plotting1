plot3 <- function() {
    
    if (!file.exists("data")) {
        dir.create("data")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, dest="./data/dataset.zip", method = "curl") 
        unzip (".data/dataset.zip", exdir = "./data")
    }
    
    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
    
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
    
    dt$Sub_metering_1 <- as.numeric(as.character(dt$Sub_metering_1))
    dt$Sub_metering_2 <- as.numeric(as.character(dt$Sub_metering_2))
    dt$Sub_metering_3 <- as.numeric(as.character(dt$Sub_metering_3))
    
    dt$Date <- strptime(paste(dt$Date, dt$Time), "%d/%m/%Y %H:%M:%S")
   
    png(file = "plot3.png")
    
    plot(dt$Date, dt$Sub_metering_1, type = "n",  ylab = "Energy sub metering", xlab = "", 
         main  ="", cex.lab = 0.7)
    lines(dt$Date, dt$Sub_metering_1)
    lines(dt$Date, dt$Sub_metering_2, col="red")
    lines(dt$Date, dt$Sub_metering_3, col="blue")
    
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch="_", col = c("black", "red", "blue"), cex=0.8)

    dev.off()
}