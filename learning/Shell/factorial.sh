#!/bin/bash
sum=0
factorial=1
for((i=1;i<=20;i++))
do
    factorial=$((factorial * i))
    sum=$((sum+factorial))
    done
echo "$sum"