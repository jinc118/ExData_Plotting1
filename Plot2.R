## Read data from feb 1 2007 - feb 2 2007
#install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date= '2/2/2007'", sep=";")
sqldf()  ##close connection

##format date field
data$DateTime<-paste(data$Date, data$Time)
data$DateTime<-strptime(data$DateTime, "%d/%m/%Y %H:%M:%S")

## Create Line plot
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(data$DateTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()