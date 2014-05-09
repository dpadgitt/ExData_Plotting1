###############################################
#                                             #
#          Exploratory Data Analysis          #        
#                                             #
#               Course Project 1              #
#                                             #
#                    plot4.R                  #
#                                             #
#                 Dave Padgitt                #
#                                             #
#                  Generates                  #
#                   four-up                   #
#              plots/histograms               #
#                                             #
#    Dataset: Electric power consumption      #
#    File: household_power_consumption.txt    #
#    Usage: source("plot4.R")                 #
#                                             #
#                                             #
###############################################
#
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y") # convert characters to Date
hpcsub <- hpc[(hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02"),] # subset
hpcsub$datetime <- as.POSIXct(paste(hpcsub$Date, hpcsub$Time)) # convert to datetime
#
png(filename="plot4.png",width=480,height=480,bg="white",font="2") # Open PDF device
par(mfrow=c(2,2)) # 2 charts by 2
plot(hpcsub$datetime, hpcsub$Global_active_power, type = "l", xlab="", ylab="Global Active Power")
plot(hpcsub$datetime, hpcsub$Voltage, type = "l", xlab="datetime", ylab="Voltage")
plot(hpcsub$datetime, hpcsub$Sub_metering_1, col = "black", type = "l", xlab="", ylab="Energy sub metering")
lines(hpcsub$datetime, hpcsub$Sub_metering_2, col = "red", type = "l")
lines(hpcsub$datetime, hpcsub$Sub_metering_3, col = "blue", type = "l")
legend("topright",names(hpcsub[7:9]),col=c("black","red","blue"),lty=1,bty="n")
plot(hpcsub$datetime, hpcsub$Global_reactive_power, type = "l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
