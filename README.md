# A Fast Marching Algorithm for the Factored Eikonal Equation

This is a Reproduction Package as described in the manuscript "Three Empirical Principles
for Computational Reproducibility and their Implementation: *The Reproduction Package*"
by M. S. Krafczyk, A. Shi, A. Bhaskar, D. Marinov, & V. Stodden.

This Reproduction Package includes the directory `expected_figures` as well as `expected_output`.

["A fast marching algorithm for the factored eikonal
equation"](https://dx.doi.org/10.1016/j.jcp.2016.08.012) discusses an algorithm
for solving the factored eikonal equation. Practically, this can be used to
perform a kind of slowness tomography whereby travel times from some source
within a material can be used to determine the slowness of an object with
respect to position throughout the object.

## Build Instructions

To run the software in this package, all you need is an appropriate Docker installation.

### Requirements

Instructions were tested using 

 * Docker version 18.06.0-ce, build 0ffa825, on Ubuntu 16.04.5 LTS.
 * Docker version 19.03.1, build 74b1e89, on Mac OS Mojave (10.14.6)

### Building with Docker
The Dockerfile handles installation of all necessary dependencies. Simply execute the following:

    docker build -t ${DOCKER_IMAGE_NAME} .

## Run Instructions

### Running the Docker container
To start a container for the Docker image:

    docker run -it --rm -v $(pwd):/Scratch ${DOCKER_IMAGE_NAME}

### Initialize the Julia environment
Before running the experiments, you must first run 

    ./algo.sh init
   
This downloads necessary Julia packages.

### Run the experiments
In order to run the experiments, you use 

    ./algo.sh run <num 2d refinements> <num 3d refinements>
   
Output will be written to `results/results_<x>_<y>.txt` where `x` is `num 2d refinements` and `y` is `num 3d refinements`.

This command also creates the figures for the experiment. They can be found in `figures/`.

### Check the experiment results
In order to check the results of the experiment, you use 

    ./algo.sh check <num 2d refinements> <num 3d refinements>

The expected output to be compared against is found in `expected_output/`.

The expected figures are found in `expected_figures/`, however the script does not compare these with the generated figures.

This command will let you know if the results match what is expected or not.

The script that checks equality to within a reasonable degree is `examples/check_results.py`. If you wish to tighten or loosen the margin of error, modify that file.


### Run Everything
To initilize, run the experiments, and check the results with one command, use

	./algo.sh all <num 2d refinements> <num 3d refinements>

Please be aware of computational efforts for the scripts. More details can be found [here](COMPUTATIONAL_EFFORTS.md).

### Notes about Running All Rows
To reproduce all 6 rows from the article, use `6` as both `num 2d refinements` and `num 3d refinements`. Note that it does consume a lot of memory.

## Reproduction Notes
We kept track of our progress and issues inside `notes.txt`. We also have an
jupyter notebook showing this progress over time `ReproducibilityPlot.ipynb`.

## Acknowledgements
We want acknowledge the authors for their fine work on this experiment. We
succeeded with this project where many others had failed. The authors should be commended on putting together high quality work.
