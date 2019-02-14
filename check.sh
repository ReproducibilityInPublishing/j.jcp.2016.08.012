#!/bin/bash

python2 code_directory/data/examples/extract_results.py $1 > extracted_results_$1.txt
diff expected_extracted_results_$1.txt extracted_results_$1.txt
