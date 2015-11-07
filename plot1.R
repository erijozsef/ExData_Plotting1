# Load the packages
library(dplyr)
library(readr)

# Set working directory
setwd("E:/Documents/R programs/ExData_Plotting1")

# Read the data
df <- read_delim("../dataset/household_power_consumption.txt", delim=';', col_types="ccnnnnnnn", na="?")

# Filter the data 
df1 <- filter(df, Date=="1/2/2007" | Date=="2/2/2007")

# Create histogram file
png( "plot1.png", width=480, height=480 )
hist(df1$Global_active_power, col="red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
