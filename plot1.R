####Plot1######
dataFile <- ".\\household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
NewData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

png(file="plot1.png",height = 480,width=480) ##Open png file device 
hist(as.numeric(NewData$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()  ##close the png file device
##########################################