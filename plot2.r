# Base Table Read
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Reassign Date var to Date Class with format
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

# Subset df2 as dates between 2007/02/01 and 2007/02/02
df2 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Create Datetime Var in df2
df2$Datetime <- as.POSIXct(paste(df2$Date, df2$Time), format="%Y-%m-%d %H:%M:%S")

# Create png plot
png("plot2.png", width = 480, height = 480)

# Create line graph
plot(df2$Datetime,df2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power (kilowatts)")

# Close the PNG file
dev.off()