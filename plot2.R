# read tha data and subset the data for 1/2/2007 and 2/2/2007 for plotting
powerdata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE)
plotdata2 <- subset(powerdata, Date=="1/2/2007" | Date=="2/2/2007")
png(filename="plot2.png")

# convert variables Date and Time from type character to Date and Time class resp
plotdata2$Date <- as.Date(plotdata2$Date,format="%d/%m/%Y")
plotdata2$Time <- strptime(plotdata2$Time, format="%H:%M:%S")
plotdata2[1:1440, "Time"] <- format(plotdata2[1:1440, "Time"], "2007-02-01 %H:%M:%S")
plotdata2[1441:2880, "Time"] <- format(plotdata2[1441:2880, "Time"], "2007-02-02 %H:%M:%S")

# plot the graph using plot function
png(filename="plot2.png")
plot(plotdata2$Time,as.numeric(plotdata2$Global_active_power), type="l", , xlab="",ylab="Global Active Power(kilowatts)", main="Global Active Power vs Time")
dev.off()
