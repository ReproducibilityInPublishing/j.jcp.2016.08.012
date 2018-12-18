# A fast marching algorithm for the factored eikonal equation

["A fast marching algorithm for the factored eikonal
equation"](https://dx.doi.org/10.1016/j.jcp.2016.08.012) discusses an algorithm
for solving the factored eikonal equation. Practically, this can be used to
perform a kind of slowness tomography whereby travel times from some source
within a material can be used to determine the slowness of an object with
respect to position throughout the object.

## Build Instructions

To run the software in this package, all you need is an appropriate Julia installation.

### Requirements

The following is required to run this software:

* Julia 0.6.3

We have tested that the software works with this version of Julia, but other versions may work as well.

Instructions were also tested using Docker version 18.06.0-ce, build 0ffa825, on Ubuntu 16.04.5 LTS.

### Building with Docker
The Dockerfile handles installation of all necessary dependencies. Simply execute the following:

    docker build -t ${DOCKER_IMAGE_NAME} .

## Run Instructions

### Running with Docker
To start a container for the Docker image:

    docker run -it --rm -v $(pwd):/Scratch ${DOCKER_IMAGE_NAME}

#### Run Everything
To run everything, computational scripts for experiments and visualization scripts, run

	./run.sh

Please be aware of computational efforts for the scripts. More details can be found [here](COMPUTATIONAL_EFFORTS.md).

See sections below provide for details about the individual steps.

#### Running Computational Scripts
Within the Docker container, run

    ./computation.sh

Output will be written to `results.txt`. 

Expected output is found in `expected_results.txt`. The relevant parts from the output can be extracted and compared against the expected output using

    ./check.sh

The extracted values from the output (extracted using
`data/examples/extract_results.py`) can be found in
`expected_extracted_results.txt`.  Note that `computation.sh` already includes
the checking step.

### Running Notes
* To reproduce all 6 rows, change the `numOfRefinements` in `data/examples/runExperiments.jl` to 6. It consumes a lot of memory, though.

## Reproduction Notes
We kept track of our progress and issues inside `notes.txt`. We also have an
jupyter notebook showing this progress over time `ReproducibilityPlot.ipynb`.

## Acknowledgements
We want acknowledge the authors for their fine work on this experiment. We
succeeded with this project where many others had failed. The authors should be
commended on putting together high quality work.
