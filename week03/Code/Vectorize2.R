# https://mhasoba.github.io/TheMulQuaBio/notebooks/07-R.html#a-vectorization-challenge
# 
# Runs the stochastic Ricker equation with gaussian fluctuations

rm(list = ls())

stochrick <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{    # p0 = runif(1000, .5, 1.5)   is the simulation 

    # 倍数是e的什么次方

  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix

  N[1, ] <- p0

  for (pop in 1:length(p0)) { #loop through the populations

    for (yr in 2:numyears){ #for each pop, loop through the years  # 两年以后

      N[yr, pop] <- N[yr-1, pop] * exp(r * (1 - N[yr - 1, pop] / K) + rnorm(1, 0, sigma)) # add one fluctuation from normal distribution
    
     }
  
  }
 return(N)

}

stochrick(runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2, numyears = 100)

# Now write another function called stochrickvect that vectorizes the above to
# the extent possible, with improved performance: 

stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{   # the function will operate on all elements of a vector without needing to loop through and act on each element one at a time cr. Yale
  N <- matrix(NA, numyears, length(p0))  #initialize empty matrix
  N[1, ] <- p0
  

}


# print("Vectorized Stochastic Ricker takes:")
# print(system.time(res2<-stochrickvect()))

stochrickvect <- function(p0 = runif(1000, .5, 1.5), r = 1.2, K = 1, sigma = 0.2,numyears = 100)
{


  print("Vectorized Stochastic Ricker takes:")
  print(system.time(res2<-stochrickvect()))
}


# idea: 
# I guess the vectorization may be (1) to let me use the existing numbers to complete a vector operation, such as 
# vector plus, multiplication, etc. see https://docs.ycrc.yale.edu/r-novice-gapminder/09-vectorization/
# where it mentions that for loop can be transformed into vector operations. 
# (2) to possibly let me make the existing numbers and variables to become vectors. 
# 

