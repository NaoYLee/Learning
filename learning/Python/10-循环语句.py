# while循环
i = 1  # 初始化条件
while i <= 5:  # 判断条件
    print(f'hello world {i}')  # 循环体
    i += 1  # 控制条件

# while循环的嵌套
# 打印九九乘法表
i = 1  # 外循环初始化条件
while i <= 9:  # 外循环判断条件
    j = 1  # 内循环初始化条件
    while j <= i:  # 内循环判断条件
        print(f'{j} * {i} = {i * j}', end='\t')  # 内循环循环体
        j += 1  # 内循环的控制条件
    print()  # 换行
    i += 1  # 外循环的控制条件

# for循环
name = 'CCCP'
for i in name:
    print(i)

# 循环语句与条件判断语句嵌套
name = 'CCCP'
j = 0
for i in name:
    print(i)
    j += 1
    if i == 'C' and j == 1:
        print('Союз')
    elif i == 'C' and j == 2:
        print('Советских')
    elif i == 'C' and j == 3:
        print('Социалистических')
    elif i == 'P':
        print('Республик')

'''
循环跳转语句break和continue:
    break 用于终止循环，循环不再继续执行
    continue 用于结束本次循环，进行下一次循环

循环结合else语句:
    1. 如果循环是通过break结束，则不执行else里边的内容
    2. 如果循环不是通过break结束，则执行else里边的内容
'''
name = 'Honour'
for i in name:
    if i == 'u':
        print('不列颠绅士')
        break
else:
    print('扬基佬')

# 使用循环语句和条件判断语句设计逢七过游戏
import re
i = 0
while i < 100:
    i += 1
    if i%7 == 0:
        print('pass')
    elif re.match(r'[0-9]*7[0-9]*', str(i)):
        print('pass')
    else:
        print(i)