## This script requires "household_power_consumption.txt" to be in the current directory

## Load the table from file
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)

## Formate the date, create a new "DateTime" column
powerdata$DateTime <- as.POSIXct(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S") 
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")

## Subet by the date range
subpowerdata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02",]

## For plotting purposes, convert the "Global_active_power" column to numeric
subpowerdata$Global_active_power <- as.character(subpowerdata$Global_active_power)
subpowerdata$Global_active_power <- as.numeric(subpowerdata$Global_active_power)

## Set the number of plots shown in the graphics device 
par(mfrow = c(2,2))

## Create four seperate plots
plot(subpowerdata$DateTime, subpowerdata$Global_active_power, type="l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

plot(subpowerdata$DateTime, subpowerdata$Voltage, type="l",
     ylab = "Voltage", xlab = "datetime")

plot(subpowerdata$DateTime, subpowerdata$Sub_metering_1, type="l",
     ylab = "Energy sub metering", xlab = "")
lines(subpowerdata$DateTime, subpowerdata$Sub_metering_2, col="red")
lines(subpowerdata$DateTime, subpowerdata$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = 
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), cex=.5)

plot(subpowerdata$DateTime, subpowerdata$Global_reactive_power, type="l",
     ylab = "Global_reactive_power", xlab = "datetime")
     
## Export the PNG file
dev.copy(png, file="Plot4.png")
dev.off()


  
