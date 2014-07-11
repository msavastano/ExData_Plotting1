hhpc<-read.csv("proj1/household_power_consumption.txt", header=T,sep=";")

hhpc$Date <- as.Date(hhpc$Date,  "%d/%m/%Y")

hd=head(hhpc)

feb2<-hhpc[hhpc$Date==as.Date("2007-02-01") | hhpc$Date==as.Date("2007-02-02"), ]

f2=head(feb2)

hist(as.numeric(as.character(feb2$Global_active_power)), col='red', xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.copy(png, file = "plot1A.png") ## Copy my plot to a PNG file
dev.off() ## Don't forget to close the PNG device!
