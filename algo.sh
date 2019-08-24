#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
    echo -e "\033[0m"
    exit 1
}


if [ $# -eq 0 ]; then
    cat ./script/help.txt
fi

command=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [ "$command" = "help" ]; then
    cat ./script/help.txt
fi

if [ "$command" = "init" ]; then
    ./script/init.sh
fi

if [ "$command" = "run" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'run' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh run <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    ./script/computation.sh $arg1 $arg2
fi

if [ "$command" = "check" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'check' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh check <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    ./script/check.sh $arg1 $arg2
fi

if [ "$command" = "all" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'all' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh all <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    ./script/init.sh
    if [ $? -ne 0 ]; then
        exit 1
    fi
    ./script/computation.sh $arg1 $arg2
    if [ $? -ne 0 ]; then
        exit 1
    fi
    ./script/check.sh $arg1 $arg2
    if [ $? -ne 0 ]; then
        exit 1
    fi
fi
