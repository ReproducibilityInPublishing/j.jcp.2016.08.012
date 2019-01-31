#!/bin/bash
set -e

# Simple run to make sure does not crash
./julia/bin/julia data/examples/runfirst.jl

# Run experiments and check output
./computation.sh $1
