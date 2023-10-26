
print
print("=============== start this time outcome ===========================")
content <- read.table("SparrowSize.txt", header=T, sep="\t")   # error is the path, and the setwd()

a <- read.table("../Data/SparrowSize.txt", header=TRUE) 	
str(a) 	   # https://github.com/abiB1994/CMEECourseWork/blob/master/Week4/Code/Day1sws.R
# structure     # print the whole 

# mean(a$Year)    # no NA
# is.na(a$Year)   # long print out 


# ind = which(a$Bill.mass.unit == 'mg')    # don't understand

print("Xinglebani here")

#########################################

# easier: 

print(a$Bill[5])

print("I'm using the easier solution, which does not use the MASK: ")
#_____________________________________________
print("The mean of the Bill is: ")
mean(a$Bill, na.rm=TRUE)

print("The variance of the Bill is: ")
var(a$Bill, na.rm=TRUE)

print("The standard deviation of the Bill is: ")
sd(a$Bill, na.rm=TRUE)
#_____________________________________________
print("The mean of the Body Mass is: ")
mean(a$Mass, na.rm=TRUE)

print("The variance of the Bill is: ")
var(a$Mass, na.rm=TRUE)

print("The standard deviation of the Bill is: ")
sd(a$Mass, na.rm=TRUE)
#_____________________________________________
print("The mean of the Wing Length is: ")
mean(a$Wing, na.rm=TRUE)

print("The variance of the Bill is: ")
var(a$Wing, na.rm=TRUE)

print("The standard deviation of the Bill is: ")
sd(a$Wing, na.rm=TRUE)



print("The end of the easier method. ")
print("--------------------------------")

###################################################

### Bill length: 
# mean: 

# solution 1: I have not given an index for each element

# mean(a$Bill)      # has NA, need to handle
sprintf("Hereeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee")

all_elements_Bill <- a$Bill

# Bill

# mean_elements_not_NA    # don't write 'print'!!! This works now

all_elements_not_NA <- c() # initialisation   # proooooooooooooooooooooooooblem 

print("all_elements_not_NA")

print(all_elements_not_NA)

all_elements_Bill[5]      # 13.4
class(all_elements_Bill[5])  # "numeric"

# for (each in all_elements_Bill){
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
# }

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

## standard deviation: 


#############################################################

# Plot all four histograms in a multi-panel figure 




#############################################################
#############################################################

# correct answer: https://bb.imperial.ac.uk/webapps/blackboard/content/listContent.jsp?course_id=_39610_1&content_id=_2926878_1
# SwS 04 Lecture - Precision and Standard Error 22:22

print("Now it's standard answer: ")
# a$Bill                    # can work
# print(a$Bill)             # can work 
a1 <- subset(a, a$Tarsus!="NA")
class(a1)                  # data.frame
print("sd of Tarsus: ")
# sd(a1)                     # bug
a1_new <- as.matrix(a1)     # BE CAUCIOUS!!!!!!!!!!!
# a1_new                     # can work
class(a1_new[3])           # character 
a1_new2 <- array(a1_new)
sd(a1_new)







