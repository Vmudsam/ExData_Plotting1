#set workdirectory where household_power_consumption.txt is saved.
setwd("~/Data-Science-toolbox/ExData_Plotting1")
df<-read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings=c("?"))

#use data from the dates 2007-02-01 and 2007-02-02
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
#convert the Date and Time variables to Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚎() functions.
df1$dateandtime <- strptime(sprintf("%s %s", df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")

par(mfcol=c(2,2))
#plot the fist (1,1)
#set margins

plot(df1$dateandtime, df1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)

#plot the second (2,1) row 2 column 1

plot(df1$dateandtime, df1$Sub_metering_1,
     type="l",
     xlab="",
     ylab="Energy sub metering",
     col="black"
     )
#add the lineplots
lines(df1$dateandtime, df1$Sub_metering_2,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)",
     col="red"
)
lines(df1$dateandtime, df1$Sub_metering_3,
      type="l",
      xlab="",
      ylab="Global Active Power (kilowatts)",
      col="blue"
)
#add lehend in the top right corner
legend(x="topright",
       legend=c("Sub_metering_1",
                "Sub_metering_2",
                "Sub_metering_3"),
       lty=c(1,1,1),
       col=c("black", "red", "blue"),
       bty="n",
       cex=0.5)


#plot the third (1,2) row 1 column 2

plot(df1$dateandtime, df1$Voltage,
     type="l",
     xlab="datetime",
     ylab="Voltage",
     col="black"
)


#plot the fourth (2,2) row 2 column 2

plot(df1$dateandtime, df1$Global_reactive_power,
     type="l",
     xlab="datetime",
     ylab="Global_reactive_power",
     col="black"
)

#save the plot as a .png file
dev.copy(png, "plot4.png")
dev.off() #close the grafics device

