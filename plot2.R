plot2<- function() {
  
  read.table("household_power_consumption.txt", sep = ";", skip = 1, col.names = c("Date","Time", "Global_active_Power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") , stringsAsFactors = FALSE) -> dset
  subset(dset, dset$Date == "1/2/2007"|dset$Date == "2/2/2007") ->sdset
  sdset$Date <- as.Date( sdset$Date, format = "%d/%m/%Y")

  date_time <- paste(as.Date(sdset$Date),sdset$Time)
  sdset$date_time<- as.POSIXct(date_time)
  
with(sdset, {
plot(Global_active_Power~date_time, type="l",
ylab="Global Active Power (kilowatts)", xlab="")
})

dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
}
