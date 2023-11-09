#!/bin/bash

# yxy learn Linux bash
# Created time: 9 Nov 2023

# Linux指令大全：
# https://www.runoob.com/linux/linux-command-manual.html


# tr 转换或删除文件中的字符

# tr [-cdst][--help][--version][第一字符集][第二字符集]  
# -c, --complement：反选设定字符。也就是符合 SET1 的部份不做处理，不符合的剩余部份才进行转换
# -d, --delete：删除指令字符
# -s, --squeeze-repeats：缩减连续重复的字符成指定的单个字符
# -t, --truncate-set1：削减 SET1 指定范围，使之与 SET2 设定长度相等

cat testfile.txt |tr a-z A-Z      # same as cat testfile.txt |tr [:lower:] [:upper:] 

#----------------------------------
# cat
# 把 textfile1 的文档内容加上行号后输入 textfile2 这个文档里：
cat -n testfile.txt > testfile2.txt

# 把 textfile1 和 textfile2 的文档内容加上行号（空白行不加）之后将内容附加到 textfile3 文档里：
cat -b testfile.txt testfile2.txt >> testfile3.txt

echo "=====testfile3 created. ====="

#--------------------------------------
# find

# 查找当前目录下名为 testfile.txt 的文件：
find . -name testfile.txt
echo "===== found. ====="
# 将当前目录及其子目录下所有文件后缀为 .c 的文件列出来:
find . -name "*.sh"
echo "===== found .sh ====="

# 将当前目录及其子目录中的所有文件列出：
find . -type f
# 查找 /home 目录下大于 1MB 的文件：
# find /home -size +1M
# # 查找 /var/log 目录下在 7 天前修改过的文件：
# find /var/log -mtime +7
echo "===== found ====="

#------------------------------
# if else
# https://www.runoob.com/linux/linux-shell-process-control.html

a=10
b=20 
if [ $a == $b ]     # square brackets
then
    echo "a 等于 b"
elif [ $a -gt $b ]   # -gt is greater than
then
    echo "a 大于 b"
elif [ $a -lt $b ]   # -lt is less than
then
    echo "a 小于 b"
else
    echo "没有符合的条件"
fi           # if   fi   
#####

a=56
b=20
if (( $a == $b ))
then
    echo "a 等于 b"
elif (( $a > $b ))
then
    echo "a 大于 b"
elif (( $a < $b ))
then
    echo "a 小于 b"
else
    echo "没有符合的条件"
fi

###
# if else 语句经常与 test 命令结合使用，如下所示：
num1=$[2*3]
num2=$[1+5]
if test $[num1] -eq $[num2]
then
    echo 'These two numbers are equal! '
else
    echo 'These two numbers are NOT equal! '
fi

#-----------------------
# for loop
for loop in 1 2 3 4 5
do
    echo "The value is: $loop"   # print out the iterator each time
done           # for   done








