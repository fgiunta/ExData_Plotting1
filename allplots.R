## Exploratory Data Analysis project 1
## 14Jan16

## Set up file, etc...
filename<-"../household_power_consumption.txt"
data<-read.table(filename,header=TRUE,sep=";",na.strings=c("?"))
data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dt<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

## plot 1
hist(data$Global_active_power,main="Global Active Power",col="red",xlab="Global Active Power (kilowatts)")
dev.copy(png,"plot1.png")
dev.off()

## plot 2
## Note that the plot should have been called with type="l" to get
## the line plot in one shot.  Read the help, next time... :)

plot(dt,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dt,data$Global_active_power)
dev.copy(png,"plot2.png")
dev.off()

## plot 3
plot(dt,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dt,data$Sub_metering_1)
lines(dt,data$Sub_metering_2,col="red")
lines(dt,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.copy(png,"plot3.png")
dev.off()

## plot 4
par(mfrow=c(2,2))

## Repeat Global Active Power
plot(dt,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dt,data$Global_active_power)

## Voltage
plot(dt,data$Voltage,type="n",ylab="Voltage",xlab="datetime")
lines(dt,data$Voltage)

##Submetering repeat
plot(dt,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dt,data$Sub_metering_1)
lines(dt,data$Sub_metering_2,col="red")
lines(dt,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))

##global reactive power
plot(dt,data$Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")
lines(dt,data$Global_reactive_power)
dev.copy(png,"plot4.png")
dev.off()
