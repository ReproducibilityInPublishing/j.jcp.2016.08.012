#!/bin/bash

echo -e "\033[96mRunning experiments...\033[39m"

echo -e -n "\033[2m"

# Run experiments\
case "$OSTYPE" in
	linux*) ./julia/bin/julia examples/runExperiments.jl $1 $2 | tee results/results_$1_$2.txt ;;
    darwin*) /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia examples/runExperiments.jl $1 $2 | tee results/results_$1_$2.txt ;;
    win*) %JULIA_HOME%/bin/julia examples/runExperiments.jl $1 $2 | tee results/results_$1_$2.txt ;;
esac

retval=${PIPESTATUS[0]}

echo -e -n "\033[0m"

echo "Julia script exit status: $retval"

if [ $retval -ne 0 ]; then
    echo -e "\033[31m\033[1mFATAL ERROR:\033[0m\033[31m Experiment failed for some reason. Aborting...\033[0m"
    echo -e "\033[93m\033[4mNote\e[24m: Check that you have allocated enough RAM for the docker container\033[39m"
    exit 1
fi

#./julia/bin/julia data/examples/runExperiments.jl $1 | tee results_$1.txt
# Check the extracted error results from table
./check.sh $1 $2