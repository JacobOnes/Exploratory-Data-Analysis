library(data.table)
library(lubridate)

#plot2
dt <- fread("./data/household_power_consumption.txt", na.strings = "?")
dt <- dt[, datetime := as.POSIXct(paste(Date, Time), format = "%d/%m/%Y %H:%M:%S")]
dt <- dt[(datetime >= "2007-02-01" & datetime < "2007-02-03")]

png("plot2.png", width = 480, height = 480)
plot(x = dt[, datetime], y = dt[, Global_active_power], 
     type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()