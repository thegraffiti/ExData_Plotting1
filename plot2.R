# Load dataset
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine Date and Time columns
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

# Convert Global Active Power to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Plot and save as PNG
png("plot2.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
