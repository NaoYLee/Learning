#!/bin/bash
echo "九九乘法表:"
for((m=1;m<=9;m++))
do
    for((n=1;n<=m;n++))
    do
        mult=$((m*n))
        echo -n "$n * $m = $mult  "
    done
    echo
done