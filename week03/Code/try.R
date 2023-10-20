

# 20 OCt 2023
# 
# R   try catch 

doit <- function(x) {   # simulation sampling 
    temp_x <- sample(x, replace = TRUE)
    if(length(unique(temp_x)) > 30) {#only take mean if sample was sufficient
        print("mean(temp_x)", mean(temp_x))#
        print("as.character(mean(temp_x))", as.character(mean(temp_x)))
        print(paste("Mean of this sample was:", as.character(mean(temp_x))))
        } 
    else {
        stop("Couldn't calculate mean: too few unique values!")
        }
    }


set.seed(1345) # again, to get the same result for illustration

popn <- rnorm(50)

hist(popn)
lapply(1:15, function(i) doit(popn))






# unique: delete the repeated elements 




