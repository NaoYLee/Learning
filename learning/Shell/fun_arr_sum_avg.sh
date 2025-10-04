#!/bin/bash
#2.定义一个函数，计算数组中所有元素的总和与平均值
function avg(){
    sum=$1
    count=$2
    avg_p=$((sum/count))
    avg_e=$((sum%count*10))
    avg_d=$((avg_e/count))
    echo "平均数为$avg_p.$avg_d"
}
function array_sum_avg(){
    array=("$1" "$2" "$3" "$4" "$5")
    sum=0
    for i in "${array[@]}"
    do
        sum=$((i+sum))
    done
    echo "数组中元素的和为$sum"
    count=${#array[@]}
    avg "$sum" "$count"
}

array_sum_avg "$1" "$2" "$3" "$4" "$5"