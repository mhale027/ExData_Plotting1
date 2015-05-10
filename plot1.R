plot1 <- function() {
        data <- read.csv("household_power_consumption.txt", sep = ";", header = FALSE,
        na.strings = "?", skip = 66637, nrows = 2880 )

        names(data) <- c("Date", "Time", "GAP", "GRP", "V", "GI", "SM1", "SM2", "SM3")

        data$Date <- paste(data$Date, data$Time) 
        data$Date <- as.POSIXlt(data$Date, "%d/%m/%Y %H:%M:%S", tz = "")        

        png(filename = "plot1.png", width = 480, height = 480)
        hist(data$GAP,
             col = 'red',
             xlim = c(0,6),
             ylim = c(0,1200),
             xlab = "Global Active Power (kilowatts)",
             main = "Global Active Power")
        dev.off()
}