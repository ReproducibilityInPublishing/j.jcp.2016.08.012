#!/bin/bash
set -e

# Simple run to make sure does not crash
/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia data/examples/runfirst.jl

# Run experiments and check output
./computation.sh $1
