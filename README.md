# Julia article containerized with Docker and Singularity

## Docker

### From docker hub without cloning this repo:

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
* To reproduce all 6 rows, change the `numOfRefinements` to 6. It consumes a lot of memory though.
