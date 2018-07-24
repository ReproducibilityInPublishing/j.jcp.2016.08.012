import re

#for figure 5, extracting from table 1,2,3
string="[0.0250,0.0250] [161,321]   [3.71e-03,9.42e-04] 0.04s(191.29)   [9.33e-05,9.26e-06] 0.04s(164.59)"
firstOrder=string.split('[',3)[3].split(']')[0]
firstLinf=firstOrder.split(',')[0]
firstL2=firstOrder.split(',')[1]

secondOrder=string.split('[',3)[3].split(']')[1].split('[')[1]
secondLinf=secondOrder.split(',')[0]
secondL2=secondOrder.split(',')[1]

print(firstLinf,firstL2)
print(secondLinf,secondL2)
