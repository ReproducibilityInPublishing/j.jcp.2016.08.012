#!/bin/bash

python2 examples/extract_results.py $1 $2
python2 examples/check_results.py $1 $2
