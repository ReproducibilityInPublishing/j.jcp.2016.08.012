#!/bin/bash

python2 examples/extract_results.py $1 $2 > extracted_results_$1_$2.txt
diff expected_extracted_results_$1.txt extracted_results_$1_$2.txt
