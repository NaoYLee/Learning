#!/bin/bash
#Shell 脚本，创建一个数组，存储一组数字，its=(23 45 12 89 34)并找出数组中的最大值。
its=(23 45 12 89 34)
max=0
for i in "${its[@]}"
do
    if [ "$i" -gt "$max" ]
    then
        max="$i"
    fi
done
echo "$max"