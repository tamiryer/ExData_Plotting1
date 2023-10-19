url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for the specified dates
data_sub <- subset(data, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02"))

png("plot2.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Global_active_power, type = "l", col = "blue",
     xlab = "Date and Time", ylab = "Global Active Power (kilowatts)",
     main = "Global Active Power Over 2 Days")
dev.off()

