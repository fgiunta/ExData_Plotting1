## Exploratory Data Analysis project 1
## 14Jan16

## Set up file, etc...
filename<-"../household_power_consumption.txt"
data<-read.table(filename,header=TRUE,sep=";",na.strings=c("?"))
data<-subset(data,Date=="1/2/2007"|Date=="2/2/2007")
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
dt<-strptime(paste(data$Date,data$Time),format="%Y-%m-%d %H:%M:%S")

## plot 2
plot(dt,data$Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)")
lines(dt,data$Global_active_power)
dev.copy(png,"plot2.png")
dev.off()

