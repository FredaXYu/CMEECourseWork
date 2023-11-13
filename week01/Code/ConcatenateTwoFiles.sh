#!/bin/bash

# https://mhasoba.github.io/TheMulQuaBio/notebooks/02-ShellScripting.html  tag: A useful shell-scripting example


cat $1 > $3
cat $2 >> $3
echo "Merged File is"
cat $3



 
