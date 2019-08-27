import sys
import csv
import traceback

def main_extract(contents):
    "split contents into parts"
    it1=contents.index("********************  Gradient Slowness  ***************************\n")
    it2=contents.index("********************  Gradient Velocity  ***************************\n")
    it3=contents.index("********************  Gaussian factor  *****************************\n")

    t1=contents[it1:it2]
    t2=contents[it2:it3]
    t3=contents[it3:]

    #indices of all the lines starting with "Timing is based on averaged..."
    indices = [i for i, elem in enumerate(contents) if 'Timing is based' in elem]
    #to get the lines with data
    indices = [i+1 for i in indices]

    expectedNumIndices = 3 * (int(sys.argv[1]) + int(sys.argv[2]))
    if len(indices) != expectedNumIndices:
        print('\033[31mError:\033[39m the number of data found doesn\'t match what\'s expected')
        sys.exit(1)

    results = []

    for i in indices:
        #extracting linfinity and l2 errors for first and second orders
        string=contents[i]
        firstOrder=string.split('[',3)[3].split(']')[0]
        firstLinf=float(firstOrder.split(',')[0])
        firstL2=float(firstOrder.split(',')[1])

        secondOrder=string.split('[',3)[3].split(']')[1].split('[')[1]
        secondLinf=float(secondOrder.split(',')[0])
        secondL2=float(secondOrder.split(',')[1])

        results.append(["{0:0.2e}".format(i) for i in [firstLinf,firstL2,secondLinf,secondL2]])

    return results


def extract_results():
    #for figure 5, extracting from table 1,2,3
    with open('results/results_{}_{}.txt'.format(sys.argv[1], sys.argv[2]),'r') as f:
        contents=f.readlines()

    results = main_extract(contents)
    with open('results/extracted_results_{}_{}.csv'.format(sys.argv[1], sys.argv[2]), 'w') as out:
        results_writer = csv.writer(out, delimiter=',', quotechar='"')
        for row in results:
            results_writer.writerow(row)


try:
    extract_results()
except Exception as e:
    print('\033[31mAn error occurred while trying to extract results:\033[39m')
    traceback.print_exc()
    sys.exit(1)


