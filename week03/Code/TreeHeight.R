
# This function calculates heights of trees given distance of each tree 
# from its base and angle to its top, using  the trigonometric formula 
#
# height = distance * tan(radians)
#
# ARGUMENTS
# degrees:   The angle of elevation of tree
# distance:  The distance from base of tree (e.g., meters)
#
# OUTPUT
# The heights of the tree, same units as "distance"


# I guess you assume the heights of all the trees are the same. 

# my function, unfinished: 
# loads_tree_height <- function(path) {
#     # https://www.geeksforgeeks.org/how-to-import-a-csv-file-into-r/
# 
#     ## if the path is a string and reaaaally a path:   
#     # specifying the path 
#     
#     # reading contents of csv file 
#     content <- read.csv(path) 
#     print(paste("length of content dataframe read is: ", length(content[1])))
#     return (content)
# }        # unfinished 

# print(class(content))

# print(loads_tree_height("../Data/trees.csv"))   works
csv_content <- read.csv("../Data/trees.csv", header=TRUE)  # read the csv file

print(paste("class(csv_content) is ", class(csv_content)))   # data.frame
print(paste("length(csv_content) is ", length(csv_content))) # 3

########### teacher's codes
TreeHeight <- function(degrees, distance) {
    radians <- degrees * pi / 180       # formula
    height <- distance * tan(radians)    # this is just the unit
    print(paste("Tree height is:", height))
    return (height)
}

# my: 
get_each_tree_ht <- function(csv_ct)
{
  vect <- vector()
  for (each_df in csv_ct)
  {
    each_tree_ht = TreeHeight(csv_content$Angle.degrees, csv_content$Distance.m)
    vect <- c(vect, each_tree_ht) # concatenate
  }
  tree_h_df <- as.data.frame(vect)    # MUST transform the vector into dataframe!! Otherwise I got 360 datas! 
  return(tree_h_df)
}

tree_ht <- get_each_tree_ht(csv_content)
print(paste("length of get_each_tree_ht", length(tree_ht)))


# print("TreeHeight")
# TreeHeight(37, 40)
print("here")

# the empty object to be output

########################## Method 1:
# Firstly create a matrix, then use it in the dataframe: https://www.geeksforgeeks.org/how-to-create-an-empty-dataframe-in-r/
zero_matrix <- matrix(ncol = ncol(csv_content), nrow = nrow(csv_content)) 
print("here2")

########################## Method 2:
# create a new col in the original dataframe: https://www.geeksforgeeks.org/how-to-add-column-to-dataframe-in-r/


# adding a new column to the data frame using $ symbol 
print(paste(length(tree_ht), length(csv_content$Species)))  # not equal????????? Problem here 1 Nov 

if (length(tree_ht) == length(csv_content$Species))
{
  csv_content$tree.height.m <- c(tree_ht)    # errors: replacement has 360 rows, data has 120
} else {print("Caution   length(tree_ht) != length(csv_content$Species)")}   # error handling  stuck here 1 Nov


print("here3")
# print(csv_content)

MyDF = as.data.frame(zero_matrix)
# print("MyDF", MyDF)
# print("zero_matrix", zero_matrix)
# output_object <- data.frame(zero_matrix)
# print("output_object", output_object)

########################## Method 3: 
# use $ to operate on the whole columns

TreeHeight <- function(degrees, distance) {
  radians <- degrees * pi / 180       # formula
  height <- distance * tan(radians)    # this is just the unit
  print(paste("Tree height is:", height))
  return (height)
}

new <- TreeHeight(csv_content$Angle.degrees, csv_content$Distance.m)

csv_content$tree.height.m <- new    # append the new column, it works fine 3 Nov


# content_output: 

#save all data to csv file in results/
write.csv(csv_content, paste("../Results/", "TreeHts.csv", sep=""), row.names=FALSE)  


