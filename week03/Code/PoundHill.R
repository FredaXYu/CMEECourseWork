# https://mhasoba.github.io/TheMulQuaBio/notebooks/08-Data_R.html#some-data-wrangling-principles
# I guess the purpose is to transpose the dataframe of the MyData

MyData <- as.matrix(read.csv("../Data/PoundHillData.csv",header = FALSE))
class(MyData)    # [1] "matrix" "array"

# metadata: 
MyMetaData <- read.csv("../Data/PoundHillMetaData.csv",header = TRUE,  sep=";")
print("Here1")
print(MyMetaData)
class(MyMetaData)   # [1] "data.frame"
print("Here2")


print("here")
head(MyData)

pivot_longer(data = )

# 27 Oct
