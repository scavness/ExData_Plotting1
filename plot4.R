##plot4.R

#Reads in the data
dat <- read.table("household_power_consumption.txt",header = TRUE, 
                  na.strings = "?", sep = ";")

#Subsets out the two days we need
dates <- c("1/2/2007","2/2/2007")
sub <- dat[dat$Date %in% dates,]


#Starts png function for plotting to ensure correct output
#(The legend text gets cuttoff when using dev.copy)
png("plot4.png")

#Sets number of graphs and margins
par(mfrow= c(2,2))


############### Plots the first graph without an x-label or ticks
plot(sub$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
     xlab = '', xaxt='n')

#Adds x ticks and names
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))


############### Adds the second graph
plot(sub$Voltage, type="l", ylab = "Voltage",
     xlab = 'datetime', xaxt='n')

#Adds x ticks and names
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))


############### Adds the third graph
plot(sub$Sub_metering_1, type="l", ylab = "Energy sub metering",
     xlab = '', xaxt='n')

#Adds x ticks and names
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

#Adds the additional graphs
points(sub$Sub_metering_2, col = "red", type = "l")
points(sub$Sub_metering_3, col = "blue", type = "l")

#Adds the legend, btw = "n" gets rid of the border
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lwd = 1, lty=c(1,1,1), col = c("black","red","blue"), bty ="n")


############### Adds the fourth graph
plot(sub$Global_reactive_power, type="l", ylab = "Global_reactive_power",
     xlab = 'datetime', xaxt='n')

#Adds x ticks and names
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

#Ends creation of png file
dev.off()
