#!/bin/bash
set -e

# Simple run to make sure does not crash
case "$OSTYPE" in
	linux*) ./julia/bin/julia code/data/examples/runfirst.jl ;;
    darwin*) /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia code/data/examples/runfirst.jl ;;
    win*) %JULIA_HOME%/bin/julia code/data/examples/runfirst.jl ;;
esac

# Run experiments and check output
./computation.sh $1 $2


