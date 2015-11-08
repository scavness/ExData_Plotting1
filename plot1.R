##plot1.R

#Reads in the data
dat <- read.table("household_power_consumption.txt",header = TRUE, 
                  na.strings = "?", sep = ";")

#Subsets out the two days we need
dates <- c("1/2/2007","2/2/2007")
sub <- dat[dat$Date %in% dates,]

#Plots the graph
hist(sub$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     ylab = "Frequency", main = "Global Active Power")

#Creates file and exports it
dev.copy(png, file="plot1.png")
dev.off()
