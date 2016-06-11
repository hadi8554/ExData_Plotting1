powerconsumption = read.table("household_power_consumption.txt",header=TRUE,sep=";")
powerconsumption_subset <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

date_time <- strptime(paste(powerconsumption_subset$Date, powerconsumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#1st Plot Data
globalactivepower <- as.numeric(levels(powerconsumption_subset$Global_active_power))[powerconsumption_subset$Global_active_power]

#2nd Plot Data
Voltage <- as.numeric(levels(powerconsumption_subset$Voltage))[powerconsumption_subset$Voltage]

#3rd Plot Data
Sub_metering_1 <- as.numeric(powerconsumption_subset$Sub_metering_1)
Sub_metering_2 <- as.numeric(powerconsumption_subset$Sub_metering_2)
Sub_metering_3 <- as.numeric(powerconsumption_subset$Sub_metering_3)

#4th Plot Data
globalreactivepower <- as.numeric(levels(powerconsumption_subset$Global_reactive_power))[powerconsumption_subset$Global_reactive_power]

png(filename="plot4.png",width=480, height=480)
par(mfrow=c(2,2))
#creating 1st plot
hist(globalactivepower,breaks=20,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",xlim=c(0,6))

#creating 2nd plot
plot(date_time, voltage, type="l", xlab="datetime", ylab="Voltage")

#creating 3rd plot
plot(date_time, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering",col='black')
lines(date_time, Sub_metering_2, col='red')
lines(date_time, Sub_metering_3, col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#creating 4th plot
plot(date_time, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()