#!/bin/bash
sum=0
for i in {1..20}
do 
even=$((i%2))
    if [ $even -eq 0 ];then
        sum=$((sum+i))
        fi
    done
echo "$sum"