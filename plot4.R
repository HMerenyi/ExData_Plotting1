#reading in the dataset
df<-read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880)
header<-read.delim("household_power_consumption.txt", sep = ";", nrows = 1)
names(df)<-names(header)

library(lubridate)
df$Date<-dmy(df$Date)
df$Time<-hms(df$Time)
df$dateandtime<-df$Date+df$Time

#making plot4
par(mfrow=c(2,2))

plot(df$dateandtime,df$Global_active_power, type = 'l',
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     cex.axis = 0.8)

plot(df$dateandtime, df$Voltage, type = 'l',
     ylab = "Voltage",
     xlab = 'datetime',
     cex.axis=0.8)


plot(df$dateandtime,df$Sub_metering_1, type = 'l', 
     ylab = "Energy sub metering",
     xlab = "",
     cex.axis =0.8)
points(df$dateandtime, df$Sub_metering_2, col = "red", type = 'l')
points(df$dateandtime, df$Sub_metering_3, col = "blue", type = 'l')
legend(legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black","red","blue"),lty = 1,"topright", cex =0.6, bty="n")

plot(df$dateandtime,df$Global_reactive_power, type = 'l',
     ylab = "Global_reactive_power",
     xlab = 'datetime',
     cex.axis=0.8)

#saving to png
png(filename = "plot4.png", width = 480, height = 480)
dev.off()
