#!/bin/bash
 
# source: https://linuxopsys.com/topics/bash-script-examples 


a=10
b=2
 
echo "$a + $b: $((a+b))"
echo "$a - $b: $((a-b))"
echo "$a * $b: $((a*b))"
echo "$a / $b: $((a/b))"

echo "$a"   # 10
echo "$2"   # can't print out anything

# echo "$a + $b: $(a+b)"    # wrong! 
# To make bash understand that we want to carry out the arithmetic operation we need to surround 
# the entire expression by the dollar symbol followed by the double parentheses (()). 