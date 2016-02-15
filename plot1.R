# PLot 1 ------------------------------------------------------------------

load("household_power_consumption-subset.Rda") 

png("plot1.png", height = 480, width = 480, units = "px")
hist(df$global_active_power, 
     col  = "red", 
     xlim = c(0, 6), 
     ylim = c(0, 1200),
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
