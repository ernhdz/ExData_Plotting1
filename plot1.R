


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
png(file = "plot1.png")
par(mfcol = c(1, 1))
hist(dataToUse$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col = "orangered")
dev.off()

