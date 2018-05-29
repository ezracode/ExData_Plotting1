#setwd("C:/Users/esalazar/Documents/Proyectos R/Programming R/ExData_Plotting1")

library(dplyr)

rm(list = ls())

MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

MyData2 <- filter(MyData, 
(as.Date(MyData$Date, "%d/%m/%Y") == as.Date("1/2/2007", "%d/%m/%Y") | 
 as.Date(MyData$Date, "%d/%m/%Y") == as.Date("2/2/2007", "%d/%m/%Y") ) 
)

MyData2$datetime <- strptime(paste(MyData2$Date, MyData2$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot2.png",
    width = 480, height = 480, units = "px", pointsize = 12)

    plot(y = as.numeric(MyData2$Global_active_power), x = MyData2$datetime, 
        type = "n", 
        ylab = "Global Active Power (kilowatts)", 
        xlab = ""
     )
    points(y = as.numeric(MyData2$Global_active_power), x = MyData2$datetime, type = "l", col = "darkcyan")
 
dev.off()
print("End of the Script")