hhpc<-read.csv("proj1/household_power_consumption.txt", header=T,sep=";")

hhpc$Date <- as.Date(hhpc$Date,  "%d/%m/%Y")
hhpc$DateTime <- paste(hhpc$Date, hhpc$Time, sep=" ")

hd=head(hhpc)

feb2<-hhpc[hhpc$Date==as.Date("2007-02-01") | hhpc$Date==as.Date("2007-02-02"), ]
feb2$DateTime <- strptime(paste(feb2$Date, feb2$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

f2=head(feb2)

with(feb2, plot(DateTime, as.numeric(as.character(Global_active_power)), type='l', xlab="", ylab="Global Active Power (kilowatts)"))
dev.copy(png, file = "plot2A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
# pt.cex = 1  cex
