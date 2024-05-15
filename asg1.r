# STAT2005 Assignment 1

# 1a
seq(10, 30, by=2)

# 1b
rep(1:5, 5) + rep(0:4, each=5)

# 2a 
# [1]  0.0000000+0.0000000i  0.1378323+0.6781544i -0.5378323+0.3582847i 
# [4] -0.5378323-0.3582847i  0.1378323-0.6781544i
roots <- polyroot(0:5)

# 2b
# [1] "complex"
mode(roots)

# 2c
roots[order(Im(roots))]

# 3a
# [1] "list"
# row: the rank and the suit of a single card
# column: the rank set and the suit set
mode(deck)

# 3b
hand <- deck[sample(1:52, 5),]

# 3c
is.flush <- length(unique(hand$suit))==1

# 3d
is.straight <- all( diff(sort(hand$rank)) == 1 ) | all( sort(hand$rank)-c(2:5, 14) == 0 )

# 3e
is.straightflush <- is.straight & is.flush
is.straight <- xor(is.straight, is.straightflush)
is.flush <- xor(is.flush, is.straightflush)

# 4a
moves <- data.frame(die_1=sample(6, size=100, replace=T), die_2=sample(6, size=100, replace=T))

# 4b
moves$step <- moves$die_1 + moves$die_2
moves$total_step <- cumsum(moves$step)
moves$round <- moves$total_step %/% 40
moves$side <- moves$total_step %% 40 %/% 10
moves$land <- moves$total_step %% 40 %% 10

# 4c
any( moves$side==3 & (moves$land==7 | moves$land==9) )
