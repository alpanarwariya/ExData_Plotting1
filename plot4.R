# read tha data and subset the data for 1/2/2007 and 2/2/2007 for plotting
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plotdata4 <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")

# convert variables Date and Time from type character to Date and Time class resp
plotdata4$Date <- as.Date(plotdata4$Date,format="%d/%m/%Y")
plotdata4$Time <- strptime(plotdata4$Time, format="%H:%M:%S")
plotdata4[1:1440, "Time"] <- format(plotdata4[1:1440, "Time"], "2007-02-01 %H:%M:%S")
plotdata4[1441:2880, "Time"] <- format(plotdata4[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# plot graphs using plot function and provide legend
png(filename="plot4.png")
par(mfrow=c(2,2))
with(plotdata4, plot(Time, as.numeric(Global_active_power), line='l', xlab="",ylab="Global Active Power"))
with(plotdata4, plot(Time, Voltage, type='l', xlab="datetime", ylab="Voltage"))
with(plotdata4, plot(Time, as.numeric(Sub_metering_1), type="n", xlab="",ylab="Energy sub metering"))
with(plotdata4, lines(Time, as.numeric(Sub_metering_1)))
with(plotdata4, lines(Time, as.numeric(Sub_metering_2), col="red"))
with(plotdata4, lines(Time, as.numeric(Sub_metering_3), col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
with(plotdata4, plot(Time, Global_reactive_power, type='l', xlab="datetime", ylab="Global_reactive_power"))
dev.off()