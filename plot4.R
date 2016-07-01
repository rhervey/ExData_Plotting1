dF <- "household_power_consumption.txt"
data <- read.table(dF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subData)
dT <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
GAP <- as.numeric(subData$Global_active_power)
GRP <- as.numeric(subData$Global_reactive_power)
voltage <- as.numeric(subData$Voltage)
Metering1 <- as.numeric(subData$Sub_metering_1)
Metering2 <- as.numeric(subData$Sub_metering_2)
Metering3 <- as.numeric(subData$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(dT, GAP, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(dT, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(dT, Metering1, type="l", ylab="Energy Metering", xlab="")
lines(dT, Metering2, type="l", col="red")
lines(dT, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(dT, GRP, type="l", xlab="datetime", ylab="Global Reactive Power")

dev.off()