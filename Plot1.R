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
par(mfrow = c(1,1))

## Create the plot
hist(subpowerdata$Global_active_power, main = "Global Active Power", col="red", xlab = 
       "Global Active Power (kilowatts)")
       
## Export the PNG file
dev.copy(png, file="Plot1.png")
dev.off()
