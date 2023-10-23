_a_global = 10 # a global variable

if _a_global >= 5:
    _b_global = _a_global + 5 # also a global variable
    
print("Before calling a_function, outside the function, the value of _a_global is", _a_global)
print("Before calling a_function, outside the function, the value of _b_global is", _b_global)

def a_function():
    _a_global = 4 # a local variable
    
    if _a_global >= 4:
        _b_global = _a_global + 5 # also a local variable
    
    _a_local = 3
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value of _b_global is", _b_global)
    print("Inside the function, the value of _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global is (still)", _a_global)
print("After calling a_function, outside the function, the value of _b_global is (still)", _b_global)
print("After calling a_function, outside the function, the value of _a_local is ", _a_local)

############################

# Before calling a_function, outside the function, the value of _a_global is 10
# Before calling a_function, outside the function, the value of _b_global is 15
# Inside the function, the value of _a_global is 4
# Inside the function, the value of _b_global is 9
# Inside the function, the value of _a_local is 3
# After calling a_function, outside the function, the value of _a_global is (still) 10
# After calling a_function, outside the function, the value of _b_global is (still) 15

#########################

_a_global = 10

def a_function():
    _a_local = 4
    
    print("Inside the function, the value _a_local is", _a_local)
    print("Inside the function, the value of _a_global is", _a_global)
    
a_function()

print("Outside the function, the value of _a_global is", _a_global)

########################

# Inside the function, the value _a_local is 4
# Inside the function, the value of _a_global is 10
# Outside the function, the value of _a_global is 10

#######################

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

#######################

# Before calling a_function, outside the function, the value of _a_global is 10
# Inside the function, the value of _a_global is 5
# Inside the function, the value _a_local is 4
# After calling a_function, outside the function, the value of _a_global now is 5

########################

def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)

#####################

# Before calling a_function2, value of _a_global is 10
# After calling a_function2, value of _a_global is 10
# The value of a_global in main workspace / namespace now is 20

######################

_a_global = 10

print("Before calling a_function, outside the function, the value of _a_global is", _a_global)

def a_function():
    global _a_global
    _a_global = 5
    _a_local = 4
    
    print("Inside the function, the value of _a_global is", _a_global)
    print("Inside the function, the value _a_local is", _a_local)
    
a_function()

print("After calling a_function, outside the function, the value of _a_global now is", _a_global)

##########################

# Before calling a_function, outside the function, the value of _a_global is 10
# Inside the function, the value of _a_global is 5
# Inside the function, the value _a_local is 4
# After calling a_function, outside the function, the value of _a_global now is 5

#########################

def a_function():
    _a_global = 10

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)
    
a_function()

print("The value of a_global in main workspace / namespace now is", _a_global)

###########################

# Before calling a_function2, value of _a_global is 10
# After calling a_function2, value of _a_global is 10
# The value of a_global in main workspace / namespace now is 20

##########################


_a_global = 10

def a_function():

    def _a_function2():
        global _a_global
        _a_global = 20
    
    print("Before calling a_function2, value of _a_global is", _a_global)

    _a_function2()
    
    print("After calling a_function2, value of _a_global is", _a_global)

a_function()

print("The value of a_global in main workspace / namespace is", _a_global)

######################

# Before calling a_function2, value of _a_global is 10
# After calling a_function2, value of _a_global is 20
# The value of a_global in main workspace / namespace is 20

#####################

