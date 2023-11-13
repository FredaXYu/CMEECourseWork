#! /bin/bash

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#----------------------------------------------------------------------------
# practices of bash

no1=4
no2=5
result=no1+no2
echo $result

result2=$no1+$no2
echo $result2

  
echo "Have printed out something, this can run"

your_name="qryyx"
echo $your_name
echo ${your_name}


# myUrl="https://www.google.com"
# readonly myUrl
# myUrl="https://www.runoob.com"

#--------------------------------------
echo "---- \$* demonstration ----"
for i in "$*"; do 
    echo $i 
done

echo "---- \$* demonstration ----"
for j in "$@"; do 
    echo $j 
done
#--------------------------------------
your_name="example name"
str="Hello, I know you are \"$your_name\"! \n"
echo -e $str

your_name="runoob"
# 使用双引号拼接
greeting="hello, "$your_name" !"
greeting_1="hello, ${your_name} !"
echo $greeting  $greeting_1

# 使用单引号拼接
greeting_2='hello, '$your_name' !'
greeting_3='hello, ${your_name} !' 
echo $greeting_2  $greeting_3

#--------------------------------------
my_array=(A B "C" D)

echo "${my_array[0]}"
echo "${my_array[1]}"
echo "${my_array[2]}"
echo "${my_array[3]}"

#--------------------------------------

my_array2[0]=Q
my_array2[1]=W
my_array2[2]=E
my_array2[3]=R

echo "Elements in the array are: ${my_array2[*]}"
echo "Elements in the array are: ${my_array2[@]}"    # can also use @ to take all elements in an array

#--------------------------------------

string="abcd"
echo ${#string}   # 输出 4    获取字符串长度

string="runoob is a great site"
echo ${string:1:4} # 输出 unoo     from the second, count four elements

#--------------------------------------

# source: https://www.runoob.com/linux/linux-shell-variable.html