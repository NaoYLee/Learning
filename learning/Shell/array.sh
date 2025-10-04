#!/bin/bash
array=(1 2 3 4)
# ? 在" "中使用array[*]会报警告
# shellcheck disable=SC2066
for i in "${array[*]}" 
do
echo "$i"
done
for j in "${array[@]}"
do
echo "$j"
done
echo "${#array[*]}"
echo "${#array[@]}"