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
png( "plot2.png", width=480, height=480 )
with( df2, plot( datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()

# Restore localization
Sys.setlocale("LC_ALL", curr_locale )

