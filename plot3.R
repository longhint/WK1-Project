plot3<-function(){
  
  
  read.table("household_power_consumption.txt", sep = ";", skip = 1, col.names = c("Date","Time", "Global_active_Power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ,stringsAsFactors = FALSE) -> dset
  subset(dset, dset$Date == "1/2/2007"|dset$Date == "2/2/2007") ->sdset
  sdset$Date <- as.Date( sdset$Date, format = "%d/%m/%Y")
  
  library(dplyr)
  sdset <- mutate(sdset, date_time = paste(as.Date(sdset$Date),Time))
  sdset$date_time<- as.POSIXct(sdset$date_time)
  
  with(sdset, {
    plot(Sub_metering_1~date_time, type = "l", xlab = "", ylab = "Energy sub metering ") 
    lines(Sub_metering_2~date_time, col= "red")
    lines(Sub_metering_3~date_time, col= "blue")
  }
  )
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  dev.copy(png, file="plot3.png", width = 480, height = 480 )
  dev.off()
}