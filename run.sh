#!/bin/bash
set -e

# Simple run to make sure does not crash
./julia/bin/julia data/examples/runfirst.jl

# Run experiments to check output
./julia/bin/julia data/examples/runExperiments.jl | tee results.txt

# Check the extracted error results from table
./check.sh
