powerconsumption = read.table("household_power_consumption.txt",header=TRUE,sep=";")
powerconsumption_subset <- powerconsumption[powerconsumption$Date %in% c("1/2/2007","2/2/2007") ,]

globalactivepower <- as.numeric(levels(powerconsumption_subset$Global_active_power))[powerconsumption_subset$Global_active_power]
png(filename="plot1.png",width=480, height=480)
hist(globalactivepower,breaks=20,col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",xlim=c(0,6))
dev.off()