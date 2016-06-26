# read text file and exclude "?"
mydata = read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")   
#Transform Date variable to as.Date()
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")
#Subset data corresponding to Feb 1st and Feb 2nd 2007.
mydata1=subset(mydata, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
# Format time variable to POXIlt 
a=paste(as.character(mydata1$Date),as.character(mydata1$Time),sep=" ")
b=strptime(a,format="%Y-%m-%d %H:%M")
mydata1$Time=b
# from factor to numeric
for (i in 3:9){
  mydata1[,i]=as.numeric(as.character(mydata1[,i]))
}

# create device
png("plot4.png", bg="white")
#creat layout
par(mfrow=c(2,2),mar=c(4,4,2,1), oma=0,0,2,0)
# create plot1

plot(mydata1$Time,mydata1$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
# creat plot2

plot(mydata1$Time,mydata1$Voltage,ylab="Voltage",type="l",xlab="datetime")

# create plot3
plot(mydata1$Time, mydata1$Sub_metering_1,type="l",ylab="Energy sub metering",xlab=NA,col="black")
lines(mydata1$Time, mydata1$Sub_metering_2, col="red")
lines(mydata1$Time, mydata1$Sub_metering_3, col="blue")
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
# create plot4
plot(mydata1$Time,mydata1$Global_reactive_power,ylab="Global_reactive_power",type="l",xlab="datetime")
# close device
dev.off()
