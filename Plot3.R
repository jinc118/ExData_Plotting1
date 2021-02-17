## Read data from feb 1 2007 - feb 2 2007
##install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date= '2/2/2007'", sep=";")
sqldf()  ##close connection

##format date field
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## Create Line plot
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy Sub Meetering", xlab = "")
lines(data$DateTime,data$Sub_metering_2, col = "red")
lines(data$DateTime,data$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1, cex = .8)

dev.off()
