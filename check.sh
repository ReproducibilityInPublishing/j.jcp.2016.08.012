#!/bin/bash

python data/examples/extract_results.py > extracted_results.txt
diff expected_extracted_results.txt extracted_results.txt
