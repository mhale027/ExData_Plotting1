plot3 <- function() {
        data <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                         na.strings = "?", skip = 66637, nrows = 2880 )
        
        names(data) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")
        
        data$Date <- paste(data$Date, data$Time) 
        data$Date <- as.POSIXlt(data$Date, "%d/%m/%Y %H:%M:%S", tz = "")        
        
        
        png(filename = "plot3.png", width = 480, height = 480)
        plot(data$Date, data$SM1, type = 'l', col = 'black', xlab = "",
             ylab = "Energy Sub Metering")
        lines(data$Date, data$SM2, type = 'l', col = 'red')
        lines(data$Date, data$SM3, type = 'l', col = 'blue')
        legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
               col = c("black", "red", "blue"), lwd = 1)
        
        dev.off()
        
        
        
}