powerdata <- read.csv("data/power consumption data/household_power_consumption.txt", sep = ";", 
                      na.strings = "?")
library(dplyr)

powerdata <- mutate(powerdata, convertedDate = as.Date(powerdata$Date, format = "%d/%m/%Y"))

powerdata07 <- subset(powerdata, subset = (convertedDate >= "2007-02-01" & convertedDate <= "2007-02-02"))

powerdata07 <- mutate(powerdata07, contTime = paste(as.Date(powerdata07$convertedDate), powerdata07$Time))

contTime <- paste(as.Date(powerdata07$convertedDate), powerdata07$Time)

powerdata07$contTime <- as.POSIXct(contTime)

plot(powerdata07$Global_active_power ~ powerdata07$contTime)

png("plot2.png", width=480, height=480)
plot(powerdata07$Global_active_power ~ powerdata07$contTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()