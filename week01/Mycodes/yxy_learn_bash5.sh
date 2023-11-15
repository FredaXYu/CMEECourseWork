#! /bin/bash

# Created date: 13 Nov 2023
# Purpose: to learn how to calculate the length of a variable; substitution; touch files

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#----------------------------------------------

seq 10      # generate a sequence from 1 to 10, separated by lines

seq -s ":" 10    # from 1 to 10, in one line, separated by :    1:2:3:4:5:6:7:8:9:10

for num in {1..3};      # do three times - print out the 1^2^3^4^5^6^7^8^9^10 three times
do 
    # echo num
    str1=`seq -s "^" 10`;      # print out the variables  
    echo $str1;         # 1^2^3^4^5^6^7^8^9^10
done

#------------------------------
# substitute strings: 

str_my="Hello you you, i am your sister. "
echo $str_my

echo ${str_my/you/girl}        # substitute only once
echo ${str_my//you/girl}       # substitute all which match the 'you' into 'girl'
echo ${str_my/o/O}             # substitute only once, from o to O
echo ${str_my//o/O}            # substitute all, from o to O

#------------------------------
# create files: 
touch ../Mydata/yxy_{1..5}_finished.jpg    # numbered from 1 to 5, five files, with .jpg as appendix
touch ../Mydata/yxy_{1..5}_finished.png    # numbered from 1 to 5, five files, with .png as appendix

#---------------------------------------------
# important notes

# 语法
# name="yuchao"
# 该变量的值，有索引，分别是从 6，1，2，3，4开始
# ${变量}                  返回变量值
# ${#name}                  返回变量长度，字符长度-----
# ${变量：start)           返回変量start数値之后的字符，且包含start的数字
# ${变量：start:length}     提取start之后的1ength限制的字符，例如${name:4:1}
# ${变量#word}              从変量开类刪除晸短匹配的word子串 ${name:yu}
# ${变量##word}             从变量开头，删除最长匹配的word
# ${变量%word}              从变量结尾删除最短的word
# $(变量%%word}             从变量结尾开始删除最长匹配的word


# 替換
# ${变量/pattern/string}     用string代替第一个匹配的pattern
# ${变量//pattern/string}    用string代替所有的pattern           - can re-edit the file names


#--------------------------------------

# source: a Bilibili video  https://www.bilibili.com/video/BV1hu4y1N7AY/?p=15&spm_id_from=333.880.my_history.page.click 

