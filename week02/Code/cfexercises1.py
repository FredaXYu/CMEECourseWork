# https://mhasoba.github.io/TheMulQuaBio/notebooks/05-Python_I.html#writing-a-program-with-control-flows
# Teacher's goal: to make it a module


def foo_1(x):
    return x ** 0.5

def foo_2(x, y):
    if x > y:
        return x
    return y

def foo_3(x, y, z):
    if x > y:
        tmp = y
        y = x
        x = tmp
    if y > z:
        tmp = z
        z = y
        y = tmp
    return [x, y, z]

def foo_4(x):
    result = 1
    for i in range(1, x + 1):
        result = result * i
    return result

###################################################################

def foo_5(x): # a recursive function that calculates the factorial of x
    if x == 1:
        return 1
    elif x == 0: 
        return 1     # pass
    # TASK: modify to calcuate the factorial of 0
    return x * foo_5(x - 1)

print("foo_5(1)", foo_5(1))   # pass
print("foo_5(3)", foo_5(3))   # pass
print("foo_5(0)", foo_5(0))  

###################################################################
     
def foo_6(x): # Calculate the factorial of x in a different way; no if statement involved
    facto = 1
    while x >= 1:
        facto = facto * x
        x = x - 1
    if x == 0: 
        facto = 0
        x = 0

    # TASK: modify to calcuate the factorial of 0

    # return facto   # teacher's return
    return [facto, x]

print("foo_6(3)", foo_6(3))
print("foo_6(0)", foo_6(0))






