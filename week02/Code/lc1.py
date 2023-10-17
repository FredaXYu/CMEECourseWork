birds = ( ('Passerculus sandwichensis','Savannah sparrow',18.7),
          ('Delichon urbica','House martin',19),
          ('Junco phaeonotus','Yellow-eyed junco',19.5),
          ('Junco hyemalis','Dark-eyed junco',19.6),
          ('Tachycineata bicolor','Tree swallow',20.2),
         )


print(type(birds))   # tuple
print(len(birds))
print(type(birds[0]))   # tuple
print(len(birds[0]))

# print(birds[0][0])    # test, can work

#(1) Write three separate list comprehensions that create three different
# lists containing the latin names, common names and mean body masses for
# each species in birds, respectively. 

# ??????????????????????????????????   

latin = [x for x in birds[x][0]]

print(latin)


# (2) Now do the same using conventional loops (you can choose to do this 
# before 1 !). 

def conventional_loops_solution(list_latin): 
    print("Conventional method: ")
    alt_latin = []
    alt_common_names = []
    alt_mean_body_mass = []

    for each in birds: 
        print("Step #1: ")
        print("Latin names: ")
        alt_latin.append(each[0])
        print("Common names: ")
        alt_common_names.append(each[1])
        print("Mean body mass: ")
        alt_mean_body_mass.append(each[2])

    return alt_latin, alt_common_names, alt_mean_body_mass
    
print(conventional_loops_solution(birds))

    # A nice example out out is:
    # Step #1:
    # Latin names:
    # ['Passerculus sandwichensis', 'Delichon urbica', 'Junco phaeonotus', 'Junco hyemalis', 'Tachycineata bicolor']
    # ... etc.
 