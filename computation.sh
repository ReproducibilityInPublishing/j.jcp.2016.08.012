#!/bin/bash

# Run experiments
/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia data/examples/runExperiments.jl $1 | tee results_$1.txt
# Check the extracted error results from table
./check.sh $1
