#!/bin/bash

# Run experiments\
case "$OSTYPE" in
	linux*) ./julia/bin/julia code/data/examples/runExperiments.jl $1 $2 | tee results_$1_$2.txt ;;
    darwin*) /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia code/data/examples/runExperiments.jl $1 $2 | tee results_$1_$2.txt ;;
    win*) %JULIA_HOME%/bin/julia code/data/examples/runExperiments.jl $1 $2 | tee results_$1_$2.txt ;;
esac
#./julia/bin/julia data/examples/runExperiments.jl $1 | tee results_$1.txt
# Check the extracted error results from table
./check.sh $1 $2
