#!/usr/bin/env python3
# -*- coding: utf-8 -*-

def rps(x):
    import random
    computer = random.randint(1, 3)
    gestures = {1: '石头', 2: '剪刀', 3: '布'}
    if x not in (1, 2, 3):
        raise TypeError('请输入1-3之间的数字')
    if x == computer:
        result = "平局"
    elif (x - computer) % 3 == 1:
        result = "电脑获胜"
    else:
        result = "玩家获胜"
    
    print('玩家出: %s, 电脑出: %s %s' % (gestures[x], gestures[computer], result))

player = int(input('请输入手势（1:石头, 2:剪刀, 3:布）：'))

rps(player)