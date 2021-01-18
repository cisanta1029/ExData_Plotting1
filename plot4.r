# Base Table Read
df <- read.table("household_power_consumption.txt",sep=";",header=TRUE)

# Reassign Date var to Date Class with format
df$Date <- as.Date(df$Date,format="%d/%m/%Y")

# Subset df2 as dates between 2007/02/01 and 2007/02/02
df2 <- df[df$Date >= "2007-02-01" & df$Date <= "2007-02-02",]

# Create Datetime Var in df2
df2$Datetime <- as.POSIXct(paste(df2$Date, df2$Time), format="%Y-%m-%d %H:%M:%S")

# Create png plot
png("plot4.png", width = 480, height = 480)

# Create plots
par(mfrow=c(2,2))
plot(df2$Datetime,df2$Global_active_power,type = "l",xlab = "",ylab = "Global Active Power")
plot(df2$Datetime,df2$Voltage,type="l",xlab="datetime",ylab="Voltage")

plot(df2$Datetime,df2$Sub_metering_1,type = "l",xlab="",ylab = "Enery sub metering")
lines(df2$Datetime,df2$Sub_metering_2, col="orange")
lines(df2$Datetime,df2$Sub_metering_3, col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","orange", "blue"),lty=1,box.lty=0)

plot(df2$Datetime,df2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")

# Close the PNG file
dev.off()