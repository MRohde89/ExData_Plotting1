library(lubridate)

### change your working directory to the directory where the actual data is in
### most likely you need to change the setwd(...) in the statement on the next line
setwd("./Coursera/explanatory_data_analysis/") 

### read the data from your directory
data <- read.table("household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

### change format from the Date column and add column Timestamp
data$Date <- strptime(data$Date, format = '%d/%m/%Y')
data$Date <- as.Date(data$Date)
data$Timestamp <- paste(data$Date, data$Time)

### filter the data
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
data$Timestamp <- ymd_hms(data$Timestamp)

### Saving and plotting as PNG
### Since i use the german version of R Studio, the x label for the provided plot are
### Do for Thursday, Fr for Friday and Sa for Saturday
### if you run this script on your local english version it will be fine
### Thanks for your attention :-)

png("plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
### plotting the first picture
plot(data$Timestamp, 
     data$Global_active_power, 
     type = "l", 
     ylab = "Global Active Power (kilowatts)"
     , xlab = "")

### plotting the second picture
plot(data$Timestamp,
     data$Voltage,
     type = "l",
     xlab = "datetime", ylab = "Voltage")

### plotting the third picture
plot(data$Timestamp, 
     data$Sub_metering_1, 
     type = "l", 
     ylab = "Energy sub metering"
     , xlab = "")
lines(data$Timestamp, data$Sub_metering_2, col = "red")
lines(data$Timestamp, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), col=c("black","red","blue"), seg.len = 1, bty = "n")

### plotting the fourth picture
plot(data$Timestamp,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")


dev.off()