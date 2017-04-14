setwd("C:/Users/vikra/OneDrive/Data Science/Course 4 - Exploratory data analysis/data")
library(dplyr)
library(lubridate)

## Read the file
datafile<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
str(datafile)
## Select only observations within a date range
datafile_2007<-subset(datafile, Date %in% c("1/2/2007","2/2/2007"))
str(datafile_2007)

## Convert the Date column to date format
datafile_2007$Date<-as.Date(datafile_2007$Date, format="%d/%m/%Y")

datetime<-paste(as.Date(datafile_2007$Date),datafile_2007$Time)

datafile_2007$Datetime<-as.POSIXct(datetime)
str(datafile_2007)

png("plot3.png", width=480, height = 480)
with(datafile_2007, plot(Sub_metering_1 ~ Datetime, type="l", xlab="", ylab="Energy Submetering"))
with(datafile_2007, points(Sub_metering_2 ~ Datetime, type="l",col="Red"))
with(datafile_2007, points(Sub_metering_3 ~ Datetime, type="l",col="Blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), 
       legend = c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"))

dev.off()