# Computational Effort

We ran experiments on an Intel(R) Xeon(R) CPU E3-1240 V2 @ 3.40GHz.

## Computational Experiments

Scripts to run are `data/examples/runfirst.jl` and `data/examples/runExperiments.jl`.
* runfirst.jl: ~1 minute with 8 cores.
* runExperiments.jl: ~5 minutes with 8 cores.

## Visualization

Figures are computed as a part of running `runExperiments.jl`. The script
itself calls `runAccuractyExperiment.jl`, which generates figures as part of
its functionality.
