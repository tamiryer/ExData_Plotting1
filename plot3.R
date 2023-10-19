url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time to DateTime class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for the specified dates
data_sub <- subset(data, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02"))


# Create plot
png("plot3.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Sub_metering_1, col = "red", type = "l", lty = 1, lwd = 2)
lines(data_sub$DateTime, data_sub$Sub_metering_2, col = "green", type = "l", lty = 2, lwd = 2)
lines(data_sub$DateTime, data_sub$Sub_metering_3, col = "blue", type = "l", lty = 3, lwd = 2)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("red", "green", "blue"), lty = 1:3, lwd = 2)
title(main = "Energy Sub-metering Over 2 Days", xlab = "Date and Time", ylab = "Sub-metering (watt-hour)")
dev.off()
