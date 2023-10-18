'''
https://mhasoba.github.io/TheMulQuaBio/notebooks/05-Python_I.html


Missing oaks problem

    Open and run the code oaks_debugme.py — there’s a bug, for no oaks are being found! (where’s TestOaksData.csv? — in the data directory of TheMulQuaBio repo!)

    Fix the bug (e.g., you could insert a debugging breakpoint using import ipdb; ipdb.set_trace())

    Now, write doctests to make sure that, bug or no bug, your is_an_oak function is working as expected (hint: >>> is_an_oak('Fagus sylvatica') should return False)

If you wrote good doctests, you will find another bug that you might not have by just debugging (hint: what happens if you try the doctest with “Quercuss” instead of “Quercus”? Should this pass or fail?).

    Modify your doctests approriately, and modify your script such that it can handle cases where there is a typo (such as ‘Quercuss’) or there is a genus name that is not strictly ‘Quercus’.

'''

'''

Goal guessed by me: to write a document to debug the directory bug. 

My methods: 

Method01: 
    Use print sentence btw each line of codes. 

    Pros: 
    (1) In this way, you can track the process of all the operations of codes just inside of the terminal. 
    (2) Other than using 'print' sentence, we can also insert some other sentences such as checking the types of variables, or others, to make sure that the codes are
    within our expectation. 

    Cons:  
    (1) Wordy. 
    (2) Not systematic (not embedded by the software). 

    The terminal may seems wordy, but later you can delete these sentences. 

Method02: 

缺少橡树问题

     打开并运行代码 Oaks_debugme.py — 有一个错误，因为没有找到 Oaks！ （TestOaksData.csv 在哪里？ - 在 TheMulQuaBio 存储库的数据目录中！）

     修复错误（例如，您可以使用 import ipdb; ipdb.set_trace() 插入调试断点）

     现在，编写文档测试以确保，无论有没有错误，您的 is_an_oak 函数都按预期工作（提示：>>> is_an_oak('Fagus sylvatica') 应该返回 False）

如果您编写了好的文档测试，您将发现另一个仅通过调试可能不会遇到的错误（提示：如果您尝试使用“Quercuss”而不是“Quercus”进行文档测试，会发生什么？这应该通过还是失败？）。

     适当修改您的文档测试，并修改您的脚本，以便它可以处理存在拼写错误（例如“Quercuss”）或存在严格意义上不是“Quercus”的属名的情况。

'''


import csv
import sys

# my codes: 
import doctest
import re


input_file_path = doctest.testfile("../Data/example.txt")   # can pass 15 Oct 
output_file_path = doctest.testfile("../Data/output.txt") 

def file_open(this_file):  
    file_open = open(file_path, 'r') 
    file_output = open('../Data/output.txt','w')

#Define function
def is_an_oak(name):
    '''
    Goal of this function guessed by me: 
        Determine whether the name input starts with 'quercs', ignoring uppercase/lowercase. 

    Task: 
        to make sure that this function can work
    '''
    """ Returns True if name is starts with 'quercus' """

    name

    return name.lower().startswith('quercs')


def main(argv): 
    f = open('../Data/TestOaksData.csv','r')      # original codes, bug, being told by teacher. I have adapted the 'data' to 'Data'
    # The method to ressolve this bug: download the TestOaksData.csv from Dr. Pawar's Github repository. 

    g = open('../Data/JustOaksData.csv','w')    # I have adapted the 'data' to 'Data'
    taxa = csv.reader(f)
    csvwrite = csv.writer(g)
    oaks = set()
    for row in taxa:
        print(row)
        print ("The genus is: ") 
        print(row[0] + '\n')
        if is_an_oak(row[0]):
            print('FOUND AN OAK!\n')
            csvwrite.writerow([row[0], row[1]])    

    return 0
    
if (__name__ == "__main__"):
    status = main(sys.argv)



