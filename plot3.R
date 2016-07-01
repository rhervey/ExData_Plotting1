dF <- "household_power_consumption.txt"
data <- read.table(dF, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subData)
dT <- strptime(paste(subData$Date, subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
Metering1 <- as.numeric(subData$Sub_metering_1)
Metering2 <- as.numeric(subData$Sub_metering_2)
Metering3 <- as.numeric(subData$Sub_metering_3)

png("plot3.png", width=480, height=480)
plot(dT, Metering1, type="l", ylab="Energy Metering", xlab="")
lines(dT, Metering2, type="l", col="red")
lines(dT, Metering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()