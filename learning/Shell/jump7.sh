#!/bin/bash
for((i=1;i<=100;i++))
do  
    if [ $((i%7)) -eq 0 ];then
        echo "过"
    elif [[ $i =~ ^[0-9]*7 ]];then
        echo "过"
    else 
        echo $i
    fi
    done