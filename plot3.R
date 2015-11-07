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
# it is unnecessary to set width and height values, because the default value is 480 for the two variables
png( "plot3.png")

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

 
dev.off()

# Restore localization
Sys.setlocale("LC_ALL", curr_locale )


