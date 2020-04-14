#reading in the dataset
df<-read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880)
header<-read.delim("household_power_consumption.txt", sep = ";", nrows = 1)
names(df)<-names(header)

library(lubridate)
df$Date<-dmy(df$Date)
df$Time<-hms(df$Time)
df$dateandtime<-df$Date+df$Time

#making plot 2
plot(df$dateandtime,df$Global_active_power, type = 'l',
     ylab = "Global Active Power (kilowatts)",
     xlab = "",
     cex.axis = 0.8)

#saving to png
png(filename = "plot2.png", width = 480, height = 480)
dev.off()
