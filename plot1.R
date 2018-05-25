library(dplyr)

rm(list = ls())

MyData <- read.csv(file="../household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

MyData2 <- filter(MyData, 
(as.Date(MyData$Date, "%m/%d/%Y") == as.Date("2/1/2007", "%m/%d/%Y") | 
 as.Date(MyData$Date, "%m/%d/%Y") == as.Date("2/2/2007", "%m/%d/%Y") ) & 
Global_active_power != "?" &
as.numeric(Global_active_power) > 0
)

png(filename = "plot1.png",
    width = 480, height = 480, units = "px", pointsize = 12)

with(MyData2, hist(as.numeric(Global_active_power),
    freq = TRUE,
    breaks = 24,
    main = "Global Active Power", 
    xlab = "Global Active Power (kilowatts)", 
    ylab = "Frequency",
    col = "red",
    )
)

dev.off()
print("End of the Script")