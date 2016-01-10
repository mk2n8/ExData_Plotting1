powerdata <- read.csv("data/power consumption data/household_power_consumption.txt", sep = ";", 
                      na.strings = "?")
library (dplyr)

powerdata <- mutate(powerdata, convertedDate = as.Date(powerdata$Date, format = "%d/%m/%Y"))

powerdata07 <- subset(powerdata, subset = (convertedDate >= "2007-02-01" & convertedDate <= "2007-02-02"))

powerdata07 <- mutate(powerdata07, contTime = paste(as.Date(powerdata07$convertedDate), powerdata07$Time))

t <- paste(as.Date(powerdata07$convertedDate), powerdata07$Time)
powerdata07$t <- as.POSIXct(t)

png("plot4.png", width=480, height=480)
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

with(powerdata07, plot(Global_active_power ~ t, type = "l", ylab = "Global Active Power", xlab = ""))

with(powerdata07, plot(Voltage ~ t, type = "l", ylab = "Voltage", xlab = "datetime"))

with(powerdata07, {plot(Sub_metering_1 ~ t, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ t, col = 'Red')
        lines(Sub_metering_3 ~ t, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

with(powerdata07, plot(Global_reactive_power ~ t, type = "l", ylab = "Global_rective_power", xlab = "datetime"))

dev.off()

with(powerdata07, {
        plot(Global_active_power ~ t, type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ t, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ t, type = "l", ylab = "Energy sub metering",
             xlab = "")
        lines(Sub_metering_2 ~ t, col = 'Red')
        lines(Sub_metering_3 ~ t, col = 'Blue')
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
               bty = "n",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power ~ t, type = "l", 
             ylab = "Global_rective_power", xlab = "datetime")
})

















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
d <- powerdata07$Global_active_power
plot4data <- table(t, a, b, c, d)
plot4data$t <- as.POSIXct(t)

plot(powerdata07$Global_active_power ~ powerdata07$contTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")

with(plot4data, {
        plot(a ~ t, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(b ~ t, col = 'Red')
        lines(c ~ t, col = 'Blue')
})

png("plot4.png", width=480, height=480)
with(plot4data, {
        plot(a ~ t, type = "l", 
             ylab = "Global Active Power (kilowatts)", xlab = "")
        lines(b ~ t, col = 'Red')
        lines(c ~ t, col = 'Blue')
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()


plot(powerdata07$Global_active_power ~ powerdata07$contTime)

png("plot2.png", width=480, height=480)
plot(powerdata07$Global_active_power ~ powerdata07$contTime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab = "")
dev.off()