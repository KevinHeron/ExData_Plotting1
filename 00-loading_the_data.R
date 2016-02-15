#  ------------------------------------------------------------------------
#  EDM Week One Project ---------------------------------------------------
#  ------------------------------------------------------------------------

# setwd("C:/Users/Kevin/Desktop/edm-wk1")

library(downloader)
library(magrittr)                      ## for interactive work
library(pryr)                          ## to double check size estimates ok

if(!file.exists("household_power_consumption.txt")){
    download("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
             destfile = "edm-wk1.zip");
    unzip("edm-wk1.zip")
}

# Check Size limits -------------------------------------------------------

csv_size <- 2075259 * 9 * 10 / 1000000 ## row * column * padded bytes/slot
                                       ## converted to MB

csv_size < as.numeric(memory.limit())   ## checking size 

df0 <- read.csv("household_power_consumption.txt", 
                sep=";", na.strings = "?", stringsAsFactors = FALSE)

object_size(df0)        ## actual object size. subset csv made avail at end

names(df0) <- tolower(names(df0))

df0$datetime <- paste(df0$date, df0$time)
df0$datetime <- strptime(df0$datetime, "%d/%m/%Y %H:%M:%S") 

df <- df0

# Subsetting on dates -----------------------------------------------------

df$date <- as.Date(df$date, "%d/%m/%Y")

df <- df[df$date >= "2007-02-01" & df$date <= "2007-02-02", ] 

save(df, file = "household_power_consumption-subset.Rda") ## for quicker load

if(file.exists("edm-wk1.zip")) file.remove("edm-wk1.zip")    
if(file.exists("household_power_consumption.txt")) file.remove("household_power_consumption.txt")    
rm(df0)                       ## no need for `original'