# Load dataset
data <- read.csv("household_power_consumption.txt", sep=";", header=TRUE, na.strings="?", stringsAsFactors=FALSE)
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

# Subset data for 2007-02-01 and 2007-02-02
subset_data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Convert Global Active Power to numeric
subset_data$Global_active_power <- as.numeric(subset_data$Global_active_power)

# Plot and save as PNG
png("plot1.png", width=480, height=480)
hist(subset_data$Global_active_power, col="red", main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()
