
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

loads_tree_height <- function(path) {
    # https://www.geeksforgeeks.org/how-to-import-a-csv-file-into-r/

    ## if the path is a string and reaaaaaaaaaaaally a path:    # This can be a task!!!!! 
    # specifying the path 
    
    # reading contents of csv file 
    content <- read.csv(path) 

    return (content)
}        # unfinished 

print(loads_tree_height("\..\Data\trees.csv"))

### teacher's codes

# TreeHeight <- function(degrees, distance) {
#     radians <- degrees * pi / 180       # formula good!!!!!!!!!!!!!!!!!
#     height <- distance * tan(radians)    # this is just the unit
    
#     print(paste("Tree height is:", height))
  
#     return (height)
# }

## My edited: 
TreeHeight <- function(degrees, distance) {
    loads_tree_height("../Data/trees.csv")

    radians <- degrees * pi / 180       # formula good!!!!!!!!!!!!!!!!!
    height <- distance * tan(radians)    # this is just the unit
    
    print(paste("Tree height is:", height))
  
    return (height)
}


TreeHeight(37, 40)







