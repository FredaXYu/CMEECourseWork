#!/bin/sh

MSG1="Hello"
MSG2=$USER            # yxy1028
echo "$MSG1 $MSG2"    # Hello yxy1028
echo "Hello $USER"
echo

# This introduces you to the $USER (same as $USERNAME) environmental variable.

###### command line, windows WSL ######
# yxy1028@DESKTOP-9D7BS8T:/mnt/c/Users/yxy/Github_desktop/CMEECourseWork/week01/Code$ bash MyExampleScript.sh
# MyExampleScript.sh: line 2: $'\r': command not found
#  yxy1028
# Hello yxy1028
# MyExampleScript.sh: line 7: $'echo\r': command not found
# MyExampleScript.sh: line 8: $'\r': command not found
