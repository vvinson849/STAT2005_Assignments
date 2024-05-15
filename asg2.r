# STAT2005 Assignment 2

# 1a
plot(pressure$temperature, pressure$pressure)
curve((0.168 + 0.007*x)^(20/3), from=0, to=400, add=TRUE)

# 1b
# The relationship becomes linear
plot(pressure$temperature, (pressure$pressure)^(3/20))
abline(a=.168, b=.007)

# 1c
title("Pressure-Temperature Graph")

# 1d
par(mfrow=c(1, 2))
plot(pressure$temperature, pressure$pressure)
curve((0.168 + 0.007*x)^(20/3), from = 0, to = 400, add = TRUE)
plot(pressure$temperature, (pressure$pressure)^(3/20))
abline(a=.168, b=.007)

# 2
alt_matrix <- function(n) {
    m <- matrix(data=0, nrow=n, ncol=n)
    for(i in 1:(n-1))
        for(j in 1:(n-1))
            if(m[i, j] == 0) {
                m[i, j+1] <- 1
                m[i+1, j] <- 1
            }
    return(m)
}

# 3
# initialise the plotting region
plot.new()
plot.window(xlim=c(0, 10), ylim=c(0, 10))
axis(1)
axis(2)
segments(0, 0, 10, 0, col="red")
# initialise the corner coordinates
ltop <- c(0, 10)
lbtm <- c(0, 1)
rtop <- c(10, 10)
rbtm1 <- c(9, 1)
rbtm2 <- c(10, 0)
for(i in 1:5) {
    # draw the line segments
    segments(lbtm[1], lbtm[2], rbtm1[1], rbtm1[2], col="red")
    segments(lbtm[1], lbtm[2], ltop[1], ltop[2], col="blue")
    segments(ltop[1], ltop[2], rtop[1], rtop[2], col="green")
    segments(rtop[1], rtop[2], rbtm2[1], rbtm2[2], col="orange")
    # update the corner coordinates
    ltop <- ltop + c(1, -1)
    lbtm <- lbtm + 1
    rtop <- rtop - 1
    rbtm1 <- rbtm1 + c(-1, 1)
    rbtm2 <- rbtm2 + c(-1, 1)
}

# 4
isPrime <- function(x) {
    for(i in 2:sqrt(x))
        if(x %% i == 0)
            return(FALSE)
    return(TRUE)
}

isPrimeArr <- tapply(1:1000, 1:1000, FUN=isPrime)

isTwinPrime <- function(x) {
    if( isPrimeArr[x] && (isPrimeArr[x-2] || isPrimeArr[x+2]) )
        return(TRUE)
    else
        return(FALSE)
}

seq(1, 1000)[tapply(1:1000, 1:1000, FUN=isTwinPrime)]
