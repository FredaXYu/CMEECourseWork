
# Created date: 13 Nov 2023
# Purpose: the embedded operations; the many ways to execute a bash file


# source yxy_learn_bash4.sh

# . yxy_learn_bash4.sh

# bash yxy_learn_bash4.sh

# ./yxy_learn_bash4.sh

who

echo "Here"

echo $HOME 
echo $USER 
echo $PWD 
echo $SHELL

readonly B=4
echo $B 
B=5     # can't do this, since B is readonly

R=6
Y=8
K=39

echo $#   # 获取所有输入参数的个数，常用于循环 ?????

echo "Now the time is $(date)"
# $()  

echo "Now the user is `whoami`"
#  ` `

# ${vars} 取出变量结果 take the outcome of a variable
# $vars   取出变量结果 take the outcome of a variable
# # $()  在括号中执行命令，且拿到命令的执行结果 execute the operation inside of the brackets, and take the outcome of that operation
# ` `   在括号中执行命令，且拿到命令的执行结果
# () 开启子shell执行命令结果 


