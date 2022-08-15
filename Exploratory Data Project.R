#Load the data
power<-read.table("/users/sherwinaaugustine/Documents/household_power_consumption.txt", header = TRUE, sep = ';', nrows=2075259, na.strings = "?",
                  check.names=F, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
power$Date<-as.Date(power$Date, format = "%d/%m/%Y")

#Subset the data to get the dates we require
power_data<-subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#Converting the date to the appropriate format
Date_time<-paste(as.Date(power_data$Date), power_data$Time)
power_data$Datetime<-as.POSIXct(Date_time)

#Generating Histogram plot
hist(power_data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.copy(png, "Plot1.png", width=480, height=480)
dev.off()

#Creating Plot 2
plot(power_data$Global_active_power~power_data$Datetime, type ="l", ylab = "Global Active Power (kilowatts)", xlab="" )
dev.copy(png, "Plot2.png", width=480, height=480)
dev.off()

#Generating plot 3
with(power_data, {
  plot(Sub_metering_1~Datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.copy(png, "Plot3.png", width=480, height=480)
dev.off()

#Combine and create plot 4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(power_data, {
  plot(Global_active_power~Datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", ylab = "Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", ylab = "Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime, col='Red')
  lines(Sub_metering_3~Datetime, col='Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd=2, bty="n", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", ylab = "Global Reactive Power (kilowatts)", xlab="")
})
dev.copy(png, "Plot4.png", width=480, height=480)
dev.off()
