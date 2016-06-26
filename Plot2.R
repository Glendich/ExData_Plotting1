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
png("plot2.png", bg="white")
# create plot
plot(mydata1$Time,mydata1$Global_active_power,ylab="Global Active Power (kilowatts)",type="l",xlab="")
dev.off()
