#!/bin/bash
exec ./julia/bin/julia data/examples/runfirst.jl
exec ./julia/bin/julia data/examples/runExperiments.jl | tee results.txt
