#!/bin/bash
read -r -p "请输入你的名次:" a
case $a in
1)
printf "晚上吃火锅\n";;
2)
printf "晚上吃烧烤\n";;
3)
printf "晚上吃鸡腿\n";;
*)
printf "吃47\n";;
esac