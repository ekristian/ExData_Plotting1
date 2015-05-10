source("prepdata.R")

plot2 <- function() {
    plotData <- prepdata()
    with(plotData,
         plot(dt, Global_active_power, type="l",
              xlab="",
              ylab="Global Active Power (kilowatts)"))
}


plot2png("plot2.png", plot2)
