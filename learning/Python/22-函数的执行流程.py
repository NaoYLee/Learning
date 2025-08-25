g_num = 0
def test1():
    global g_num
    g_num = 100
def test2():
    print(g_num)

test1()
test2()
'''
100
先调用test1得到数据并且存到全局变量中
再调用test2，处理test1函数执行之后的这个值
'''

def test1():
    return 20
def test2():
    result = test1()
    print(result)

test2()
'''
20
函数的嵌套使用
调用test2时，先调用test1获得返回值，再对result进行处理
'''

def test1():
    return 50
def test2(num):
    print(num)


result = test1()
test2(result)
'''
50
先调用test1得到数据并且存到变量result中
再调用test2，将result的值传递到test2中
'''

def create_nums():
    print('---1---')
    return 1
    print('---2---')
    return 2
    print('---3---')

create_nums()
'''
---1---
一个函数中可以有多个return语句，但是只要有一个return语句被执行，那么这个函数就会结束
'''

def create_nums(num):
    print("---1---")
    if num == 100:
        print("---2---")
        return num + 1
    else:
        print("---3---")
        return num + 2
    print("---4---")

result1 = create_nums(100)
print(result1)
result2 = create_nums(200)
print(result2)
'''
---1---
---2---
101
---1---
---3---
202
通过设计函数体，实现不同条件下获得不同的返回值
'''

from math import cos, sin, pi
def move(x, y, step, angle=0):
    dx = x + step * cos(angle)
    dy = y - step * sin(angle)
    return dx, dy
x, y = move(100, 100, 60, pi / 6)
print(x, y)
r = move(100, 100, 60, pi / 6)
print(r)
'''
151.96152422706632 70.0
(151.96152422706632, 70.0)
Python的函数返回多值其实就是返回一个tuple，当使用多个变量进行接收时，按位置赋给对应的值
'''