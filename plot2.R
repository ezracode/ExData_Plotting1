#setwd("C:/Users/esalazar/Documents/Proyectos R/Programming R/ExData_Plotting1")

library(dplyr)

rm(list = ls())

MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

MyData2 <- filter(MyData, 
(as.Date(MyData$Date, "%m/%d/%Y") == as.Date("2/1/2007", "%m/%d/%Y") | 
 as.Date(MyData$Date, "%m/%d/%Y") == as.Date("2/2/2007", "%m/%d/%Y") ) & 
Global_active_power != "?" &
as.numeric(Global_active_power) > 0
)

MyData2$datetime <- strptime(paste(MyData2$Date, MyData2$Time), "%m/%d/%Y %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

    plot(y = as.numeric(MyData2$Global_active_power), x = MyData2$datetime, 
        type = "n", 
        ylab = "Global Active Power (kilowatts)", 
        xlab = ""
     )
    points(y = MyData2$Global_active_power, x = MyData2$datetime, type = "l", col = "darkcyan")
 
dev.off()
print("End of the Script")