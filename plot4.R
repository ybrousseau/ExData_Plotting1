setwd("C:/Users/ybrousseau")
setwd("C:/Users/ybrousseau/Desktop/Trainings_Learning/JHU_Coursera")

data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = c("?", ""),
                   colClasses = c("character", "character", "numeric","numeric","numeric","numeric",
                                  "numeric","numeric","numeric"))
data.backup <- data
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02", ]
data$Time <- strptime(data$Time, format = "%H:%M:%S")
data.backup2 <- data

x11()


par(mfrow=c(2,2))
par(mar = c(4,4,2,2))


plot(data$DateTime, data$Global_active_power,
     type = "l",
     ylim = c(0,8),
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     yaxp = c(0,6,3)
)

plot(data$DateTime, data$Voltage,
     type = "l",
     ylim = c(232,248),
     ylab = "Voltage",
     xlab = "datetime",
     yaxp = c(234,246,3)
)
axis(2, at = c(234,236,238,240,242,244,246), labels = c(234,"",238,"",242,"",246))


plot(data$DateTime, data$Sub_metering_1,
     type = "l", col = "black", 
     ylim = c(0,40),
     ylab = "Energy sub metering",
     xlab = "",
     yaxp = c(0,30,3)
)
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"))


plot(data$DateTime, data$Global_reactive_power,
     type = "l",
     ylim = c(0.0,0.5),
     xlab = "datetime"
)


dev.copy(png,filename="plot2.png", width=480, height=480, units="px")
dev.off ()