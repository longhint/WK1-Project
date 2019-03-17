plot1 <- function(){
read.table("household_power_consumption.txt", sep = ";", skip = 1, col.names = c("Date","Time", "Global_active_Power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ) -> dset
subset(dset, dset$Date == "1/2/2007"|dset$Date == "2/2/2007") ->sdset
png("plot1.png", width = 480 , height = 480 )
hist(as.numeric(as.character( sdset$Global_active_Power)), col= "red", xlab= "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

}
 