## Read data from feb 1 2007 - feb 2 2007
##install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date= '2/2/2007'", sep=";")
sqldf()  ##close connection

##format date field
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

#set up canvas for 4 plots
png(filename = "plot4.png", width = 480, height = 480, units = "px")
par(mfrow=c(2,2))


## Create Line plots
#Plot Top Left
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")

#Plot Top Right
plot(data$DateTime, data$Voltage , type = "l", ylab = "Voltage", xlab = "datetime")

#Plot Bottom Left
plot(data$DateTime, data$Sub_metering_1, type = "l", ylab = "Energy Sub Meetering", xlab = "")
lines(data$DateTime,data$Sub_metering_2, col = "red")
lines(data$DateTime,data$Sub_metering_3, col = "blue")
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), col=c("black","red","blue"), lty = 1, cex = .8)

#Plot Bottom Right
plot(data$DateTime, data$Global_reactive_power , type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()
