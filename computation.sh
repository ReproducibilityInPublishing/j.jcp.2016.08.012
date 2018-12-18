#!/bin/bash

# Run experiments
./julia/bin/julia data/examples/runExperiments.jl | tee results.txt

# Check the extracted error results from table
./check.sh
