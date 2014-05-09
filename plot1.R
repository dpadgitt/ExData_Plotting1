###############################################
#                                             #
#          Exploratory Data Analysis          #        
#                                             #
#               Course Project 1              #
#                                             #
#                    plot1.R                  #
#                                             #
#                 Dave Padgitt                #
#                                             #
#                  Generates                  #
#             Global Active Power             #
#                  Histogram                  #
#                                             #
#    Dataset: Electric power consumption      #
#    File: household_power_consumption.txt    #
#    Usage: source("plot1.R")                 #
#                                             #
#                                             #
###############################################
#
hpc <- read.table("household_power_consumption.txt", header=TRUE, sep=";",na.strings=c("?"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric"))
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y") # convert characters to Date
hpcsub <- hpc[(hpc$Date == "2007-02-01" | hpc$Date == "2007-02-02"),] # subset
hpcsub$datetime <- as.POSIXct(paste(hpcsub$Date, hpcsub$Time)) # convert to datetime
#
png(filename="plot1.png",width=480,height=480,bg="white",font="2") # Open PDF device
hist(hpcsub$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)") # Create Histogram
dev.off()
