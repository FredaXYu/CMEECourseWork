#!/bin/bash

# the FASTA practical coursework

# https://mhasoba.github.io/TheMulQuaBio/notebooks/01-Unix.html


##########################################################################################

# test 
echo -e "\nThis is a shell script! \n"


# Count how many lines there are in each file - FASTA file
# 1. Count how many lines in one file: 
wc -l


echo wc -l *


# Print everything starting from the second line for the E. coli genome
# 在linux中，常常会碰到第一行是列名的情况，我们只需要其中的数据作为后续代码的参数，因此只需要读取文件的第2行至末行。 
# cr. https://zhuanlan.zhihu.com/p/625407491#:~:text=1%20cat%20txt.txt%EF%BC%9A%E5%B0%86%E6%96%87%E4%BB%B6%E5%86%85%E5%AE%B9%E8%BE%93%E5%87%BA%E5%88%B0%E6%A0%87%E5%87%86%E8%BE%93%E5%87%BA%EF%BC%88%E4%B9%9F%E5%B0%B1%E6%98%AF%E7%BB%88%E7%AB%AF%E5%B1%8F%E5%B9%95%EF%BC%89%E3%80%82%202%20%7C%EF%BC%9A%E7%AE%A1%E9%81%93%E7%AC%A6%EF%BC%8C%E5%B0%86%E5%89%8D%E4%B8%80%E4%B8%AA%E5%91%BD%E4%BB%A4%E7%9A%84%E8%BE%93%E5%87%BA%E4%BD%9C%E4%B8%BA%E5%90%8E%E4%B8%80%E4%B8%AA%E5%91%BD%E4%BB%A4%E7%9A%84%E8%BE%93%E5%85%A5%E3%80%82%203%20tail,-n%20%2B2%EF%BC%9A%E4%BB%8E%E8%BE%93%E5%85%A5%E4%B8%AD%E6%98%BE%E7%A4%BA%E4%BB%8E%E7%AC%AC2%E8%A1%8C%E5%BC%80%E5%A7%8B%E5%88%B0%E6%9C%AB%E8%A1%8C%E7%9A%84%E5%86%85%E5%AE%B9%E3%80%82%20%E5%85%B6%E4%B8%AD%EF%BC%8C-n%E9%80%89%E9%A1%B9%E7%94%A8%E4%BA%8E%E6%8C%87%E5%AE%9A%E8%A6%81%E6%98%BE%E7%A4%BA%E7%9A%84%E8%A1%8C%E6%95%B0%EF%BC%8C%2B2%E8%A1%A8%E7%A4%BA%E4%BB%8E%E7%AC%AC2%E8%A1%8C%E5%BC%80%E5%A7%8B%E3%80%82%204%20%3E%20%3A%20%E5%B0%86%E5%86%85%E5%AE%B9%E9%87%8D%E5%AE%9A%E5%90%91%E8%87%B3%E6%96%B0%E6%96%87%E4%BB%B6%E3%80%82
# Use -n to show the line number of the match
tail -n +2 E.coli.fasta

# Count the sequence length of this genome
wc E.coli.fasta

# Count the matches of a particular sequence, “ATGC” in the genome of E. coli (hint: Start by removing the first line and 
# ######## IMPORTANT removing newline characters)
# hint: Start by removing the first line and removing newline characters????
grep -o  | wc


# grep's -o will only output the matches, ignoring lines; wc can count them: grep -o 'needle' file | wc -l 
# (cr. https://unix.stackexchange.com/questions/6979/count-total-number-of-occurrences-using-grep#:~:text=grep%27s%20-o%20will%20only%20output%20the%20matches%2C%20ignoring,-l%20grep%20-o%20%27%3Cneedle%3E%27%20file%20%7C%20wc%20-l)


# Compute the AT/GC ratio. That is, the (A+T)/(G+C) ratio (as a single number). This is a summary 
# measure of base composition of double-stranded DNA. DNA from different organisms and lineages has 
# different ratios of the A-to-T and G-to-C base pairs (google “Chargaff’s rule”). For example, DNA 
# from organisms that live in hot springs have a higher GC content, the GC base pair is more thermally stable.






