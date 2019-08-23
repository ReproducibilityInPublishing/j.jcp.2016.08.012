#!/bin/bash
set -e

echo -e "\033[96mInitializing environment...\033[39m"

# Simple run to make sure does not crash
case "$OSTYPE" in
	linux*) ./julia/bin/julia examples/runfirst.jl ;;
    darwin*) /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia examples/runfirst.jl ;;
    win*) %JULIA_HOME%/bin/julia examples/runfirst.jl ;;
esac

# Run experiments and check output
./computation.sh $1 $2

