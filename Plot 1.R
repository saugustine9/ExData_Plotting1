library(dplyr)
library(ggplot2)

#Generating Histogram plot
hist(power_data$Global_active_power, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")
dev.copy(png, "Plot1.png", width=480, height=480)
dev.off()