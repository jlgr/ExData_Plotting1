library(sqldf)
fileLocal<-"./household_power_consumption.txt"
dataHHPC<- read.csv.sql(fileLocal, sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE,sep=';')
dataHHPC$Date<-as.Date(dataHHPC$Date,"%d/%m/%Y")
png(filename="plot4.png",width=480, height=480)
par(mfrow = c(2, 2))
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_active_power,
     ylab="Global Active Power",xlab="",
     type="n")    
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_active_power)
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Voltage,
     ylab="Voltage",xlab="datetime",
     type="n")
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Voltage)
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_1,
     ylab="Energy sub metering",xlab="",
     type="n") 
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_1)
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_2,col="red")
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_3,col="blue")
legend("topright", bty="n",pch = "_", col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_reactive_power,
     ylab="Global_reactive_power",xlab="datetime",
     type="n")
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_reactive_power)
dev.off()