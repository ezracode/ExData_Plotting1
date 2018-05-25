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

png(filename = "plot3.png",
    width = 480, height = 480, units = "px", pointsize = 12)

    plot(x = MyData2$datetime, y = as.numeric(MyData2$Sub_metering_3),  
        type = "l", 
        ylab = "Energy sub metering", 
        xlab = "",
        col = "maroon3"
     )
    points(y = as.numeric(MyData2$Sub_metering_2), x = MyData2$datetime, type = "l", col = "red")
    points(y = as.numeric(MyData2$Sub_metering_1), x = MyData2$datetime, type = "l", col = "blue")
    legend("left", 
    legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
    col = c("blue", "red", "maroon3"),
    lty=1:3, cex=0.8
    )
 
dev.off()
print("End of the Script")