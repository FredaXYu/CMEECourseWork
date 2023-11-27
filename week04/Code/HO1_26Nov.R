
# Julia week04 
# SwS.h01.22-Statistics with Sparrows - 01.pdf

library(lme4)
require(lme4)
  
# Clear your workspace at the beginning of each session, 
# and between different parts of a project: 
rm(list=ls())  

print("======================")

4<2

myNumericVector <- c(1.3,2.5,1.9,3.4,5.6,1.4,3.1,2.9)
myCharacterVector <- c("low","low","low","low","high","high","high","high")
myLogicalVector <- c(TRUE,TRUE,FALSE,FALSE,TRUE,TRUE,FALSE,FALSE)

str(myNumericVector)
str(myCharacterVector)
str(myLogicalVector)

myMixedVector <-c(1, TRUE, FALSE, 3, "help", 1.2, TRUE, "notwhatIplanned")
str(myMixedVector)    # once there is a string in c(), it will convert all into strings

sqrt(4); 4^0.5; log(0); log(1); log(10); log(Inf)

exp(1)

d<-read.table("../Data/SparrowSize.txt", header=TRUE)
str(d)   # show the structure of the table read

print("------------------------")
head(d)
print("------------------------")
summary(d)

print("------------------------")
# Now we want to know how many captures per year: 
table(d$Year)
# d$Year        # ignore this

print("------------------------")
##### How many birds have been captured once, twice, three times ect.#####
table(table(d$BirdID))    # table函数构建列联表，统计每个因子的频数
# the above sentence prints out: 
#   1   2   3   4   5   6   7   8   9  10  11  12
# 225 147  98  49  45  28  15  12   8   6   1   2

print("------------------------")
require(dplyr)

BirdIDCount <- d %>% count(BirdID,BirdID, sort=TRUE)
BirdIDCount %>% count(n)
# %>% is a pipeline operator

print("============= Exercises: =================")

# 1. How many repeats are there per bird per year?
table(d$BirdID)

# 2. How many individuals did we capture per year for each sex? Compute the numbers,
# devise a useful table format, and fill it in.
print("------------------------------")

table(d$Sex)


# 3. Think about how you can communicate (1) and (2) best in tables, and how you can
# visualise (1) and (2) using plots. Produce several solutions, and discuss with GTA
# and your peers which the pros and cons for each solution to communicate and
# visualize the data structure for (1) and (2).



# 4. Write two results sections for (1) and (2), and ask your GTA for feedback. Each
# result section should use different means of communicating the results, visually and
# in a table.

