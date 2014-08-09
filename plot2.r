powr<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(powr)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpwr<- powr[(powr$Date=='1/2/2007' | powr$Date=='2/2/2007'),]
subpwr$Date<- strptime(paste(subpwr$Date,subpwr$Time), "%d/%m/%Y %H:%M:%S")
plot(subpwr$Date,as.numeric(as.character(subpwr$Global_active_power)),type='l',xlab="Date",ylab="Global Active Power(Kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()