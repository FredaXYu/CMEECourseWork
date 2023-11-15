#! /bin/bash

# Created date: 13 Nov 2023
# Purpose:      :-       :=

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#--------------------------------
# :- 
unset chaoge
unset result

echo $chaoge $result       # empty
result=${chaoge:-apple}     # since the chaoge is empty, therefore give apple to result
echo $result      # apple
echo $chaoge      # still empty
#------------------------
# :- 
echo "Now it's a new case. "

chaoge=180
result2=${chaoge:-apple}     # since the chaoge is not empty, therefore give chaoge to result2  result2=${chaoge}
echo $result2      # 180, since now result2=${chaoge}
echo $chaoge      # 180, we assigned the value

#------------------------
# :=
# 如果变量为空，则后面的值赋值给接收者以及变量本身
echo "Now it's a new case. "

unset chaoge1
unset result1

echo $chaoge1 $result1       # empty
result1=${chaoge1:=apple}    
echo $result1    # apple
echo $chaoge1    # apple



#--------------------------------------

# source: a Bilibili video  https://www.bilibili.com/video/BV1hu4y1N7AY/?p=15&spm_id_from=333.880.my_history.page.click 

