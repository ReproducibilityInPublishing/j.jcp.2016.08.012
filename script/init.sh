#!/bin/bash
set -e

echo -e "\033[96mInitializing environment...\033[39m"

juliaBin=""

PROJ_PATH=$(realpath -s $(dirname $(realpath -s $0))/..)

# Simple run to make sure does not crash
case "$OSTYPE" in
linux*)
    juliaBin="$PROJ_PATH/julia/bin/julia"
    ;;
darwin*)
    juliaBin="/Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia"
    ;;
win*)
    juliaBin="%JULIA_HOME%/bin/julia"
    ;;
esac

echo "Julia binary loation: $juliaBin"

if [ ! -f $juliaBin ]; then
    echo -e "\033[31m\033[1mERROR:\033[0m\033[31m Julia binary not found at specified location. Aborting...\033[0m"
    exit 1
fi

echo -e -n "\033[2m"

$juliaBin $PROJ_PATH/examples/runfirst.jl

retval=$?

echo -e -n "\033[0m"

echo "Julia script exit status: $retval"

if [ $retval -ne 0 ]; then
    echo -e "\033[31m\033[1mERROR:\033[0m\033[31m Initialization failed. Aborting...\033[0m"
    exit 1
fi