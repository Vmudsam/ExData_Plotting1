#set workdirectory where household_power_consumption.txt is saved.
setwd("~/Data-Science-toolbox/ExData-Plotting1")
df<-read.csv(file = "household_power_consumption.txt", header = T, sep = ";", na.strings=c("?"))

#use data from the dates 2007-02-01 and 2007-02-02
df1 <- subset(df, Date == "1/2/2007" | Date == "2/2/2007")

#plot histogram
hist(df1$Global_active_power, main="Global Active Power",
     xlab="Global Active Power (kilowatts)",
     ylab="Frequency",
     col="red"
     )
#save the plot as a .png file
dev.copy(png, "plot1.png")
dev.off() #close the grafics device

