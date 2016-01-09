####Plot2######
dataFile <- ".\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
NewData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(NewData$Date, NewData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

png(file="plot2.png",height = 480,width=480) ##Open png file device 
plot(datetime, as.numeric(NewData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()  ##close the png file device
###########################