plot2 <- function() {
        data <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
                           na.strings = "?", skip = 66637, nrows = 2880 )
        
        names(data) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")
        
        data$Date <- paste(data$Date, data$Time) 
        data$Date <- as.POSIXlt(data$Date, "%d/%m/%Y %H:%M:%S", tz = "")        
        

        png(filename = "plot2.png", width = 480, height = 480)
        plot(data$Date, data$GAP,
             type = "l", 
             xlab = "",
             ylab = "Global Active Power (kilowatts)")
        dev.off()
             
             
        
}