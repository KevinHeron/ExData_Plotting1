# Plot 3 ------------------------------------------------------------------

load("household_power_consumption-subset.Rda") 

png("plot3.png", height = 480, width = 480, units = "px")
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
       lty = 1, 
       col = c("black", "red", "blue"))
dev.off()