# Base Table Read
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE, na.strings="?")
  
# Reassign Date var to Date Class with format
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

# Subset df2 as dates between 2007/02/01 and 2007/02/02
df2 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Reassign global_active_power var to numeric format
df2$Global_active_power <- as.numeric(df2$Global_active_power)

# Create png plot
png("plot1.png", width = 480, height = 480)

# Create histogram
hist(df2$Global_active_power, main="Global Active Power",col="red", xlab="Global Active Power (kilowatts)")

# Close the PNG file
dev.off()