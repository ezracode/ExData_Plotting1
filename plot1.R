library(dplyr)

rm(list = ls())

MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

MyData2 <- filter(MyData, 
(as.Date(MyData$Date, "%m/%d/%Y") == as.Date("1/2/2007", "%m/%d/%Y") | 
 as.Date(MyData$Date, "%m/%d/%Y") == as.Date("2/2/2007", "%m/%d/%Y") ) 
)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

hist(MyData2$Global_active_power,
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency",
    col = "red")

dev.off()
print("End of the Script")