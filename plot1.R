data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
semidata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# Element Value
globalActivePower <- as.numeric(semidata$Global_active_power)

#Plotting
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()