###############################################
#                                             #
#          Exploratory Data Analysis          #        
#                                             #
#               Course Project 1              #
#                                             #
#                    plot2.R                  #
#                                             #
#                 Dave Padgitt                #
#                                             #
#                  Generates                  #
#             Global Active Power             #
#                      vs                     #
#                      Day                    #
#                                             #
#    Dataset: Electric power consumption      #
#    File: household_power_consumption.txt    #
#    Usage: source("plot2.R")                 #
#                                             #
#                                             #
###############################################
#
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y") # convert characters to Date
hpcsub <- hpc[(hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02"),] # subset
hpcsub$datetime <- as.POSIXct(paste(hpcsub$Date, hpcsub$Time)) # convert to datetime
#
png(filename="plot2.png",width=480,height=480,bg="white",font="2") # Open PDF device
plot(hpcsub$datetime, hpcsub$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
