#set workdirectory where household_power_consumption.txt is saved.
setwd("~/Data-Science-toolbox/ExData_Plotting1")
df<-read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings=c("?"))

#use data from the dates 2007-02-01 and 2007-02-02
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")
#convert the Date and Time variables to Date/Time classes in R using the 𝚜𝚝𝚛𝚙𝚝𝚎() functions.
df1$dateandtime <- strptime(sprintf("%s %s", df1$Date, df1$Time), "%d/%m/%Y %H:%M:%S")
par(mfcol=c(1,1)) 
plot(df1$dateandtime, df1$Global_active_power,
     type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
     )

#save the plot as a .png file
dev.copy(png, "plot2.png")
dev.off() #close the grafics device

