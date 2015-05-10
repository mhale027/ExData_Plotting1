plot4 <- function() {
        data <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                         na.strings = "?", skip = 66637, nrows = 2880 )
        
        names(data) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")
        
        data$Date <- paste(data$Date, data$Time) 
        data$Date <- as.POSIXlt(data$Date, "%d/%m/%Y %H:%M:%S", tz = "")        
        
        
#        png(filename = "plot4.png", width = 480, height = 480)
        
        par( mfrow = c(2,2), mar = c(4,4,1,1), oma = c(4,4,1,1), cex = .5 )

        
#1  
        plot(data$Date, data$GAP, type = "l", xlab = "", ylab = "Global Active Power")
   
#2
        plot(data$Date, data$V, type = 'l', ylab = "Voltage", xlab = "datetime")

# 3       
        plot(data$Date, data$SM1, type = 'l', col = 'black', xlab = "", ylab = "Energy Sub Metering")
        lines(data$Date, data$SM2, type = 'l', col = 'red')
        lines(data$Date, data$SM3, type = 'l', col = 'blue')
        legend("topright", c("Sub_Metering_1", "Sub_Metering_2", "Sub_Metering_3"),
               col = c("black", "red", "blue"), lwd = 1)
# 4        
        plot(data$Date, data$GRP, type = 'l', xlab = "datetime", ylab = "Global_Reactive_Power")
        

#        dev.off()
        
        
        
}