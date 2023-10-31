# https://mhasoba.github.io/TheMulQuaBio/notebooks/08-Data_R.html#on-to-data-exploration




require(tidyverse)

require(reshape2)# load the reshape2 package



MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
head(MyWrangledData); tail(MyWrangledData)

MyWrangledData <- dplyr::as_tibble(MyWrangledData) 
MyWrangledData


# MyData <- as.matrix(read.csv("../Data/PoundHillData.csv",header = FALSE))
# class(MyData)    # [1] "matrix" "array"

# # metadata: 
# MyMetaData <- read.csv("../Data/PoundHillMetaData.csv",header = TRUE,  sep=";")
# print("Here1")
# print(MyMetaData)
# class(MyMetaData)   # [1] "data.frame"
# print("Here2")


# print("here")
# head(MyData)

# pivot_longer(data = )








