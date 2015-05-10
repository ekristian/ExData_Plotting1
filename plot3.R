source("prepdata.R")

plot3 <- function() {
    plotData <- prepdata()
    with(plotData,
         plot(dt, Sub_metering_1, type="l",
              xlab="",
              ylab="Energy sub metering"))
    with(plotData, lines(dt, Sub_metering_2, col="red"))
    with(plotData, lines(dt, Sub_metering_3, col="blue"))
    legend("topright",
        col=c("black", "red", "blue"),
        pch="-",
        legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
        )
}

#plot3()
plot2png("plot3.png", plot3)
