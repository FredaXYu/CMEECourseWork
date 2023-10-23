
print("start")

MyData <- read.csv("../data/trees.csv")

a <- ls(pattern = "My*") # Check that MyData has appeared
print(a)

print("end")
