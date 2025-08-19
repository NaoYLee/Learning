#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def triangles():
    row = [1]
    while True:
        yield row
        row = [1] + [row[i] + row[i + 1] for i in range(len(row) - 1)] + [1]
'''
使用'row[i] + row[i + 1]'实现列表中相邻两位相加的效果
'range(len(row) - 1)'实现忽略最后一个元素的效果
公共运算符'+'实现拼接列表的功能
'''

level = int(input('请输入层数：'))
n = 0
results = []

for t in triangles():
    results.append(t)
    n = n + 1
    if n == level:
        break

for t in results:
    print(t)