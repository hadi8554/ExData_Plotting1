powerconsumption = read.table("household_power_consumption.txt",header=TRUE,sep=";")
powerconsumption_subset <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

globalactivepower <- as.numeric(levels(powerconsumption_subset$Global_active_power))[powerconsumption_subset$Global_active_power]
date_time <- strptime(paste(powerconsumption_subset$Date, powerconsumption_subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(filename="plot2.png",width=480, height=480)
plot(date_time, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()