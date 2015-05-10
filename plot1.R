source("prepdata.R")

plot1 <- function() {
    plotData <- prepdata()
    with(plotData, hist(Global_active_power,
                        main="Global Active Power",
                        xlab="Global Active Power (kilowatts)",
                        col="red"))
}

plot2png("plot1.png", plot1)
