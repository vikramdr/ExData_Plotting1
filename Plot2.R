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

str(datafile_2007)
head(datafile_2007)
datetime<-paste(as.Date(datafile_2007$Date),datafile_2007$Time)

datetime
datafile_2007$Datetime<-as.POSIXct(datetime)


png("plot2.png", width=480, height = 480)
with(datafile_2007, plot(Global_active_power ~ Date, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()