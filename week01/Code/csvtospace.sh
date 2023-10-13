# The goal of this exercise is csv to space
#---------------------------------------------------------------------

# general idea: use nested loop; but I can also use other logical control sentences, such as fi exit???????    12 OCt 2023


# 
# # handle file path: 
# if ../Data/Temperatures:
#   execute

# # 
#   if
#   else

# else not execute, stop


INPUT_PATH_CSV=../Data/Temperatures
OUTPUT_PATH_CSV=../Data/Output/


# Idea: 
# 1. substitude
for csv in $PATH_CSV/*.csv;
    do
        # substitute


        # Resource01: https://www.runoob.com/linux/linux-comm-awk.html
        # $ awk '{print $1,$4}' log.txt    awk: cannot open csv (No such file or directory)

        # Resource02: https://www.runoob.com/w3cnote/linux-findtoreplace.html
        # IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        # sed -i "s/原字符串/新字符串/g" `grep 原字符串 -rl 所在目录`


        # INPUT_PATH_CSV 

        # output to output path 


    done
exit;


# INPUT_PATH_CSV OUTPUT_PATH_CSV

# 2. special cases mask, average, ...

# handle wrong or missing inputs

# if [ $extension != "csv" ]; then

# exception handling to handle unwanted processes to prevent them from stopping a programme where we want the next part of the codes to be run






