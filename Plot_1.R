# read text file and exclude "?"
mydata = read.table("household_power_consumption.txt",sep=";",header=TRUE,stringsAsFactors=FALSE,na.strings="?")   
#Transform Date variable to as.Date()
mydata$Date=as.Date(mydata$Date,format="%d/%m/%Y")
#Subset data corresponding to Feb 1st and Feb 2nd 2007.
mydata1=subset(mydata, Date==as.Date("2007-02-01")|Date==as.Date("2007-02-02"))
# create device
png("plot1.png",width=480,height=480)
# create histogram 
hist(mydata1$Global_active_power, col="red", main="Global active power",xlab="Global Active Power (kilowatts)")
#close device
dev.off()
