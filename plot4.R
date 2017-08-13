
path<-"./data/"
fileName<- paste0(path, "household_power_consumption.txt")

data <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

dates <- as.Date(data$Date,format="%d/%m/%Y") 

newdata<- data[dates>= date1 & dates <= date2 ,]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
plot(datetime, newdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
plot(datetime, newdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, newdata$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(datetime, newdata$Sub_metering_2, type="l", col="red" )
lines(datetime, newdata$Sub_metering_3, type="l", col="blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
plot(datetime, newdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
