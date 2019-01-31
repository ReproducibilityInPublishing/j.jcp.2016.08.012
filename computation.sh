#!/bin/bash

# Run experiments
./julia/bin/julia data/examples/runExperiments.jl $1 | tee results_$1.txt

# Check the extracted error results from table
./check.sh $1
