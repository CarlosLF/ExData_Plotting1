
path<-"./data/"
fileName<- paste0(path, "household_power_consumption.txt")

data <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

dates <- as.Date(data$Date,format="%d/%m/%Y") 

newdata<- data[dates>= date1 & dates <= date2 ,]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

png("plot3.png", width=480, height=480)
plot(datetime, newdata$Sub_metering_1 , type="l", xlab="", ylab="Energy sub metering")
lines(datetime, newdata$Sub_metering_2, type="l", col="red" )
lines(datetime, newdata$Sub_metering_3, type="l", col="blue" )
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty = 1)
dev.off()
