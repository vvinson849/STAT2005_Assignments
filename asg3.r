# STAT2005 Assignment 3


# 1
questionnaire <- function() {
    continue <- TRUE
    Name = c()
    Age = c()
    Gender = c()
    cat("Please respond to the following three questions.\n\n\n")
    while(continue) {
        name <- readline("Question 1: What's your name? : ")
        repeat {
            age <- suppressWarnings(as.numeric(
                readline("Question 2: What's your age? <positive integer required>: ")))
            if(is.na(age) || age - trunc(age) > 0 || age < 0)
                cat("Please input positive integer.\n")
            else {
                age <- as.integer(age)
                break
            }
        }
        repeat {
            gender <- readline("Question 3: What's your gender? <M/F>: ")
            if(gender=="M"||gender=="F"||gender=="m"||gender=="f") {
                gender <- toupper(gender)
                break
            } else
                cat("Please input M or F.\n")
        }
        repeat {
            hasNew <- readline("New entry? <Y/N>: ")
            if(hasNew=="N"||hasNew=="n") {
                continue <- FALSE
                break
            } else if(hasNew=="Y"||hasNew=="y")
                break
            else
                cat("Please input Y or N.\n")
        }
        Name <- c(Name, name)
        Age <- c(Age, age)
        Gender <- c(Gender, gender)
    }
    result <- data.frame(
        Name, Age, Gender
    )
    cat("The average age is", mean(result$Age), "from", nrow(result), "respondents.\n")
    pie(c(sum(result$Gender=="M"),
          sum(result$Gender=="F")),
        labels = c("M", "F"))
    return(result)
}

data <- questionnaire()
data



# 2a
# 2-step transition probability matrix = 
# 0.43, 0.27, 0.3
# 0.39, 0.31, 0.3
# 0.41, 0.29, 0.3
T <- matrix(c(.5, .2, .3,
              .3, .4, .3,
              .4, .3, .3), nrow = 3, byrow = TRUE)
T2 <- T %*% T

# 2b
# P(still on channel 1) = 0.412528
state <- c(1, 0, 0)
for (i in 10:15) {
    state <- state %*% T
}
p_still_state1 <- state[0]

# 2c
# P(channel 2 after long time| strategy 1) = 0.3882353
# P(channel 2 after long time| strategy 2) = 0.4000444
# Therefore, strategy 2 is better.
T_strategy1 <- matrix(c(.45, .25, .3,
                         .3,  .4, .3,
                         .4,  .3, .3), nrow = 3, byrow = TRUE)
eig_strategy1 <- eigen(t(T_strategy1))
p_strategy1 <- eig_strategy1$vectors[,1] / sum(eig_strategy1$vectors[,1])
p_still_state2_strategy1 <- p_strategy1[1]

T_strategy2 <- matrix(c(.5, .25, .3,
                        .3,  .4, .3,
                        .4, .35, .25), nrow = 3, byrow = TRUE)
eig_strategy2 <- eigen(t(T_strategy2))
p_strategy2 <- eig_strategy2$vectors[,1] / sum(eig_strategy2$vectors[,1])
p_still_state2_strategy2 <- p_strategy2[1]
