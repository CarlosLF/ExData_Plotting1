
path<-"./data/"
fileName<- paste0(path, "household_power_consumption.txt")

data <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

dates <- as.Date(data$Date,format="%d/%m/%Y") 

newdata<- data[dates>= date1 & dates <= date2 ,]

datetime <- strptime(paste(newdata$Date, newdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot(datetime, newdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.copy(png,'plot2.png',width=480,height=480)
dev.off()


