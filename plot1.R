powerdata <- read.csv("data/power consumption data/household_power_consumption.txt", na.string = "?", sep = ";")

powerdata07 <- powerdata[powerdata$Date %in% c("1/2/2007","2/2/2007"), ]
names(powerdata07)

hist(powerdata07$Global_active_power)

png("plot1.png", width=480, height=480)
hist(powerdata07$Global_active_power, 
     main = "Global Active Power", 
     col = "orangered", 
     xlab = "Global Active Power (kilowatts)", 
     ylim=c(0, 1200))
dev.off()