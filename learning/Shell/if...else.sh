#!/bin/bash
stu_num_1="$1"
if [ "${stu_num_1}" -lt 20 ];then
    echo "人没到齐"
    fi 
stu_num_2="$2"
if [ "${stu_num_2}" -ge 20 ];then
    echo "人到齐了"
else
    echo "人没到齐"
fi 
num1="$3"
num2="$4"
if [ "$num1" -gt "$num2" ];then
    echo "第一个数字大"
elif [ "$num1" -lt "$num2" ];then
    echo "第二个数字大"
else echo "两个数字一样大"
fi
