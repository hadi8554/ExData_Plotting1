powerconsumption = read.table("household_power_consumption.txt",header=TRUE,sep=";")
powerconsumption_subset <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(powerconsumption_subset$Date, powerconsumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
Sub_metering_1 <- as.numeric(powerconsumption_subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(powerconsumption_subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(powerconsumption_subset$Sub_metering_3)

png(filename="plot3.png",width=480, height=480)
plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col='black')
lines(date_time, Sub_metering_2, col='red')
lines(date_time, Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()