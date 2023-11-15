#!/bin/sh

# Goal: improving the script to check the number of parameters that our user has input in the command line

# https://mhasoba.github.io/TheMulQuaBio/notebooks/02-ShellScripting.html  tag: A useful shell-scripting example

# References: 
# Shell——判断传入参数的个数 author:geekzw https://blog.csdn.net/zichen_ziqi/article/details/117828548 
 
if [ $# -eq 3 ];
then
    cat $1 > $3      # give the $1 file to $3, with erasing $3 file
    cat $2 >> $3     # and, append the content in $2 to $3 file
    echo "Merged File is"    # show
    cat $3        # the merged file

    exit
else
	echo "ERROR: You must input three file names as three parameters. "
    # or, we can define some default parameters: (not done yet)
fi

# Example input 01: bash improving_ConcatenateTwoFiles.sh
# Example output 01: ERROR: You must input three file names as three parameters.

# Example input 02: bash improving_ConcatenateTwoFiles.sh ../Mydata/001.txt ../Mydata/002.txt ../Mydata/003.txt
# Example output 02: Merged File is asdfghjkmnbvc




