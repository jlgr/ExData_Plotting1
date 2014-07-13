library(sqldf)
fileLocal<-"./household_power_consumption.txt"
dataHHPC<- read.csv.sql(fileLocal, sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE,sep=';')
dataHHPC$Date<-as.Date(dataHHPC$Date,"%d/%m/%Y")
png(filename="plot2.png",width=480, height=480)
plot(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_active_power,
     ylab="Global Active Power (kilowatts)",xlab="",
     type="n")
lines(strptime(paste(dataHHPC$Date,dataHHPC$Time,sep=" "),"%Y-%m-%d %H:%M:%S"),dataHHPC$Global_active_power)
dev.off()