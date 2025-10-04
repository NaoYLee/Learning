#!/bin/bash
#1.定义一个函数，找出数组中的最大值和最小值
function array_max_min(){
    array=("$1" "$2" "$3" "$4" "$5")
    max=0
    min=$1
    for i in "${array[@]}"
    do
        if [ "$i" -gt "$max" ]
        then
            max="$i"
        fi
        if [ "$i" -lt "$min" ]
        then
            min="$i"
        fi
    done
    echo "最大的数为$max"
    echo "最小的数为$min"
}

array_max_min "$1" "$2" "$3" "$4" "$5"