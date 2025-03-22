# Load dataset
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Combine Date and Time columns
subset_data$datetime <- strptime(paste(subset_data$Date, subset_data$Time), format="%Y-%m-%d %H:%M:%S")

# Convert sub-metering to numeric
subset_data$Sub_metering_1 <- as.numeric(subset_data$Sub_metering_1)
subset_data$Sub_metering_2 <- as.numeric(subset_data$Sub_metering_2)
subset_data$Sub_metering_3 <- as.numeric(subset_data$Sub_metering_3)

# Plot and save as PNG
png("plot3.png", width=480, height=480)
plot(subset_data$datetime, subset_data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(subset_data$datetime, subset_data$Sub_metering_2, col="red")
lines(subset_data$datetime, subset_data$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c("black", "red", "blue"), lty=1)
dev.off()
