plot4 <- function(){
  
  dset <- read.table("household_power_consumption.txt", sep = ";", skip = 1, 
             col.names = c("Date","Time", "Global_active_power", "Global_reactive_power", "Voltage", 
                           "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ,
                            stringsAsFactors = FALSE) 
  
  subset(dset, dset$Date == "1/2/2007"|dset$Date == "2/2/2007") ->sdset
  sdset$Date <- as.Date( sdset$Date, format = "%d/%m/%Y")
  library(dplyr)
  sdset <- mutate(sdset, date_time = paste(as.Date(sdset$Date),Time))
  sdset$date_time<- as.POSIXct(sdset$date_time)
  
  
  par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
  with(sdset, {
    
    plot(Global_active_power~date_time, type="l", 
         ylab="Global Active Power", xlab="")
    plot(Voltage~date_time, type="l", 
         ylab="Voltage ", xlab="")
    plot(Sub_metering_1~date_time, type="l", 
         ylab="Global Active Power ", xlab="")
    lines(Sub_metering_2~date_time,col='Red')
    lines(Sub_metering_3~date_time,col='Blue')
    legend("topright", col=c("black", "red", "blue"), lwd=1, bty="n",
           legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(Global_reactive_power~date_time, type="l", 
         ylab="Global Rective Power",xlab="")
  })
  dev.copy(png, file= "plot4.png", height = 480, width = 480)
  dev.off()
}