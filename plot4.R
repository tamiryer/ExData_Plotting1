url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Convert Date and Time to DateTime class
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

# Subset data for the specified dates
data_sub <- subset(data, as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-01") | as.Date(Date, format = "%d/%m/%Y") == as.Date("2007-02-02"))

# Create the third plot (Voltage Over 2 Days)
png("plot5.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Voltage, type = "l", col = "red",
     xlab = "Date and Time", ylab = "Voltage (volt)",
     main = "Voltage Over 2 Days")
dev.off()

# Create the fourth plot (Global Reactive Power Over 2 Days)
png("plot6.png", width = 480, height = 480)
plot(data_sub$DateTime, data_sub$Global_reactive_power, type = "l", col = "green",
     xlab = "Date and Time", ylab = "Global Reactive Power (kilowatts)",
     main = "Global Reactive Power Over 2 Days")
dev.off()
plot2 <- readPNG('plot2.png')
plot3 <- readPNG('plot3.png')
plot5 <- readPNG('plot5.png')
plot6 <- readPNG('plot6.png')
grid.arrange(rasterGrob(plot2),rasterGrob(plot5),rasterGrob(plot3),rasterGrob(plot6),ncol=2)

png("plot4.png", width = 10, height = 10,res=200, units = "in")
grid.arrange(rasterGrob(plot2),rasterGrob(plot5),rasterGrob(plot3),rasterGrob(plot6),ncol=2)
dev.off()