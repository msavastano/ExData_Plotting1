hhpc<-read.csv("proj1/household_power_consumption.txt", header=T,sep=";")

hhpc$Date <- as.Date(hhpc$Date,  "%d/%m/%Y")
hhpc$DateTime <- paste(hhpc$Date, hhpc$Time, sep=" ")

hd=head(hhpc)

feb2<-hhpc[hhpc$Date==as.Date("2007-02-01") | hhpc$Date==as.Date("2007-02-02"), ]
feb2$DateTime <- strptime(paste(feb2$Date, feb2$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

f2=head(feb2)

with(feb2, plot(DateTime, as.numeric(as.character(Sub_metering_1)), type='l', xlab="", ylab="Energy sub metering"))
with(feb2, lines(DateTime,as.numeric(as.character(Sub_metering_2)), col='red'))
with(feb2, lines(DateTime,as.numeric(as.character(Sub_metering_3)), col='blue'))
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), lty=1 , lwd=1, col=c('black', 'red', 'blue'), cex=.6, pt.cex=2)
dev.copy(png, file = "plot3A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
# pt.cex = 1  cex