# Plot 4 ------------------------------------------------------------------

load("household_power_consumption-subset.Rda") 

png("plot4.png", height = 480, width = 480, units = "px")
par(mfrow = c(2, 2)) 
# Plot 1, 1. Aka "Plot 1"
hist(df$global_active_power, 
     col  = "red", 
     xlim = c(0, 6), 
     ylim = c(0, 1200),
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")

# Plot 1, 2. aka "Plot 2"
plot(df$datetime, 
     df$global_active_power, 
     type = "l", 
     xlab = "Global Active Power (kilowatts)", 
     ylab = "")

# Plot 2, 1. aka "Plot 3"
plot(df$datetime, 
     df$sub_metering_1, 
     type = "l", 
     ylab = "Energy Submetering", 
     xlab = "")
lines(df$datetime,
      df$sub_metering_2, 
      type = "l", 
      col  = "red")
lines(df$datetime, 
      df$sub_metering_3, 
      type = "l", 
      col  = "blue")
legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       bty = "n", 
       col = c("black", "red", "blue"))

# Plot 2, 4
plot(df$datetime, 
     df$global_reactive_power, 
     type = "l", 
     xlab = "datetime", 
     ylab = "Global_reactive_power")
dev.off()
