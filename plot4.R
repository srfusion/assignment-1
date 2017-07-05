data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
semidata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Elements Values
datetime <- strptime(paste(semidata$Date, semidata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(semidata$Global_active_power)
globalReactivePower <- as.numeric(semidata$Global_reactive_power)
voltage <- as.numeric(semidata$Voltage)
subMetering1 <- as.numeric(semidata$Sub_metering_1)
subMetering2 <- as.numeric(semidata$Sub_metering_2)
subMetering3 <- as.numeric(semidata$Sub_metering_3)

# Plotting 4
png("plot4.png", width=480, height=480)
# Plot Array 2-2
par(mfrow = c(2, 2)) 
# Plot 1-1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
# Plot 1-2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
# Plot 2-1
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
#Plot 2-2
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()