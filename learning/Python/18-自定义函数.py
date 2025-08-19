def my_abs(x):
    if x >= 0:
        return x
    else:
        return -x
print(my_abs(-99))
'''
99
函数体内部的语句在执行到return时函数执行完毕并将结果返回，因此函数内部通过条件判断和循环可以实现非常复杂的逻辑
如果没有return语句，函数执行完毕后也会返回结果，只是结果为None。return None可以简写为return
将my_abs()的函数定义保存为abstest.py文件，可以在该文件的当前目录下启动Python解释器，
用from abstest import my_abs来导入my_abs()函数
'''

# my_abs(1, 2)
'''
TypeError: my_abs() takes 1 positional argument but 2 were given
调用函数时，如果参数个数不对，Python解释器会自动检查出来，并抛出TypeError
'''

# my_abs('A')
# abs('A')
'''
TypeError: '>=' not supported between instances of 'str' and 'int'
TypeError: bad operand type for abs(): 'str'
当传入了不恰当的参数时，内置函数abs会检查出参数错误
而自定义的my_abs没有参数检查，会导致if语句出错，出错信息和abs不一样
'''

def my_abs(x):
    if not isinstance(x, (int, float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x
# my_abs('A')
'''
TypeError: bad operand type
添加了参数检查后，如果传入错误的参数类型，函数就可以抛出一个错误
'''

from math import cos, sin, pi
def move(x, y, step, angle=0):
    nx = x + step * cos(angle)
    ny = y - step * sin(angle)
    return nx, ny
x, y = move(100, 100, 60, pi / 6)
print(x, y)
r = move(100, 100, 60, pi / 6)
print(r)
'''
151.96152422706632 70.0
(151.96152422706632, 70.0)
函数的返回值是一个tuple，当使用多个变量进行接收时，按位置赋给对应的值
Python的函数返回多值其实就是返回一个tuple
'''

def nop():
    pass
age = 28
if age >= 18:
    pass
'''
pass可以用来作为占位符，现在还没想好怎么写的代码，就可以先放一个pass，让代码能运行起来
'''