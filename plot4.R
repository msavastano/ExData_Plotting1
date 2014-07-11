hhpc<-read.csv("proj1/household_power_consumption.txt", header=T,sep=";")

hhpc$Date <- as.Date(hhpc$Date,  "%d/%m/%Y")
hhpc$DateTime <- paste(hhpc$Date, hhpc$Time, sep=" ")

hd=head(hhpc)

feb2<-hhpc[hhpc$Date==as.Date("2007-02-01") | hhpc$Date==as.Date("2007-02-02"), ]
feb2$DateTime <- strptime(paste(feb2$Date, feb2$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

f2=head(feb2)

par(cex.lab=.7, mfcol=c(2,2))

with(feb2, plot(DateTime, as.numeric(as.character(Global_active_power)), type='l', xlab="", ylab="Global Active Power (kilowatts)"))

with(feb2, plot(DateTime, as.numeric(as.character(Sub_metering_1)), type='l', xlab="", ylab="Energy sub metering"))
with(feb2, lines(DateTime,as.numeric(as.character(Sub_metering_2)), col='red'))
with(feb2, lines(DateTime,as.numeric(as.character(Sub_metering_3)), col='blue'))
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1 , lwd=.5, col=c('black', 'red', 'blue'), cex=.64,bty = "n", seg.len=1, y.intersp=.3)
#legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1 , lwd=.5, col=c('black', 'red', 'blue'),cex=.5, pt.cex=1, bty = "n", seg.len=1, inset=c(0.09,.01))

with(feb2, plot(DateTime, as.numeric(as.character(Voltage)), type='l', ,xlab="datetime", ylab="Voltage"))

with(feb2, plot(DateTime, as.numeric(as.character(Global_reactive_power)), type='l', xlab="datetime", ylab="Global_reactive_power"))
dev.copy(png, file = "plot4A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
# pt.cex = 1  cex
# pt.cex = 1  cex