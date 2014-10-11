## Getting full dataset
data_full <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
data_full$Date <- as.Date(data_full$Date, format="%d/%m/%Y")

## Subsetting the data
data <- subset(data_full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

## Converting dates
datetime <- paste(as.Date(data$Date), data$Time)
data$Datetime <- as.POSIXct(datetime)

## Plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

with(data, {
    plot(data$Global_active_power~data$Datetime, type="l",
         ylab="Global Active Power (kilowatts)", xlab="")
   
    plot(data$Voltage~data$Datetime, type="l",
         ylab="Voltage", xlab="datetime")
    
    plot(Sub_metering_1~Datetime, type="l",
         ylab="Energy sub metering", xlab="")
    lines(Sub_metering_2~Datetime,col='Red')
    lines(Sub_metering_3~Datetime,col='Blue')
    
    plot(data$Global_reactive_power~data$Datetime, type="l",
         ylab="Global_reactive_power", xlab="datetime")
})

## copy to png
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()


