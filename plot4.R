library(dplyr)

rm(list = ls())

MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings = "?")

MyData2 <- filter(MyData, 
(as.Date(MyData$Date, "%d/%m/%Y") == as.Date("1/2/2007", "%d/%m/%Y") | 
 as.Date(MyData$Date, "%d/%m/%Y") == as.Date("2/2/2007", "%d/%m/%Y") ) 
)

MyData2$datetime <- strptime(paste(MyData2$Date, MyData2$Time), "%d/%m/%Y %H:%M:%S")

png(filename = "plot4.png",
    width = 480, height = 480, units = "px", pointsize = 12)

    par(mfcol = c(2,2))
    
    plot(y = as.numeric(MyData2$Global_active_power), x = MyData2$datetime, 
        type = "n", 
        ylab = "Global Active Power (kilowatts)", 
        xlab = ""
     )
    points(y = MyData2$Global_active_power, x = MyData2$datetime, type = "l", col = "darkcyan")
 
    plot(x = MyData2$datetime, y = as.numeric(MyData2$Sub_metering_3),  
        type = "l", 
        ylab = "Energy sub metering", 
        xlab = "",
        col = "maroon3",
        ylim = c(1, 30)
     )
    points(y = as.numeric(MyData2$Sub_metering_2), x = MyData2$datetime, type = "l", col = "red")
    points(y = as.numeric(MyData2$Sub_metering_1), x = MyData2$datetime, type = "l", col = "blue")
    legend("left", 
    legend = c("Sub metering 1", "Sub metering 2", "Sub metering 3"), 
    col = c("blue", "red", "maroon3"),
    lty=1:3, cex=0.8
    )

    plot(y = as.numeric(MyData2$Voltage), x = MyData2$datetime, 
        type = "n", 
        ylab = "Voltage", 
        xlab = "Date Time"
     )
    points(y = MyData2$Voltage, x = MyData2$datetime, type = "l", col = "steelblue3")

    plot(y = as.numeric(MyData2$Global_reactive_power), x = MyData2$datetime, 
        type = "n", 
        ylab = "Global Reactive Power", 
        xlab = "Date Time"
     )
    points(y = MyData2$Global_reactive_power, x = MyData2$datetime, type = "l", col = "skyblue")

dev.off()
print("End of the Script")