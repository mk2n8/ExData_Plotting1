powerdata <- read.csv("data/power consumption data/household_power_consumption.txt", sep = ";", 
                      na.strings = "?")
library (dplyr)

powerdata <- mutate(powerdata, convertedDate = as.Date(powerdata$Date, format = "%d/%m/%Y"))

powerdata07 <- subset(powerdata, subset = (convertedDate >= "2007-02-01" & convertedDate <= "2007-02-02"))

powerdata07 <- mutate(powerdata07, contTime = paste(as.Date(powerdata07$convertedDate), powerdata07$Time))

t <- paste(as.Date(powerdata07$convertedDate), powerdata07$Time)

a <- powerdata07$Sub_metering_1
b <- powerdata07$Sub_metering_2
c <- powerdata07$Sub_metering_3
plot3data <- table(t, a, b, c)
plot3data$t <- as.POSIXct(t)

png("plot3.png", width=480, height=480)
with(plot3data, {
        plot(a ~ t, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(b ~ t, col = 'Red')
        lines(c ~ t, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()
