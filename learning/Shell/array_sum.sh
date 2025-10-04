#!/bin/bash
#Shell 脚本，创建一个数组，将用户输入的 5 个数字存入数组，并计算它们的总和。
array=("$1" "$2" "$3" "$4" "$5")
count="${#array[@]}"
sum=0
for((i=0;i<="$count";i++))
do
    sum=$((sum+array[i]))
done
echo "$sum "