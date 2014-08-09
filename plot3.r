powr<-read.table("household_power_consumption.txt",sep=";",skip=1)
colnames(powr)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpwr<- powr[(powr$Date=='1/2/2007' | powr$Date=='2/2/2007'),]
subpwr$Date<- strptime(paste(subpwr$Date,subpwr$Time), "%d/%m/%Y %H:%M:%S")

plot(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_1)),main=" ",type="l",ylab="Energy sub metering",xlab=" ")
lines(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_2)),main=" ",col="red")
lines(subpwr$Date,as.numeric(as.character(subpwr$Sub_metering_3)),main=" ",col="blue")
legend("topright",lwd=2,col=c("black","red","blue"),legend=c("Sub_metering1","Sub_metering2","Sub_metering3"))
dev.copy(png,file="plot3.png")
dev.off()


