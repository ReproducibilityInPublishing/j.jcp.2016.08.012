#!/bin/bash

trap ctrl_c INT

function ctrl_c() {
    echo -e "\033[0m"
    exit 1
}

PROJ_PATH=$(dirname $(realpath -s $0))

if [ $# -eq 0 ]; then
    cat $PROJ_PATH/script/help.txt
fi

command=$(echo "$1" | tr '[:upper:]' '[:lower:]')

if [ "$command" = "help" ]; then
    cat $PROJ_PATH/script/help.txt
fi

if [ "$command" = "init" ]; then
    $PROJ_PATH/script/init.sh
fi

if [ "$command" = "run" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'run' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh run <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    $PROJ_PATH/script/computation.sh $arg1 $arg2
fi

if [ "$command" = "check" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'check' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh check <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    $PROJ_PATH/script/check.sh $arg1 $arg2
fi

if [ "$command" = "all" ]; then
    if [ $# -ne 3 ]; then
        echo -e "\033[31m\033[1mERROR:\033[0m\033[31m The 'all' command requires 2 arguments\033[0m"
        echo "Usage: ./algo.sh all <num 2d refinements> <num 3d refinements>"
        exit 1
    fi
    arg1=$2
    arg2=$3
    $PROJ_PATH/script/init.sh
    if [ $? -ne 0 ]; then
        exit 1
    fi
    $PROJ_PATH/script/computation.sh $arg1 $arg2
    if [ $? -ne 0 ]; then
        exit 1
    fi
    $PROJ_PATH/script/check.sh $arg1 $arg2
    if [ $? -ne 0 ]; then
        exit 1
    fi
fi
