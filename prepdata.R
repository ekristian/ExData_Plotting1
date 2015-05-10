prepdata <- function() {
    host <- "https://d396qusza40orc.cloudfront.net"
    path <- "exdata%2Fdata%2Fhousehold_power_consumption.zip"
    local_zip <- "household_power_consumption.zip"
    local_txt <- "household_power_consumption.txt"
    febObs <- "household_power_consumption_feb_01_02_2007.txt"

    if (!file.exists(local_zip)) {
        download.file(paste(host,path,sep="/"),
                      local_zip, method="curl")
    }
    unzip(local_zip, overwrite=TRUE, junkpaths=TRUE)

    subset_data <- function() {
        f <- file(local_txt, "r")
        fout <- file(febObs, "w")
        header <- readLines(f, n=1, warn=FALSE)
        write(header, fout, append=FALSE)
        while(length(r <- readLines(f, n=1, warn=FALSE))) {
            if (grepl("^[12]/2/2007;", r, perl=TRUE)) {
                write(r, fout, append=TRUE)
            }
            if (grepl("1/3/2007;", r, perl=TRUE)) {
                break
            }
        }
        close(f)
        close(fout)
    }
    if (!file.exists(febObs)) {
        subset_data()
    }
    x <- read.csv(febObs, header=TRUE, sep=";", stringsAsFactors=FALSE,
                  na.strings="?")
    x$dt <- strptime(paste(x$Date, x$Time), format="%d/%m/%Y %H:%M:%S")

    return(x)
}

plot2png <- function(filename, plotfn) {
    png(filename, width=480, height=480)
    plotfn()
    dev.off()
}
