powr<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(powr)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpwr<- powr[(powr$Date=='1/2/2007' | powr$Date=='2/2/2007'),]
subpwr$Date<- strptime(paste(subpwr$Date,subpwr$Time), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
 with(subpwr, {
 plot(subpwr$Date,as.numeric(as.character(subpwr$Global_active_power)),type='l',xlab=" ",ylab="Global Active Power")
 plot(subpwr$Date,as.numeric(as.character(subpwr$Voltage)),type='l',xlab="datetime",ylab="Voltage")

 plot(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_1)),main=" ",type="l",ylab="Energy sub metering",xlab=" ")
 lines(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_2)),main=" ",col="red")
 lines(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_3)),main=" ",col="blue")
 legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))

 plot(subpwr$Date,as.numeric(as.character(subpwr$Global_reactive_power)),type='l',xlab="datetime",ylab="Global_reactive_power")
})
 dev.copy(png,file="plot4.png")
 dev.off()

