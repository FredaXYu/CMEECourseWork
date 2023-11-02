# done

def buggyfunc(x):
    y = x

    for i in range(x):
        y = y-1
        if y != 0: 
            z = x/y
        elif y == 0:
            x = 0
            z = 0

    return z

print("buggyfunc(20)", buggyfunc(20))


