
# Data management and visualizaion  - Some data wrangling principles

# 20 Oct 2023 data wrangling R

# which R /usr/bin/R


#################

MyData <- as.matrix(read.csv("../Data/PoundHillData.csv", header = FALSE))
class(MyData)   # [1] "matrix" "array" 

# .libnPaths()
# Error in .libnPaths() : could not find function ".libnPaths"
# > .libPaths()
# [1] "/usr/local/lib/R/site-library" "/usr/lib/R/site-library"      
# [3] "/usr/lib/R/library"           
# > 


