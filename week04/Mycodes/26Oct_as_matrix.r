
#############################

# what data types can as.matrix() accept and ouput? 

# father yky's method: 

x <- c(1, 2, 3, 4, 5)
y <- c(4, 3, 6, 8, 7)

new <- data.frame(col1 = x, col2 = y)

is.data.frame(new)    # TRUE

mat <- as.matrix(new)   # If we use as.matrix(dataframe), then the output matrix's elements are numeric. 

is.matrix(mat)

mat

# C:\Users\yxy\Github_desktop\CMEECourseWork\week04\Mycodes>Rscript 26Oct_as_matrix.r
# [1] TRUE
# [1] TRUE
# col1 col2
# [1,]    1    4
# [2,]    2    3
# [3,]    3    6
# [4,]    4    8
# [5,]    5    7



#################################################

# My discovers: 

# first, read the txt file, then it's a list
yuxiao <- read.table("../Data/SparrowSize.txt", header=TRUE)
# print(yuxiao$Bill)
# the as.matrix prints out character elements ie. strings


#################################################
# CSDN: 

mat_new <- apply(yuxiao$Bill, 2, as.numeric)
mat_new2 <- as.matrix(mat_new)
print("Using apply(): ")
mat_new2

##################################################
# https://stackoverflow.com/questions/17506691/converting-from-a-list-to-numeric-in-r

# Transform the data from list to numeric form and put it in the matrix dataNum.

for (i in 1:dim(data)[2]) {
  dataNum[,i] <- c(as.numeric(data[[i]]))
}



