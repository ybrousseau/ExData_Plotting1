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

hist(data$Global_active_power, breaks = seq(from = 0, to = 8, by = .5), col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylim = c(0,1200), xlim = c(0,8), xaxp = c(0,6,3))


dev.copy(png,filename="plot1.png", width=480, height=480, units="px")
dev.off ()