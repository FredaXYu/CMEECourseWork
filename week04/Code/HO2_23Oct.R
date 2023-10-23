

print("ssss  start  sssssssss")
content <- read.table("SparrowSize.txt", header=T, sep="\t")   # error is the path, and the setwd()

a <- read.table("../Data/SparrowSize.txt", header=TRUE) 	
str(a) 	   # https://github.com/abiB1994/CMEECourseWork/blob/master/Week4/Code/Day1sws.R
# structure 

# mean(a$Year)    # no NA
# is.na(a$Year)   # long print out 

mean(a$Bill)      # has NA, need to handle
sprintf("Hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")

all_elements_Bill <- a$Bill
# mean_elements_not_NA    # don't write 'print'!!! This works now

all_elements_not_NA <- c() # initialisation

all_elements_Bill[5]      # 13.4
class(all_elements_Bill[5])  # "numeric"

for (each in all_elements_Bill){
  class(each)
  # print(each)
  if is.na(each) == FALSE {
    # SOLUTION 1: append()
    # SOLUTION 2: c()
    all_elements_not_NA <- c(all_elements_not_NA, each)
    
  }
  all_elements_not_NA
  # mean_elements_not_NA
}

# print("this is the print", mean_elements_not_NA) # invalid printing digits -2147483648

# print("content: ", content)     # bugggggggggggggggggggggggggggggg??

# content <- read.table("SparrowSize.csv", header=T, sep="\\)     #######
# print("content", content)

# SparrowSize.txt
# print("sssssssssssssssssssss")
# setwd('Path')setwd('Path')print(extra)

print("ss  end  ")


### Bill length: 
# mean: 



## variance: 

## standard deviation: 







