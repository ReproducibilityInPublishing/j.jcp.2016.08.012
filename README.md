# A fast marching algorithm for the factored eikonal equation

["A fast marching algorithm for the factored eikonal
equation"](https://dx.doi.org/10.1016/j.jcp.2016.08.012) discusses an algorithm
for solving the factored eikonal equation. Practically this can be used to
perform a kind of slowness tomography whereby travel times from some source
within a material can be used to determine the slowness of an object with
respect to position throughout the object.

## Build Instructions

To run the software in this package, all you need is an appropriate Julia installation.

### Requirements

The following is required to run this software:

* Julia 0.6.3

We have tested that the software works with this version of Julia, but other versions may work as well.

### Building with docker

The Dockerfile handles installation of all necessary dependencies. Simply execute the following:

    docker build -t ${DOCKER_IMAGE_NAME} .

### Running with docker

    docker run -it --rm -v $(pwd):/Scratch ${DOCKER_IMAGE_NAME}

1) `docker run -it adb16x/julia_test:fresh`

2) When inside the container:
	`sh run.sh`

3) The output is stored in `results.txt`

### By cloning this repo:

1) `docker build --no-cache -t julia .`

2) `docker run -it julia`

3) When inside the container:
	`sh run.sh`

4) The output is stored in `results.txt`

## Singularity

1) Build image **and** run the code:
	`sudo singularity --debug build test.simg Singularity |& tee sing-build.output`

2) Go into the image:
	`singularity shell test.simg`

3) View the results:
	`cat /usr/local/data/results.txt`

## Notes

* Any output/issues with the build can be view at: `cat sing-build.output`
* To reproduce all 6 rows, change the `numOfRefinements` in `/data/examples/runExperiments.jl` to 6. It consumes a lot of memory though.
