# Plot 2 ------------------------------------------------------------------

load("household_power_consumption-subset.Rda") 

png("plot2.png", height = 480, width = 480, units = "px")
plot(df$datetime, 
     df$global_active_power, 
     type = "l", 
     xlab = "", 
     ylab = "Global Active Power (kilowatts)")
dev.off()
