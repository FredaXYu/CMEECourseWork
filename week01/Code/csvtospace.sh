# The goal of this exercise is csv to space
#---------------------------------------------------------------------

# general idea: use nested loop; but I can also use other logical control sentences, such as fi exit???????    12 OCt 2023

###################  test  ##########################

# test the cat | tr
# test_cat_tr () { 
#    cat each_csv | tr ',' ' '
# }



#####################################################



# 
# # handle file path: 
echo -e "\nNow I want to handle the file path. \n"    # can work

# if ../Data/Temperatures:
#   execute

# # 
#   if
#   else

# else not execute, stop


$INPUT_PATH_CSV=../Data/Temperatures     # cannot work
$OUTPUT_PATH_CSV=../Data/Output/

echo -e "\nNow I am here 01. \n"    # can work

# Idea: 
# 1. substitude

m=0;        # the iterator ??
for each_csv in $PATH_CSV/*.csvs
    do
        # substitute
        # Solution01: use cat and channel, to truncate
        cat each_csv | tr ',' ' ' > m.csv

        # Soluition02: use sed
        # sed 's/ /-/g' 
        # sed -i "s/原字符串/新字符串/g" 

        # `grep 原字符串 -rl 所在目录`


        # Resource01: https://www.runoob.com/linux/linux-comm-awk.html not applicable, since 
        # $ awk '{print $1,$4}' log.txt    awk: cannot open csv (No such file or directory)

        # Resource02: https://www.runoob.com/w3cnote/linux-findtoreplace.html
        # IMPORTANT!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        # sed -i "s/原字符串/新字符串/g" `grep 原字符串 -rl 所在目录`

        # save output to a file 

        # INPUT_PATH_CSV 

        # output to output path 

        $m=$m+1  
    done
exit;

# How to loop through all the files: 
# https://www.cyberciti.biz/faq/bash-loop-over-file/
for f in PATH_CSV/*.csv
do
    echo "Processing $f" # always double quote "$f" filename
    # do something on $f
done


# My father says that I can also do not use an iterator...He says we can use a batch file operation...



# INPUT_PATH_CSV OUTPUT_PATH_CSV

# 2. special cases mask, average, ...

# handle wrong or missing inputs

# if [ $extension != "csv" ]; then

# exception handling to handle unwanted processes to prevent them from stopping a programme where we want the next part of the codes to be run






