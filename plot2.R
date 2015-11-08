##plot2.R

#Reads in the data
dat <- read.table("household_power_consumption.txt",header = TRUE, 
                  na.strings = "?", sep = ";")

#Subsets out the two days we need
dates <- c("1/2/2007","2/2/2007")
sub <- dat[dat$Date %in% dates,]

#Plots the graph without an x-label or ticks
plot(sub$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)",
     xlab = '', xaxt='n')

#Adds x ticks and names
axis(1, at = c(0,1440,2880), labels = c("Thu","Fri","Sat"))

#Creates file and exports it
dev.copy(png, file="plot2.png")
dev.off()