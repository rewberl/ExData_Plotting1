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

# Convert date & time format
power$Date_time = strptime(paste(power$Date, power$Time, sep=" "),
                           format="%d/%m/%Y %H:%M:%S")

## View plot
# windows()  # Windows
# quartz()  # Mac
x11()  # Linux
par(mfrow=c(2, 2))

## Plot [1,1]
plot(power$Date_time, power$Global_active_power, type="l", xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

## Plot [1,2]
plot(power$Date_time, power$Voltage, type="l", xlab="", xaxt="n",
     ylab="Voltage")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

## Plot [2,1]
plot(power$Date_time, power$Sub_metering_1, type="l", xlab="", xaxt="n",
     ylab="Energy sub metering")
lines(power$Date_time, power$Sub_metering_1, col="black")
lines(power$Date_time, power$Sub_metering_2, col="red")
lines(power$Date_time, power$Sub_metering_3, col="blue")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)
legend("topright", col = c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot [2,2]
plot(power$Date_time, power$Global_reactive_power, type="l", xlab="", xaxt="n",
     ylab="Global reactive power")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

## Export plot
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

## Plot [1,1]
plot(power$Date_time, power$Global_active_power, type="l", xlab="", xaxt="n",
     ylab="Global Active Power (kilowatts)")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

## Plot [1,2]
plot(power$Date_time, power$Voltage, type="l", xlab="", xaxt="n",
     ylab="Voltage")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

## Plot [2,1]
plot(power$Date_time, power$Sub_metering_1, type="l", xlab="", xaxt="n",
     ylab="Energy sub metering")
lines(power$Date_time, power$Sub_metering_1, col="black")
lines(power$Date_time, power$Sub_metering_2, col="red")
lines(power$Date_time, power$Sub_metering_3, col="blue")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)
legend("topright", col = c("black", "red", "blue"), lwd=1, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Plot [2,2]
plot(power$Date_time, power$Global_reactive_power, type="l", xlab="", xaxt="n",
     ylab="Global reactive power")
axis.POSIXct(1, power$Date_time, format="%a", labels = TRUE)

dev.off()