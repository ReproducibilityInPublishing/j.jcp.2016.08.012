#!/bin/bash

echo -e "\033[96mRunning experiments...\033[39m"
echo "Number of 2D refinements: $1"
echo "Number of 3D refinements: $2"

juliaBin=""

PROJ_PATH=$(realpath -s $(dirname $(realpath -s $0))/..)

# Run experiments\
case "$OSTYPE" in
linux*)
    juliaBin="$PROJ_PATH/julia/bin/julia"
    ;;
darwin*)
    juliaBin="/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia"
    ;;
win*)
    juliaBin="%JULIA_HOME%/bin/julia"
    ;;
esac

echo "Julia binary loation: $juliaBin"

if [ ! -f $juliaBin ]; then
    echo -e "\033[31m\033[1mERROR:\033[0m\033[31m Julia binary not found at specified location. Aborting...\033[0m"
    exit 1
fi

echo -e -n "\033[2m"

$juliaBin $PROJ_PATH/examples/runExperiments.jl $1 $2 | tee $PROJ_PATH/results/results_$1_$2.txt

retval=${PIPESTATUS[0]}

echo -e -n "\033[0m"

echo "Julia script exit status: $retval"

if [ $retval -ne 0 ]; then
    echo -e "\033[31m\033[1mERROR:\033[0m\033[31m Experiment failed. Aborting...\033[0m"
    echo -e "\033[93m\033[4mNote\033[24m: Make sure you 1) have run './algo.sh init' first and 2) you have allocated enough RAM for the docker container,\033[39m"
    exit 1
fi
