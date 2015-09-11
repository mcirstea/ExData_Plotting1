data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", 
                                  rep("numeric", 7)))
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
datasub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
rm(data)
### Plot 3
plot.new()
plot(datasub$Sub_metering_1, 
     type = "n", 
     ylab = "Energy sub metering",
     xlab = "", xaxt = "n")
lines(datasub$Sub_metering_1, col = "purple")
lines(datasub$Sub_metering_2, col = "red")
lines(datasub$Sub_metering_3, col = "blue")
axis(side = 1, at = c(1, 1441, 2880), 
     labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", 
                     "Sub_metering_3"), lty = c(1,1,1), 
       lwd=c(2,2), col = c("purple", "blue", "red"))
dev.copy(png, "plot3.png", width = 480, height = 480, units = "px")
dev.off()