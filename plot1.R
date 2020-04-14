#reading in the dataset
df<-read.delim("household_power_consumption.txt", header = FALSE, sep = ";", skip = 66637, nrows = 2880)
header<-read.delim("household_power_consumption.txt", sep = ";", nrows = 1)
names(df)<-names(header)


#making plot1
hist(df$Global_active_power, col = "red", main = "Global Active Power", cex.axis=0.8, 
     xlab = "Global Active Power (kilowatts)")

#saving to png
png(filename = "plot1.png", width = 480, height = 480)
dev.off()
