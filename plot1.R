
path<-"./data/"
fileName<- paste0(path, "household_power_consumption.txt")

data <- read.table(fileName, header=TRUE, sep=";", na.strings="?")

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

data$Date <- as.Date(data$Date,format="%d/%m/%Y") 

newdata<- data[data$Date>= date1 & data$Date <= date2 ,]

hist(newdata$Global_active_power, main="Global Active Power", col="red", xlab="Global Active Power kilowatts")
dev.copy(png,'plot1.png',width=480,height=480)
dev.off()


