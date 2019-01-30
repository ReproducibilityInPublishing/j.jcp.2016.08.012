#for figure 5, extracting from table 1,2,3
with open('results.txt','r') as f:
    contents=f.readlines()

"split contents into parts"
it1=contents.index("******************** Gradient Slowness ***************************\n")
it2=contents.index("******************** Gradient Velocity ***************************\n")
it3=contents.index("******************** Gaussian factor ***************************\n")

t1=contents[it1:it2]
t2=contents[it2:it3]
t3=contents[it3:]

#indices of all the lines starting with "Timing is based on averaged..."
indices = [i for i, elem in enumerate(contents) if 'Timing is based' in elem]
#to get the lines with data
indices = [i+1 for i in indices]

for i in indices:
    #extracting linfinity and l2 errors for first and second orders
    string=contents[i]
    firstOrder=string.split('[',3)[3].split(']')[0]
    firstLinf=firstOrder.split(',')[0]
    firstL2=firstOrder.split(',')[1]

    secondOrder=string.split('[',3)[3].split(']')[1].split('[')[1]
    secondLinf=secondOrder.split(',')[0]
    secondL2=secondOrder.split(',')[1]

    print(firstLinf,firstL2,secondLinf,secondL2)

#contents.split("******************** 3D experiments ***************************")
