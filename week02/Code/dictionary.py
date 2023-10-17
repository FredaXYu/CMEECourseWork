import ast    # actually not useful. It is for the formatting of the dictionary


taxa = [ ('Myotis lucifugus','Chiroptera'),
         ('Gerbillus henleyi','Rodentia',),
         ('Peromyscus crinitus', 'Rodentia'),
         ('Mus domesticus', 'Rodentia'),
         ('Cleithrionomys rutilus', 'Rodentia'),
         ('Microgale dobsoni', 'Afrosoricida'),
         ('Microgale talazaci', 'Afrosoricida'),
         ('Lyacon pictus', 'Carnivora'),
         ('Arctocephalus gazella', 'Carnivora'),
         ('Canis lupus', 'Carnivora'),
        ]

# Write a python script to populate a dictionary called taxa_dic derived from
# taxa so that it maps order names to sets of taxa and prints it to screen.
#                      Chiroptera      set(['Myotis lucifugus'])
#
# An example output is:
#  
# 'Chiroptera' : set(['Myotis lucifugus']) ... etc. 
# OR, 
# 'Chiroptera': {'Myotis  lucifugus'} ... etc

######################################## Your solution here #### 
# We assume your input is a dictionary with the format of 
# d = {key1 : value1, key2 : value2 }    # https://www.runoob.com/python/python-dictionary.html
# So, the correct dictionary of the taxa should be: 
taxa_dic = {'Myotis lucifugus': 'Chiroptera',
         'Gerbillus henleyi': 'Rodentia',
         'Peromyscus crinitus': 'Rodentia', 
         'Mus domesticus': 'Rodentia',
         'Cleithrionomys rutilus': 'Rodentia',
         'Microgale dobsoni': 'Afrosoricida',
         'Microgale talazaci': 'Afrosoricida',
         'Lyacon pictus': 'Carnivora',
         'Arctocephalus gazella': 'Carnivora',
         'Canis lupus': 'Carnivora' 
        }    # now this is the input data

# taxa_dic_ast = "{'Myotis lucifugus': 'Chiroptera',
#          'Gerbillus henleyi': 'Rodentia',
#          'Peromyscus crinitus': 'Rodentia', 
#          'Mus domesticus': 'Rodentia',
#          'Cleithrionomys rutilus': 'Rodentia',
#          'Microgale dobsoni': 'Afrosoricida',
#          'Microgale talazaci': 'Afrosoricida',
#          'Lyacon pictus': 'Carnivora',
#          'Arctocephalus gazella': 'Carnivora',
#          'Canis lupus': 'Carnivora',}"    # now this is the input data


# map to not a set, but a list
def map_order_to_list(dic): 
        thing_return = []
        output_list_key = []
        output_list_value = []
        # for each in taxa_dic: 
        #         print("type(each)", type(each))    # <class 'str'>
        #         print("each", each)         # Myotis lucifugus
        #         output_list_key.append(each.key)
        #         output_list_value.append(each.value)

        for i in range(len(taxa_dic)): 
                print("type(taxa_dic[i])", type(taxa_dic[i]))    # <class 'str'>
                print("taxa_dic[i]", taxa_dic[i])         # Myotis lucifugus
                output_list_key.append(taxa_dic[i].key)
                output_list_value.append(taxa_dic[i].value)

        print("output_list_key", output_list_key)
        print("output_list_value", output_list_value)
        thing_return.append(output_list_key, output_list_value)

        return thing_return

map_order_to_list(taxa_dic)

######################

####### ERROR: 'str' object has no attribute 'key' https://cloud.tencent.com/developer/ask/sof/693039

######################

# then convert this list into set 


##########################################################################################

# Now write a list comprehension that does the same (including the printing after the dictionary has been created)  
 
#### Your solution here #### 







# Notes: 
# 字典的每一个元素是str


