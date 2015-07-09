## Set working directory
setwd("/media/removable/SD Card/Research/Analysis/Coursera/Exploratory Data Analysis/Course Project 01")

## Load data
powerText = readLines("household_power_consumption.txt")
powerTextSubset = grep("^[12]/2/2007", substr(powerText, 1, 8))
power = read.table(text=powerText[powerTextSubset], header=TRUE, sep=";",
                   na.strings="?", col.names=c("Date", "Time",
                                               "Global_active_power",
                                               "Global_reactive_power",
                                               "Voltage", "Global_intensity",
                                               "Sub_metering_1",
                                               "Sub_metering_2",
                                               "Sub_metering_3"))

rm(powerText, powerTextSubset)

## View plot
# windows()  # Windows
# quartz()  # Mac
x11()  # Linux
hist(power$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")

## Export plot
png(filename="plot1.png", width=480, height=480)
hist(power$Global_active_power, col="red", main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()