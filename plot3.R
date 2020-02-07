# read tha data and subset the data for 1/2/2007 and 2/2/2007 for plotting
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plotdata3 <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
png(filename="plot2.png")

# convert variables Date and Time from type character to Date and Time class resp
plotdata3$Date <- as.Date(plotdata3$Date,format="%d/%m/%Y")
plotdata3$Time <- strptime(plotdata3$Time, format="%H:%M:%S")
plotdata3[1:1440, "Time"] <- format(plotdata3[1:1440, "Time"], "2007-02-01 %H:%M:%S")
plotdata3[1441:2880, "Time"] <- format(plotdata3[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# plot graphs using plot function and provide legend
png(filename="plot3.png")
plot(plotdata3$Time, as.numeric(plotdata3$Sub_metering_1), type="n", , xlab="",ylab="Energy sub metering", main="Energy Sub Metering vs Time")
lines(plotdata3$Time, as.numeric(plotdata3$Sub_metering_1))
lines(plotdata3$Time, as.numeric(plotdata3$Sub_metering_2), col="red")
lines(plotdata3$Time, as.numeric(plotdata3$Sub_metering_3), col="blue")
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()
