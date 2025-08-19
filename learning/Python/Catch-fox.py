#!/usr/bin/env python3
# -*- coding: utf-8 -*-

# todo 5个洞，狐狸每晚随机跳向相邻的洞，每天一次检查机会
import random

total_days = 0
total_tests = 10000
max_day = 0

# : 设置检查序列
test = [int(x) for x in input('输入检查顺序（空格分隔）: ').split()]

# : 进行total_tests次实验
for j in range(1, total_tests + 1):
    # : 每次实验重新初始化
    holes = {1:'empty', 2:'empty', 3:'empty', 4:'empty', 5:'empty'}
    fox_hole = random.randint(1, 5)
    holes[fox_hole] = 'fox'
    con = 0
    days = 1
    
    # : 调试
    # print(f'实验 {j} - 狐狸初始位置: {fox_hole}')
    
    while True:
        # : 循环使用检查序列
        if con >= len(test):
            con = 0
        
        check_fox = test[con]
        con += 1
        
        # : 抓住狐狸
        if holes[check_fox] == 'fox':
            # print(f'第{days}天检查洞{check_fox}时抓住狐狸!')
            max_day = days if days > max_day else max_day                
            break
        
        # : 狐狸移动
        # print(f'第{days}天检查洞{check_fox}: 未找到')
        old_hole = fox_hole
        
        if fox_hole == 1:
            new_hole = 2
        elif fox_hole == 5:
            new_hole = 4
        else:
            new_hole = fox_hole + random.choice([-1, 1])
        
        # : 更新洞穴状态
        holes[old_hole] = 'empty'
        holes[new_hole] = 'fox'
        fox_hole = new_hole
        # print(f'狐狸从洞{old_hole}移动到洞{new_hole}')
        
        days += 1
    
    total_days += days
    # print(f'本次实验花费{days}天')

avg_days = total_days / total_tests
print(f'平均花费{avg_days:.2f}天抓住狐狸, 最大花费{max_day}天抓住狐狸')