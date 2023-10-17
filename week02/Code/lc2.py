# Average UK Rainfall (mm) for 1910 by month
# http://www.metoffice.gov.uk/climate/uk/datasets
rainfall_tuple = (('JAN',111.4),
            ('FEB',126.1),
            ('MAR', 49.9),
            ('APR', 95.3),
            ('MAY', 71.8),
            ('JUN', 70.2),
            ('JUL', 97.1),
            ('AUG',140.2),
            ('SEP', 27.0),
            ('OCT', 89.4),
            ('NOV',128.4),
            ('DEC',142.2),
           )

# About tuple, tuple.index(value)

# First step, figure out the list comprehension of lists: 
rainfall_list = [['JAN',111.4],    # x is ['JAN',111.4]
                 ['FEB',126.1],
                 ['MAR', 49.9], 
                 ['APR', 95.3], 
                 ['MAY', 71.8], 
                 ['JUL', 97.1], 
                 ['AUG',140.2], 
                 ['SEP', 27.0], 
                 ['OCT', 89.4], 
                 ['NOV',128.4], 
                 ['DEC',142.2]]
        

##################################################################################
# FORMULA: new_list = [expresion_for_member for member in iterable if condition]
##################################################################################

# (1) Use a list comprehension to create a list of month, rainfall tuples where
# the amount of rain was greater than 100 mm.

# our goal is like 
# ('JAN', 'FEB', 'AUG', 'NOV', 'DEC')
# (111.4, 126.1, 140.2, 128.4, 142.2)

##########################################################################


month_tuple_output = (x[0] for x in rainfall_tuple if x[1]>100)  # my question


##########################################################################

print("month_tuple_output: ", month_tuple_output)
rainfall_tuple_output = ()

#################################  goooooooooooooood!!!!!!!!!!!! #################
month_list_output = [x[0] for x in rainfall_list if x[1]>100]     # what is x
print("month_list_output: ", month_list_output)
#################################  goooooooooooooood!!!!!!!!!!!! #################

rainfall_list_output = []

# month_list_output

###########################################################################################
###########################################################################################
###########################################################################################

# (2) Use a list comprehension to create a list of just month names where the
# amount of rain was less than 50 mm. 






###########################################################################################
###########################################################################################
###########################################################################################

# (3) Now do (1) and (2) using conventional loops (you can choose to do 
# this before 1 and 2 !). 

# A good example output is:
#
# Step #1:
# Months and rainfall values when the amount of rain was greater than 100mm:
# [('JAN', 111.4), ('FEB', 126.1), ('AUG', 140.2), ('NOV', 128.4), ('DEC', 142.2)]
# ... etc.





