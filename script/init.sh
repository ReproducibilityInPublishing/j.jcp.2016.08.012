#!/bin/bash
set -e

echo -e "\033[96mInitializing environment...\033[39m"

juliaBin=""

# Simple run to make sure does not crash
case "$OSTYPE" in
linux*)
    juliaBin="./julia/bin/julia"
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

$juliaBin ../examples/runfirst.jl