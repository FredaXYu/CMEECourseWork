# https://mhasoba.github.io/TheMulQuaBio/notebooks/07-R.html#vectorization
#
# pre-allocation is slow but also effictive????????
#
#

NoPreallocFun <- function(x) {
    a <- vector() # empty vector    temperoraily store
    for (i in 1:x) {
        a <- c(a, i) # concatenate
        print(a)
        print(object.size(a))
    }
}

system.time(NoPreallocFun(10))

#################
# The default method combines its arguments to form a vector
# 
# I guess: 
# a <- vector()
# 1:10  x
# i = 1
# c(empty, 1), first, concatenate -> a which is an empty
# a is [1]     I guess the vector in R is in []
# object.size(a) is 1
#
# i = 2
# c(1, 2) -> a
# a is [1, 2]
# object.size(a) is 2
# 
# i = 3 -> a
# a is [1, 2, 3]
# object.size(a) is 3 
#
# 








