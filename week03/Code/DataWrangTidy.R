
# ################################################################
# ################## Wrangling the Pound Hill Dataset ############
# ################################################################
# 
# # Data wrangling is the process of converting raw data into a usable form. 
# # It may also be called data munging or data remediation.
# 
# ############# Load the dataset ###############
# # header = false because the raw data don't have real headers
# MyData <- as.matrix(read.csv("../Data/PoundHillData.csv", header = FALSE))
# 
# # header = true because we do have metadata headers
# MyMetaData <- read.csv("../Data/PoundHillMetaData.csv", header = TRUE, sep = ";")
# 
# ############# Inspect the dataset ###############
# head(MyData)
# dim(MyData)
# str(MyData)
# fix(MyData) #you can also do this
# fix(MyMetaData)
# 
# ############# Transpose ###############
# # To get those species into columns and treatments into rows 
# MyData <- t(MyData) 
# head(MyData)
# dim(MyData)
# 
# ############# Replace species absences with zeros ###############
# MyData[MyData == ""] = 0
# 
# ############# Convert raw matrix to data frame ###############
# 
# TempData <- as.data.frame(MyData[-1,],stringsAsFactors = F) #stringsAsFactors = F is important!
# colnames(TempData) <- MyData[1,] # assign column names from original data
# 
# ############# Convert from wide to long format  ###############
# require(reshape2) # load the reshape2 package
# 
# ?melt #check out the melt function, which is inside of the reshape2 package
# 
# MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
# 
# MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
# MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
# MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
# MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
# MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
# 
# str(MyWrangledData)
# head(MyWrangledData)
# dim(MyWrangledData)

###########################################################################
###########################################################################
###########################################################################
###########################################################################
############# Exploring the data (extend the script below)  ###############
###########################################################################
###########################################################################
###########################################################################

# Teacher's purpose: looking for a function in dplyr and tidyr that does the same thing in each wrangling step
# https://dplyr.tidyverse.org/
# https://tidyr.tidyverse.org/

# From a resource, ..https://www.rdocumentation.org/packages/reshape2/versions/1.4.4
# 'reshape2 is retired: only changes necessary to keep it on CRAN will be made. We recommend using tidyr instead.'

#
# tidyr, gather(), Gather columns into key-value pairs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# https://tidyr.tidyverse.org/reference/gather.html?q=gather#null


MyData1 <- as.matrix(read.csv("../Data/PoundHillData.csv", header = FALSE))
MyMetaData1 <- read.csv("../Data/PoundHillMetaData.csv", header = TRUE, sep = ";")

######### Inspect the dataset ##########
head(MyData1)
dim(MyData1)
str(MyData1)
fix(MyData1) #you can also do this
fix(MyMetaData1)

######### Transpose #########
# To get those species into columns and treatments into rows 
MyData1 <- t(MyData1) 
head(MyData1)
dim(MyData1)
##### Replace species absences with zeros ######
MyData1[MyData1 == ""] = 0    # O_O

#### Convert raw matrix to data frame ######
TempData1 <- as.data.frame(MyData1[-1,],stringsAsFactors1 = F) #stringsAsFactors = F is important!
colnames(TempData1) <- MyData1[1,] # assign column names from original data

print("---------Now I want to use tidyr: ------------")
#### Convert from wide to long format - use gather() to get the key-value pair #####
require(tidyr) # load the reshape2 package

?gather #check out the melt function, which is inside of the gather() package   # now I run here 27 Oct 17:06 win Rstudio 


# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!undone!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!




# MyWrangledData <- melt(TempData, id=c("Cultivation", "Block", "Plot", "Quadrat"), variable.name = "Species", value.name = "Count")
# 
# MyWrangledData[, "Cultivation"] <- as.factor(MyWrangledData[, "Cultivation"])
# MyWrangledData[, "Block"] <- as.factor(MyWrangledData[, "Block"])
# MyWrangledData[, "Plot"] <- as.factor(MyWrangledData[, "Plot"])
# MyWrangledData[, "Quadrat"] <- as.factor(MyWrangledData[, "Quadrat"])
# MyWrangledData[, "Count"] <- as.integer(MyWrangledData[, "Count"])
# 
# str(MyWrangledData)
# head(MyWrangledData)
# dim(MyWrangledData)



# example From https://stackoverflow.com/questions/1181060   can't run, missing a function






# # tidyr, gather(), Gather columns into key-value pairs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# # tidyr, gather(), Gather columns into key-value pairs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
# # tidyr, gather(), Gather columns into key-value pairs!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!



