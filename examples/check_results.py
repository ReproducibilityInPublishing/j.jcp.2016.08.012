import sys
import csv

nrows_2d = int(sys.argv[1])
nrows_3d = int(sys.argv[2])

def get_row_string(row):
    result = ""
    for i in range(4):
        result += "{0:0.2e} ".format(row[i])
    return result

# Open and load article results

article_results = []

with open('expected_output/article_results.csv', 'r') as article_results_file:
    article_results_reader = csv.reader(article_results_file, delimiter=',', quotechar='"')
    for row in article_results_reader:
        article_results.append([float(row[0]),float(row[1]),float(row[2]),float(row[3])])

# Open and load computed results

computed_results = []

with open('extracted_results_{}_{}.csv'.format(nrows_2d, nrows_3d), 'r') as computed_results_file:
    computed_results_reader = csv.reader(computed_results_file, delimiter=',', quotechar='"')
    for row in computed_results_reader:
        computed_results.append([float(row[0]),float(row[1]),float(row[2]),float(row[3])])

tolerance = 1e-1
article_result_idx = 0
computed_result_idx = 0

failed = False

# 2D tables

for i in range(3):
    for j in range(nrows_2d):
        # Fetch article and computed results
        article_row = article_results[article_result_idx]
        computed_row = computed_results[computed_result_idx]
        # Compare
        row_failed = False
        for k in range(4):
            if abs(computed_row[k]-article_row[k])/article_row[k] > tolerance:
                row_failed = True
                failed = True
        if row_failed:
            print("row {} of table {} was beyond tolerance. Expected: {}".format(j+1,i+1,get_row_string(article_row)))
            print("                                       Computed: {}".format(get_row_string(computed_row)))
        article_result_idx += 1
        computed_result_idx += 1
    article_result_idx += 6-nrows_2d

# 3D tables
for i in range(3):
    for j in range(nrows_3d):
        # Fetch article and computed results
        article_row = article_results[article_result_idx]
        computed_row = computed_results[computed_result_idx]
        # Compare
        row_failed = False
        for k in range(4):
            if abs(computed_row[k]-article_row[k])/article_row[k] > tolerance:
                row_failed = True
                failed = True
        if row_failed:
            print("row {} of table {} was beyond tolerance. Expected: {}".format(j+1,i+4,get_row_string(article_row)))
            print("                                       Computed: {}".format(get_row_string(computed_row)))
        article_result_idx += 1
        computed_result_idx += 1
    article_result_idx += 5-nrows_3d

if failed:
    sys.exit(1)
else:
    sys.exit(0)
