#! /bin/bash

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#----------------------------------------------------------------------------
# practice of bash

no1=4
no2=5
result=no1+no2
echo $result
  
echo "Have printed out something, this can run"

your_name="qryyx"
echo $your_name
echo ${your_name}


myUrl="https://www.google.com"
readonly myUrl
myUrl="https://www.runoob.com"

# source: https://www.runoob.com/linux/linux-shell-variable.html