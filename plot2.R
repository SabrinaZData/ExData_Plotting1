##Ex Data Analysis -- Week 1 project assignment

#download data to working directory
data_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
dest_file <- "household_power_consumption.zip"
download.file(data_url, destfile = dest_file)
unzip(dest_file)

#keep 2007/2/1-2007/2/2 only.
hh_power_data <- read.table("household_power_consumption.txt", header = TRUE, sep=";", na.strings="?", skip = 66637, nrows = 2880, col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# convert data and time
hh_power_data$Date <- as.Date(hh_power_data$Date, format = "%d/%m/%Y") 
hh_power_data$DateTime <- as.POSIXct(paste(hh_power_data$Date, hh_power_data$Time))
#or hh_power_data$DateTime2 <- strptime(paste(hh_power_data$Date, hh_power_data$Time), "%B %d, %Y %H:%M")

#save plot2 to working directory
png(filename = "plot2.png", width = 480, height = 480)
plot(hh_power_data$DateTime, hh_power_data$Global_active_power, type="l", xlab = "", ylab = "Global Active Power(killowatts)")
dev.off()

