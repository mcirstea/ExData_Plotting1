data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", 
                                  rep("numeric", 7)))
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
datasub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
rm(data)
### Plot 2
plot.new()
plot(datasub$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power (kilowatts)", 
     xaxt="n")
axis(side = 1, at = c(1, 1441, 2880), 
     labels = c("Thu", "Fri", "Sat"))
dev.copy(png, "plot2.png", width = 480, height = 480, units = "px")
dev.off()