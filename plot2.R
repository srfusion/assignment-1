data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
semidata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Elements Values
datetime <- strptime(paste(semidata$Date, semidata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(semidata$Global_active_power)

#Plotting 2
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
