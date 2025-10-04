#!/bin/bash
function compare() {
    if [ "$1" -lt "$2" ]
    then
        echo "$2大"
    elif [ "$1" -eq "$2" ]
    then
        echo  "一样大"
    else 
        echo  "$1大"
    fi
}

compare "$1" "$2"