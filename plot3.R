library(sqldf)
fileLocal<-"./household_power_consumption.txt"
dataHHPC<- read.csv.sql(fileLocal, sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE,sep=';')
dataHHPC$Date<-as.Date(dataHHPC$Date,"%d/%m/%Y")
png(filename="plot3.png",width=480, height=480)
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_1,
     ylab="Energy sub metering",xlab="",
     type="n") 
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_1)
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_2,col="red")
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Sub_metering_3,col="blue")
legend("topright", pch = "___", col = c("black","red","blue"), legend =c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()