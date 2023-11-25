#! /bin/bash

# Created date: 25 Nov 2023
# Purpose: tail, printf

#----------------------------------------------------------------------------
# [IMPORTANT] Because this script is written under Windows system, 
# please ---- type and run the below line of sentence in command line before run this script: 
# sed -i 's/\r//' yxy_learn_bash2.sh
#--------------------------------

# show the last 10 lines and print: 
tail -n 10 ../Mydata/example.txt

echo "================"

# skip the first line and print: 
tail -n +2 ../Mydata/example.txt

echo "================"

# show the whole file: 
tail -n +1 ../Mydata/example.txt

echo "================"

printf "How-To " && printf "Geek\n"    # source: https://www.howtogeek.com/781474/how-to-use-the-bash-printf-command-on-linux/

printf '%s = %d\n' Lines 4

printf "Open issues: %s\nClosed issues: %s\n" "34" "65"


