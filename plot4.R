source("prepdata.R")

plot4 <- function() {
    plotData <- prepdata()
    par(mfcol=c(2,2))
    plot2()
    plot3()
    with(plotData, plot(dt, Voltage,
                        type="l",
                        ylab="Voltage", xlab="datetime"))
    with(plotData, plot(dt, Global_reactive_power, type="l",
                        xlab="datetime"))
}

#plot4()
plot2png("plot4.png", plot4)
