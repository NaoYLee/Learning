import re


score=float(input('请输入分数：'))
if score > 150:
    print('你出的卷子？')
elif score > 127.5:
    print('优秀！')
elif score > 90:
    print('及格了')
elif score >= 0:
    print('不合格！')
else:
    print('你把卷子吃了？！')
print(r'"我没有缩进，所以我和if语句平级，你总能看到我"') # Python使用缩进来组织代码块

# Boolean表达式只有True和False两个结果
Bool_t = 2 > 1
Bool_f = 2 < 1
print(Bool_t)
print(Bool_f)

# 比较运算符
a = 1
b = 2
print(a == b)  # ==表示等于
print(a > b)
print(a < b)

# 逻辑运算符
print(Bool_t and Bool_f)  # and 表示两者皆为True时为Ture
print(Bool_t or Bool_f)  # or 表示两者任一为True时为Ture
print(not Bool_f)  # not 表示取反

# 嵌套使用if语句
balance = float(input('请输入余额：'))
if balance > 10:
    print('上车')
    seat = int(input('请输入客车座位数：'))
    passenger = int(input('车上人数：'))
    if passenger < seat:
        print('找个座儿')
    elif passenger < (seat * 1.2):
        print('超载！6分！')
    else:
        print('严重超载！12分儿！')
else:
    print('腿儿着！')

i = 1
while i <= 5:
    j = 1
    while j <= 5:
        print('*', end='')
        j += 1
    print()
    i += 1

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
    if i == 'P':
        print('Республик')

import re
num = int(input('请输入玩家数：'))
i = 0
while i < num:
    i += 1
    if i%7 == 0:
        print(f'{i}号玩家："pass"')
    elif re.match(r'[0-9]*7[0-9]*', str(i)):
        print(f'{i}号玩家："pass"')
    else:
        print(f'{i}号玩家："{i}"')