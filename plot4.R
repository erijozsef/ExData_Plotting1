# Load the packages
library(dplyr)
library(readr)

# Set working directory
setwd("E:/Documents/R programs/ExData_Plotting1")

# Read the data
df <- read_delim("../dataset/household_power_consumption.txt", delim=';', col_types="ccnnnnnnn", na="?")

# Filter the data 
df1 <- filter(df, Date=="1/2/2007" | Date=="2/2/2007")

# Create new data frame with new datetime column
df2 <- mutate( df1, datetime=as.POSIXct(strptime( paste(Date, Time), "%d/%m/%Y %H:%M:%S")))

# Save current localization
curr_locale <- Sys.getlocale("LC_ALL")

# Set my localization to English
Sys.setlocale("LC_ALL", "English")

# Create histogram file
png( "plot4.png", width=480, height=480 )
par( mfrow = c(2,2))

# (1,1)
with( df2, plot( datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power"))

# (1,2)
with( df2, plot( datetime, Voltage, type="l", ylab="Voltage"))

# (1,3)
# 1st plot
with( df2, plot( datetime, Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering") )

# 2nd plot				 
par(new=TRUE)  # without this, the 2nd plot deletes the first 
with( df2, plot( datetime, Sub_metering_2, ylim=c(0,30), type="l", yaxt="n", col="red", 
	  xlab="", ylab="Energy sub metering") )

# 3rd plot				 
par(new=TRUE)
with( df2, plot( datetime, Sub_metering_3, ylim=c(0,30), type="l", yaxt="n", col="blue", 
	  xlab="", ylab="Energy sub metering") )
				 
legend( "topright", col = c("black", "blue", "red"), lty=1, legend=c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

 
# (1,4)
with( df2, plot( datetime, Global_reactive_power, type="l", ylab="Global_reactive_power"))

dev.off()

# Restore localization
Sys.setlocale("LC_ALL", curr_locale )