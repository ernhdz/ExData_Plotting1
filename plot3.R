


data = read.table("exdata-data-household_power_consumption/household_power_consumption.txt", sep = ";", header = TRUE, na.strings ="?") 
#mydata = read.table("exdata-data-household_power_consumption/test.txt", sep = ";", header = TRUE, na.strings ="?") 
head(data)

mydata <- data
head(mydata)

mydata$Date <- as.Date(mydata$Date, "%d/%m/%Y")
head(mydata)

start <- as.Date("2007-02-01")
end <- as.Date("2007-02-02")

dataToUse <- mydata[mydata$Date >= start,]
head(dataToUse)
tail(dataToUse)

dataToUse <- dataToUse[dataToUse$Date <= end,]

head(dataToUse)
tail(dataToUse)

aux <- paste(dataToUse$Date, dataToUse$Time)


dataToUse$Time <- strptime(aux, "%Y-%m-%d %H:%M:%S")
head(dataToUse)
tail(dataToUse)

#colors()
png(file = "plot3.png")
with(dataToUse, plot(x = Time, y = Sub_metering_1, type = "l", col = "black"))
with(dataToUse, lines(x = Time, y = Sub_metering_2, type = "l", col = "red"))
with(dataToUse, lines(x = Time, y = Sub_metering_3, type = "l", col = "blue"))
legend("topright", pch = "-", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()