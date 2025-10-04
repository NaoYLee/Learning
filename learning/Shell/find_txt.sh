#!/bin/bash
while true
do
    read -r -p "请输入要遍历的目录：" dir_path
    if [[ ! -d "$dir_path" ]]
    then
        echo "请输入正确的路径"
        continue
    fi
    count=0
    for file in "$dir_path"/*
    do
        if [[ "$file" == *.txt ]]
        then
            echo "$file"
            ((count++))
        fi
    done
    if [ $count -eq 0 ]
    then
        echo "没有找到txt文件"
    fi
    break
done