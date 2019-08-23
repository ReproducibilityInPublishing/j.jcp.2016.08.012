#!/bin/bash
set -e

if [ $# -ne 2 ]; then
    echo -e "\033[31m\033[1mFATAL ERROR:\033[0m\033[31m Reproduction requires 2 arguments. Aborting...\033[0m"
    exit 1
fi

./main.sh $1 $2