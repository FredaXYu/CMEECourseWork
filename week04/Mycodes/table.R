
# table()
# source: https://blog.csdn.net/chongbaikaishi/article/details/115550837

a <- c(3, 4, 2, 1, 2, 1, 5, 4, 7, 3, 5, 2, 2, 7, 8, NA, NA)

table(a)
# it prints out: 
# a
# 1 2 3 4 5 7 8
# 2 4 2 2 2 2 1
print("-----------------------")
# 若要统计其中的NA值，需要设置exclude参数为NULL: 
table(a, exclude=NULL) 
# it prints out: 
# a
# 1    2    3    4    5    7    8 <NA>
# 2    4    2    2    2    2    1    2

print("-----------------------")
table(a, exclude=7) 

print("-----------------------")
table(a, exclude=NA) 

