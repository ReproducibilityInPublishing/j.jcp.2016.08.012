#!/bin/bash
./julia/bin/julia data/examples/runfirst.jl
./julia/bin/julia data/examples/runExperiments.jl | tee results.txt
