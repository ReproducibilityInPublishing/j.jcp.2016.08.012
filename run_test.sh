#!/bin/bash
echo "Executing initial setup"
exec ./julia/bin/julia ./data/examples/runfirst.jl
echo "Running test"
exec ./julia/bin/julia ./run_test.jl
