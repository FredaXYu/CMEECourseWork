

print("ssss  start  sssssssss")
content <- read.table("SparrowSize.txt", header=T, sep="\t")   # error is the path, and the setwd()

a <- read.table("../Data/SparrowSize.txt", header=TRUE) 	
str(a) 	   # https://github.com/abiB1994/CMEECourseWork/blob/master/Week4/Code/Day1sws.R
# structure     # print the whole 

# mean(a$Year)    # no NA
# is.na(a$Year)   # long print out 


# ind = which(a$Bill.mass.unit == 'mg')    # don't understand


#########################################

# easier: 

print(a$Bill[5])



###################################################

### Bill length: 
# mean: 

# solution 1: I have not given an index for each element

# mean(a$Bill)      # has NA, need to handle
sprintf("Hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")

all_elements_Bill <- a$Bill

# Bill

# mean_elements_not_NA    # don't write 'print'!!! This works now

all_elements_not_NA <- c() # initialisation

print("all_elements_not_NA")

print(all_elements_not_NA)

all_elements_Bill[5]      # 13.4
class(all_elements_Bill[5])  # "numeric"

#for (each in all_elements_Bill){
#  class (each)
#  # print(each)
#  if (is.na (each) == FALSE) {
#    # SOLUTION 1: append()   # SOLUTION 2: c()
#     all_elements_not_NA <- c(all_elements_not_NA, each)   # can work
#  }
#  else {
#    
#  }
#  # print(all_elements_not_NA)   # ctrL + D to halt 
#  # mean_elements_not_NA
#}

# solution 2: give index to each element 
# I give up this idea since here is $ to select element index
# index_na_elements <- c()    # problem------------------------------------------

index_na_elements <- vector() # pre-allocation

# index_na_elements <- data.frame()  # inspiration??

for (i in range(length(all_elements_Bill))){
  class (all_elements_Bill[i])
  # print(each)
  if (is.na (all_elements_Bill[i]) == FALSE) {    # if that element is not NA
    # SOLUTION 1: append()
    # SOLUTION 2: c()
    # all_elements_not_NA <- c(all_elements_not_NA, all_elements_Bill[i])   # when I initialize c(), it prints NULL
    # all_elements_not_NA <- append(all_elements_not_NA, all_elements_Bill[i]) # when I initialize c(), it prints NULL
  }  
  else {     # if that element is NA
    index_na_elements <- c(index_na_elements, all_elements_Bill[i])    # problem
    
  }
  # print(all_elements_not_NA)   # ctrL + D to halt 
  # mean_elements_not_NA
}

print("index_na_elements")
print(index_na_elements)   # warning logical(0)

# Mask: give the mean, or median, to the elements of NA: 

u <- mean(all_elements_not_NA, na.rm = FALSE)

print("mean of all elements not NA in Bill: ")
print(u)




### Bill length: 
## variance: 

print("variance of all elements not NA in Bill: ")
# print(var(all_elements_not_NA, na.rm = FALSE))     # error


# print("this is the print", mean_elements_not_NA) # invalid printing digits -2147483648

# print("content: ", content)     # bugggggggggggggggggggggggggggggg??

# content <- read.table("SparrowSize.csv", header=T, sep="\\)     #######
# print("content", content)

# SparrowSize.txt
# print("sssssssssssssssssssss")
# setwd('Path')setwd('Path')print(extra)

print("ss  end  ")




## variance: 

## standard deviation: 


#############################################################

### Body mass: 

## mean: 

## variance: 

## standard deviation: 



#############################################################

### Wing length: 

## mean: 

## variance: 

## standatd deviation: 


#############################################################

# Plot all four histograms in a multi-panel figure 





#############################################################





