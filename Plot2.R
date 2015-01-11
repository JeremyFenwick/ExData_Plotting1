powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
powerdata$DateTime <- as.POSIXct(paste(powerdata$Date, powerdata$Time), format="%d/%m/%Y %H:%M:%S") 
powerdata$Date <- as.Date(powerdata$Date, format = "%d/%m/%Y")
subpowerdata <- powerdata[powerdata$Date == "2007-02-01" | powerdata$Date == "2007-02-02",]
subpowerdata$Global_active_power <- as.character(subpowerdata$Global_active_power)
subpowerdata$Global_active_power <- as.numeric(subpowerdata$Global_active_power)
par(mfrow = c(1,1))
plot(subpowerdata$DateTime, subpowerdata$Global_active_power, type="l",
        ylab = "Global Active Power (kilowatts)", xlab = "")
dev.copy(png, file="Plot2.png")
dev.off()