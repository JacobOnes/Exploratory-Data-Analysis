library(data.table)
library(lubridate)

if (!dir.exists("./data")) {dir.create("./data")}

# url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
# download.file(url, destfile = "./data/exdata_data_household_power_consumption.zip")
# unzip("./data/exdata_data_household_power_consumption.zip", exdir = "./data")

dt <- fread("./data/household_power_consumption.txt", na.strings = "?")
dt <- dt[, Date:=lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]
dt <- dt[(Date >= "2007-02-01" & Date <= "2007-02-02")]

#plot1
png("plot1.png", width = 480, height = 480)
hist(dt[,Global_active_power], main = "Global Active Power",
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
dev.off()