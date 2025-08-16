score=eval(input('请输入分数：'))  # eval()函数，将字符串类型中的文本转成其对应的类型
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
# Python使用缩进来组织代码块
print('我没有缩进，所以我和if语句平级，你总能看到我')

# 嵌套使用if语句
balance = eval(input('请输入余额：'))
if balance > 10:
    print('上车')
    seat = eval(input('请输入客车座位数：'))
    passenger = eval(input('车上人数：'))
    if passenger < seat:
        print('找个座儿')
    elif passenger < (seat * 1.2):
        print('超载！6分！')
    else:
        print('严重超载！12分儿！')
else:
    print('腿儿着！')

# 三元运算符
a, b, max = 10, 3, 0
if a > b:
    max = a
else:
    max = b
print(f'最大值为 {max}')
# 三元运算符方式
max = a if a > b else b
print(f'最大值为 {max}')

c, abs = 10, 0
if c > 0:
    result = c
else:
    result = -c
print(f'绝对值为: {abs}')
# 三元运算符方式
result = c if c > 0 else (-c)
print(f'绝对值为: {abs}')

# 使用if语句设计猜拳游戏
import random
gamer = eval(input('请输入你的手势：（1石头，2剪刀，3布）'))
computer = random.randint(1, 3)
gestures = {1: '石头', 2: '剪刀', 3: '布'}
if gamer not in (1, 2, 3):
    raise TypeError('请输入1-3之间的数字')
if gamer == computer:
    result = "平局"
elif (gamer - computer) % 3 == 1:
    result = "电脑获胜"
else:
    result = "玩家获胜"
print('玩家出: %s, 电脑出: %s %s' % (gestures[gamer], gestures[computer], result))
