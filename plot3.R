## Exploratory Data Analysis project 1
## 14Jan16

## Set up file, etc...
filename<-"../household_power_consumption.txt"
data<-read.table(filename,header=TRUE,sep=";",na.strings=c("?"))
data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dt<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

## plot 3
plot(dt,data$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(dt,data$Sub_metering_1)
lines(dt,data$Sub_metering_2,col="red")
lines(dt,data$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col=c("black","red","blue"),lty=c(1,1,1))
dev.copy(png,"plot3.png")
dev.off()

