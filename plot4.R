####Plot4#######
dataFile <- ".\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
NewData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(NewData$Date, NewData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(NewData$Global_active_power)
subMetering1 <- as.numeric(NewData$Sub_metering_1)
subMetering2 <- as.numeric(NewData$Sub_metering_2)
subMetering3 <- as.numeric(NewData$Sub_metering_3)
globalReactivePower <- as.numeric(NewData$Global_reactive_power)
voltage <- as.numeric(NewData$Voltage)

png(file="plot4.png",height = 480,width=480) ##Open png file device 
par(mfrow = c(2, 2)) 
##1
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
##2
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
##3
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
##4
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()  ##close the png file device
###########################