#!/bin/bash
scr="$1"
if [ "$scr" -ge 101 ];then
echo "成绩不能大于101分"
elif [ "$scr" -ge 91 ];then
echo "成绩优秀"
elif [ "$scr" -ge 81 ];then
echo "成绩良好"
elif [ "$scr" -ge 71 ];then
echo "成绩中等"
elif [ "$scr" -ge 60 ];then
echo "成绩及格"
elif [ "$scr" -ge 0 ];then
echo "继续努力"
else
echo "成绩不能小于0分"
fi