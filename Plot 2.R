#Load the data
power<-read.table("/users/sherwinaaugustine/Documents/household_power_consumption.txt", header = TRUE, sep = ';', nrows=2075259, na.strings = "?",
                  check.names=F, stringsAsFactors = FALSE, comment.char = "", quote = '\"')
power$Date<-as.Date(power$Date, format = "%d/%m/%Y")

#Subset the data to get the dates we require
power_data<-subset(power, Date >= "2007-02-01" & Date <= "2007-02-02")

#Converting the date to the appropriate format
Date_time<-paste(as.Date(power_data$Date), power_data$Time)
power_data$Datetime<-as.POSIXct(Date_time)

#Creating Plot 2
plot(power_data$Global_active_power~power_data$Datetime, type ="l", ylab = "Global Active Power (kilowatts)", xlab="" )
dev.copy(png, "Plot2.png", width=480, height=480)
dev.off()