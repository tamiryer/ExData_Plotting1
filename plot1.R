#library("swirl")
#install_from_swirl("Exploratory Data Analysis")
#swirl()
# Load necessary libraries

library(png)
library(grid)
library(gridExtra)


# Load data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, destfile = "household_power_consumption.zip")
unzip("household_power_consumption.zip")

#Plot1
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", rep("numeric", 7)))

# Subset data for the specified dates
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data_sub <- subset(data, Date == as.Date("2007-02-01") | Date == as.Date("2007-02-02"))

# Create plot
png("plot1.png", width = 480, height = 480)
hist(data_sub$Global_active_power, breaks = 12, col = "red", main = "Global Active Power Distribution",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()






