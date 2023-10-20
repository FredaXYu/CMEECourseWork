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


def key_value_sepa_to_two(list_key, list_value): 
        returned_list = []
        if len(list_key == list_value): 
                each_pair = []
                for i in range(len(list_key)): 
                        each_pair.append(list_key[i], list_value[i])
                print("each_pair", each_pair)        

                # try
                returned_list.append(each_pair)

                return returned_list
        else: 
                return False
                


# map to not a set, but a list
def map_order_to_list(dic):    # ok
        thing_return_two_key_value = []
        dic_keys = []
        output_list_key = []
        output_list_value = []
        # for each in taxa_dic: 
        #         print("type(each)", type(each))    # <class 'str'>
        #         print("each", each)         # Myotis lucifugus
        #         output_list_key.append(each.key)
        #         output_list_value.append(each.value)

        # for i in range(len(taxa_dic)): 
        #         print("bbbbbb")
        #         print("The dict name: ", taxa_dic[i])
        #         print("taxa_dic[i]", taxa_dic[])
        #         print("type(taxa_dic[i])", type(taxa_dic[i]))    # <class 'str'>
        #         print("taxa_dic[i]", taxa_dic[i])         # Myotis lucifugus
        #         output_list_key.append(taxa_dic[i].key)
        #         output_list_value.append(taxa_dic[i].value)

        taxa_in_list = list(taxa_dic.values())
        output_list_value = taxa_in_list

        print(taxa_dic.values())
        print("taxa_in_list", taxa_in_list)

        for each in taxa_dic: 
                print("bbbbbb")
                print("taxa_dic[each]", taxa_dic[each])     # have this 
                print("type(taxa_dic[each])", type(taxa_dic[each]))    # <class 'str'>
                # print("taxa_dic[each]", taxa_dic[each].key())              

                # output_list_key.append(taxa_dic[each].key)    # don't have this kind of syntax
                output_list_value.append(taxa_dic[each])  

                two_key_value.append(each)

        dic_keys = dic.keys()
        print("dic_keys: ", dic_keys)   # can pass 20 Oct 14:59

        output_list_key = list(dic_keys)

        print("output_list_key", output_list_key)    # can pass 20 Oct 14:59
        print("output_list_value", output_list_value)     # can pass 20 Oct 14:59

        print("output_list_key", output_list_key)  # this works, it's a list 

        output_list_value

        # thing_return.append(output_list_key)
        # thing_return.append(output_list_value)

        print("here")


        return key_value_sepa_to_two



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

##marks = {'Physics':67, 'Maths':87}

# print(marks.values())
# Output: dict_values([67, 87])
