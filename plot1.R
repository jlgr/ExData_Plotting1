library(sqldf)
fileLocal<-"./household_power_consumption.txt"
dataHHPC<- read.csv.sql(fileLocal, sql = 'select * from file where Date in ("1/2/2007","2/2/2007")',header=TRUE,sep=';')
dataHHPC$Date<-as.Date(dataHHPC$Date,"%d/%m/%Y")
png(filename="plot1.png",width=480, height=480)
hist(dataHHPC$Global_active_power,
     col="red",
     xlab= "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()