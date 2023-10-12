# Comprehension



x = [i for i in range(10)]
print(x)

x = []
for i in range(10):
    x.append(i)
print(x)

x = [i.lower() for i in ["LIST","COMPREHENSIONS","ARE","COOL"]]
print(x)

x = ["LIST","COMPREHENSIONS","ARE","COOL"]
for i in range(len(x)): # explicit loop
    x[i] = x[i].lower()
print(x)

x = ["LIST","COMPREHENSIONS","ARE","COOL"]
x_new = []
for i in x: # implicit loop
    x_new.append(i.lower())
print(x_new)


matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = []
for row in matrix:
    for n in row:
        flattened_matrix.append(n)
print(flattened_matrix)



matrix = [[1,2,3],[4,5,6],[7,8,9]]
flattened_matrix = [n for row in matrix for n in row]
print(flattened_matrix)


flatten_matrix = [n
                  for row in matrix
                  for n in row]

words = ["These", "are", "some", "words"]



first_letters = set()
for w in words:
    first_letters.add(w[0])

print(first_letters)

type(first_letters)

words = ["These", "are", "some", "words"]

first_letters = {w[0] for w in words} # note the curly brackets

print(first_letters)

type(first_letters)



## Finds just those taxa that are oak trees from a list of species

taxa = [ 'Quercus robur',
         'Fraxinus excelsior',
         'Pinus sylvestris',
         'Quercus cerris',
         'Quercus petraea',
       ]

def is_an_oak(name):
    return name.lower().startswith('quercus ')

##Using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species)
print(oaks_loops)

##Using list comprehensions   
oaks_lc = set([species for species in taxa if is_an_oak(species)])
print(oaks_lc)

##Get names in UPPER CASE using for loops
oaks_loops = set()
for species in taxa:
    if is_an_oak(species):
        oaks_loops.add(species.upper())
print(oaks_loops)

##Get names in UPPER CASE using list comprehensions
oaks_lc = set([species.upper() for species in taxa if is_an_oak(species)])
print(oaks_lc)


















