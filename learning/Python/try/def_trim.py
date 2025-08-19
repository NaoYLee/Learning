#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def trim(s):
    while True:
        if len(s) == 0:
            break
        elif s[0] == ' ':
            s = s[1:]
        elif s[-1] == ' ':
            s = s[0:-1]
        else:
            break
    return s

my_str = input('请输入文本：')

print(trim(my_str))