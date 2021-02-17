## Read data from feb 1 2007 - feb 2 2007
#install.packages("sqldf")
library(sqldf)

data <- read.csv.sql("household_power_consumption.txt", "select * from file where Date = '1/2/2007' or Date= '2/2/2007'", sep=";")
sqldf()  ##close connection

##format date field
data$Date<-as.Date(data$Date, format= "%d/%m/%Y")

##create histogram as png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()