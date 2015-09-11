data <- read.table("household_power_consumption.txt", 
                   header = TRUE, sep = ";", na.strings = "?", 
                   colClasses = c("character", "character", 
                                  rep("numeric", 7)))
data[,1] <- as.Date(data[,1], format = "%d/%m/%Y")
datasub <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")
rm(data)
### Plot 1
######## "Clear All" in graphics monitor ######## 
plot.new()
hist(datasub$Global_active_power, col = "red", 
     xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.copy(png, "plot1.png", width = 480, height = 480, units = "px")
dev.off()
