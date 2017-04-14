setwd("C:/Users/vikra/OneDrive/Data Science/Course 4 - Exploratory data analysis/data")

## Read the file
datafile<-read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

## Select only observations within a date range
datafile_2007<-subset(datafile, Date %in% c("1/2/2007","2/2/2007"))

## Convert the Date column to date format
datafile_2007$Date<-as.Date(datafile_2007$Date, format="%d%m%y")


png("plot1.png", width=480, height = 480)
hist(datafile_2007$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()