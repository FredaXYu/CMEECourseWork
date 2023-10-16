##############################################################
# My solution
##############################################################
import fileinput

# Two example sequences to match
seq2 = "ATCGCCGGATTACGGG"
seq1 = "CAATTCGGAT"

#########################################################################
# Input File

# I guess you assume the input file contains only two words, which are the longer seq and the shorter seq
# Let's assume that is a csv file...

# First, start with an existing file: 

# open(file, mode='r')

# input_file = ../Data/pythonalign_seq.csv
# print("It's here, read the file. ")


# Alternative method: https://zhuanlan.zhihu.com/p/341689095
# import fileinput

# def demo_fileinput():
#     with fileinput.input(['../Data/pythonalign_seq.txt']) as lines:    # no bug this line
#         new_lines = str(lines)
#         print("new_lines: ", new_lines)
#         print("type(lines): ", type(lines), "len(lines): ", len(lines))

#         blank_seq = []
#         for i in len(lines): 
#             blank_seq[i] = ""

#             print("Total the %d th line," % fileinput.lineno(),
#                   "File %s the %d th line" % (fileinput.filename(), fileinput.filelineno()))
#             print(line.strip())

#             blank_seq[i] = line.strip()

#     return blank_seq

# can work, printed out the first line as the first seq; the second line as the second seq            

# if __name__ == '__main__':
#     demo_fileinput()

#########################################################################

# Assign the longer sequence s1, and the shorter to s2
# l1 is length of the longest, l2 that of the shortest

l1 = len(seq1)
l2 = len(seq2)

print("After l1, l2")

if l1 >= l2:
    s1 = seq1  # me: s1 is the longer one
    s2 = seq2  # me: s2 is the shorter one
else: 
    s1 = seq2  # me: s1 is the longer one
    s2 = seq1  # me: s2 is the shorter one
    l1, l2 = l2, l1 # swap the two lengths

print("After comparison of lengths")
    
# me: Here, s1 is the longer one. l1 is the length of s1; l2 is the length of s2. 
########################################################

# A function that computes a score by returning the number of matches starting
# from arbitrary startpoint (chosen by user)


def calculate_score(s1, s2, l1, l2, startpoint):
    '''  me
    Parameters: 
        s1:
        s2:
        l1: 
        l2:
        startpoint: 
    Output: 
        score: 

    '''

    # initialisation: 
    matched = "" # to hold string displaying alignements
    score = 0
    
    for i in range(l2):   # me: for each character in the shorter 
        if (i + startpoint) < l1:  # me: if the startpoint chosen by user is within l1
            if s1[i + startpoint] == s2[i]: # if the bases match
            	# me: compare one by one
                matched = matched + "*"     # me: you are counting the matched, marking
                score = score + 1    # me: you are counting
            else:
                matched = matched + "-"    # me: you are counting the unmatched, marking

    # some formatted output
    print(" ")    

    print("." * startpoint + matched)   # me: print out the marked ****---**---**
            
    print("." * startpoint + s2)   # 
    
    print(s1)
    
    print(score) 
    
    print(" ")

    return score

# Test the function with some example starting points:
# calculate_score(s1, s2, l1, l2, 0)
# calculate_score(s1, s2, l1, l2, 1)
# calculate_score(s1, s2, l1, l2, 5)

# now try to find the best match (highest score) for the two sequences
my_best_align = None
my_best_score = -1

for i in range(l1): # Note that you just take the last alignment with the highest score
    z = calculate_score(s1, s2, l1, l2, i)
    if z > my_best_score:
        my_best_align = "." * i + s2 # think about what this is doing!
        my_best_score = z 
print(my_best_align)
print(s1)
print("Best score:", my_best_score)

##################################

# If we want to output the outcome into another file: 

# resource: https://blog.csdn.net/weixin_34162695/article/details/89010027




