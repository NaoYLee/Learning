#!/bin/bash
#5. 编写一个脚本，使用循环结构，实现一个简单的猜数字游戏。
#脚本随机生成一个 1 到 100 之间的数字，用户每次输入一个数字，脚本判断输入的数字是大于、  小于还是等于随机生成的数字，并给出相应提示，直到用户猜中为止。
num=$((1+RANDOM%100))
while true
do
read -r -p "计算机生成了一个 1-100 的随机数,你猜: " cai
if [ "$cai" -eq $num ]
then
echo "恭喜,猜对了"
exit
elif [ "$cai" -gt $num ]
then
echo "不巧,猜大了"
else
echo "不巧,猜小了"
fi
done