
# highlight, ctrl + Enter 

print("start")

MyData <- read.csv("../Data/trees.csv")

a <- ls(pattern = "My*") # Check that MyData has appeared
print(a)

print(head(MyData)) # Have a quick look at the data frame

str(MyData) # Note the data types of the three columns)      the same as below line
print(str(MyData)) # Note the data types of the three columns))   the same as above line

MyData <- read.csv("../Data/trees.csv", header = F) # Import ignoring headers
# print(MyData) # Import ignoring headers       can work, long output

head(MyData)

MyData <- read.table("../Data/trees.csv", sep = ',', header = TRUE) #another way   rounded, truncated the number 
head(MyData)

MyData <- read.csv("../Data/trees.csv", skip = 5) # skip first 5 lines
write.csv(MyData, "../Results/MyData.csv")

dir("../Results/") # Check if it worked

write.table(MyData[1,], file = "../Results/MyData.csv",append=TRUE) # append

write.table(MyData, "../Results/MyData.csv", col.names=FALSE) # ignore col names

print("end")
