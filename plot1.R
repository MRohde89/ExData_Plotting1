### change your working directory to the directory where the actual data is in
### most likely you need to change the setwd(...) in the statement on the next line
setwd("./Coursera/explanatory_data_analysis/") 

### read the data from your directory
data <- read.table("household_power_consumption.txt", sep= ";", header = TRUE, na.strings = "?")

data$Date <- strptime(data$Date, format = '%d/%m/%Y')
data$Date <- as.Date(data$Date)

### filter the data
data <- data[data$Date == '2007-02-01' | data$Date == '2007-02-02',]


### Saving the histogram as png
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data$Global_active_power, 
     col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)") 
dev.off()