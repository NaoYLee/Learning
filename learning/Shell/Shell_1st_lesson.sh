#!/bin/bash
name='liyizhi'
age=28
address="Xi'an"
readonly gender="男"
echo '我的名字叫'${name}','$gender'年龄是'$age'岁，家庭住址是'$address'。'
#age_plus=$((age+1))
echo "我今年$age岁了,我明年$((age+1))岁"
skill='Linux'
str="I am good at $skill"
echo "$str"

m=1
n=1
result_1=$((m++))
result_2=$((++n))
echo "$result_1"
echo "$result_2"