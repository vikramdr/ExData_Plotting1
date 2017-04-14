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

png("plot4.png", width=480, height = 480)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(datafile_2007, {
    plot(Global_active_power~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    plot(Voltage~Datetime, type="l", 
         ylab="Voltage (volt)", xlab="")
    plot(Sub_metering_1~Datetime, type="l", 
         ylab="Global Active Power (kilowatts)", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~Datetime, type="l", 
         ylab="Global Rective Power (kilowatts)",xlab="")
})
dev.off()