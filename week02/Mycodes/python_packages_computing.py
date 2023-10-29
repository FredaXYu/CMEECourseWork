
# Biological Computing in Python II
# https://mhasoba.github.io/TheMulQuaBio/notebooks/06-Python_II.html

import numpy as np
import scipy as sc
from scipy import stats
import scipy.integrate as integrate
import matplotlib.pylab as p

a = np.random.seed(1234)
b = sc.stats.norm.rvs(size = 10)

print(b)

np.random.seed(1234)
sc.stats.norm.rvs(size = 10)

sc.stats.norm.rvs(size=5, random_state=1234)

sc.stats.randint.rvs(0, 10, size = 7)

sc.stats.randint.rvs(0, 10, size = 7, random_state=1234)

sc.stats.randint.rvs(0, 10, size = 7, random_state=3445) # a different seed

y = np.array([5, 20, 18, 19, 18, 7, 4]) # The y values; can also use a python list here

p.plot(y)

area = integrate.trapz(y, dx = 2)
print("area =", area)

area = integrate.trapz(y, dx = 1)
print("area =", area)

area = integrate.trapz(y, dx = 3)
print("area =", area)

area = integrate.simps(y, dx = 2)
print("area =", area)

area = integrate.simps(y, dx = 1)
print("area =", area)

area = integrate.simps(y, dx = 3)
print("area =", area)






