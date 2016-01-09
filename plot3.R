####Plot3#######
dataFile <- ".\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
NewData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(NewData$Date, NewData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(NewData$Global_active_power)
subMetering1 <- as.numeric(NewData$Sub_metering_1)
subMetering2 <- as.numeric(NewData$Sub_metering_2)
subMetering3 <- as.numeric(NewData$Sub_metering_3)

png(file="plot3.png",height = 480,width=480) ##Open png file device 
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()  ##close the png file device
###########################