###############################################
#                                             #
#          Exploratory Data Analysis          #        
#                                             #
#               Course Project 1              #
#                                             #
#                    plot3.R                  #
#                                             #
#                 Dave Padgitt                #
#                                             #
#                  Generates                  #
#             Energy Sub Metering             #
#                      vs                     #
#                      Day                    #
#                                             #
#    Dataset: Electric power consumption      #
#    File: household_power_consumption.txt    #
#    Usage: source("plot3.R")                 #
#                                             #
#                                             #
###############################################
#
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y") # convert characters to Date
hpcsub <- hpc[(hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02"),] # subset
hpcsub$datetime <- as.POSIXct(paste(hpcsub$Date, hpcsub$Time)) # convert to datetime
#
png(filename="plot3.png",width=480,height=480,bg="white",font="2") # Open PDF device
plot(hpcsub$datetime, hpcsub$Sub_metering_1, col = "black", type = "l", xlab="", ylab="Energy sub metering")
lines(hpcsub$datetime, hpcsub$Sub_metering_2, col = "red", type = "l")
lines(hpcsub$datetime, hpcsub$Sub_metering_3, col = "blue", type = "l")
legend("topright",names(hpcsub[7:9]),col=c("black","red","blue"),lty=1)
dev.off()
