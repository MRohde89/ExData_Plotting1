library(lubridate)

### change your working directory to the directory where the actual data is in
### most likely you need to change the setwd(...) in the statement on the next line
setwd("./Coursera/explanatory_data_analysis/") 

### read the data from your directory
data <- read.table("household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

data$Date <- strptime(data$Date, format = '%d/%m/%Y')
data$Date <- as.Date(data$Date)



### filter the data
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]
data$Timestamp <- ymd_hms(data$Timestamp)

### since i use the German version of R, the Dates are Do for Thursday, 
### Fr for Friday and Sa for Saturday
png("plot2.png", width = 480, height = 480, units = "px")
plot(data$Timestamp, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)"
     , xlab = "")
dev.off() 