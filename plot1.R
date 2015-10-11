plot1 <- function() {
    if (!file.exists("data")) {
        dir.create("data")
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        download.file(url, dest="./data/dataset.zip", method = "curl") 
        unzip ("./data/dataset.zip", exdir = "./data")
    }

    dt <- read.csv2(file = "data/household_power_consumption.txt", na.strings = "?")
   
    dt <- dt[as.Date(dt$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(dt$Date, "%d/%m/%Y") == "2007-02-02", ]
  
    dt$Global_active_power <- as.numeric(as.character(dt$Global_active_power))
   
    png(file = "plot1.png", width = 480, height = 480)
    hist(dt$Global_active_power, col = "red",
         ylab = "Frequnecy", xlab = "Global Activity Power(Kilowatts)", 
         main  ="Global Activiy Power", cex.lab = 0.7)
    
    dev.off()

}