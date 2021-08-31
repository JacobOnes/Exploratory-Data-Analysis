#plot3
dt <- fread("./data/household_power_consumption.txt", na.strings = "?")
dt <- dt[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dt <- dt[(datetime >= "2007-02-01" & datetime < "2007-02-03")]

png("plot3.png", width = 480, height = 480)
plot(dt[, datetime], dt[, Sub_metering_1], type = "l",
     xlab = "", ylab = "Energy sub metering")
lines(dt[, datetime], dt[, Sub_metering_2], col = "red")
lines(dt[, datetime], dt[, Sub_metering_3], col = 'blue')
legend("topright", 
       col = c('black', 'red', 'blue'),
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       lty=c(1,1), lwd=c(1,1))
dev.off()