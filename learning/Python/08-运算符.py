# 算术运算符
print(10 + 3)  # 和 13
print(10 - 3)  # 差 7
print(10 * 3)  # 积 30
print(10 / 3)  # 商 3.33333
print(10 // 3)  # 取整 3
print(10 % 3)  # 取模 1
print(10 ** 3)  # 幂 1000

# 赋值运算符
name = 'Monty Python'
a = 5
b = 3
a += b  # 效果与 a = a + b 等效
print(a)  # 8

# 比较运算符
print(10 > 3)  # True
print(10 < 3)  # False
print(10 >= 10)  # True
print(10 > 10)  # False
print(10 <= 10)  # True
print(10 < 10)  # False
print(10 == 20)  # False
print(10 != 20)  # True

# 逻辑运算符
# and，全真为真
print(True and True)  # True
print(True and False)  # False
print(False and False)  # False
# 如果有0(False)则整体为0(False)，否则取最后非0数
print(0 and 3)  # 0
print(5 and 0)  # 0
print(2 and 0 and 10)  # 0
print(2 and 3 and 10)  # 10

# or，一真即真
print(True or True)  # True
print(True or False)  # True
print(False or False)  # False
# 如果有非0(True)则整体为非0(True)，取第1个非0数
print(0 or 0)  # 0
print(0 or 3)  # 3
print(5 or 0)  # 5
print(2 or 0 or 10)  # 2
print(2 or 3 or 10)  # 2

# not取反
print(not True)  # False
print(not False)  # True

# 公共运算符
# + 适用于字符串、列表、元组
print('abc'+ 'xyz')
print([10, 20] + ['aa', 'bb'])
print((10, 20) + ('aa', 'bb'))
'''
abcxyz
[10, 20, 'aa', 'bb']
(10, 20, 'aa', 'bb')
'''

# * 适用于字符串、列表、元组
print('ab-' * 5)
print([1, 2] * 5)
print(('a', 'b') * 5)
'''
ab-ab-ab-ab-ab-
[1, 2, 1, 2, 1, 2, 1, 2, 1, 2]
('a', 'b', 'a', 'b', 'a', 'b', 'a', 'b', 'a', 'b')
'''

# in / not in 适用于字符串、列表、元组、字典key
print('ab' in 'aabbcc')
print(3 in [1, 2])
print(4 not in (1, 2, 3, 4))
print('Alice' in {'Alice':95, 'Bob':88, 'Charly':91})
print('lice' in {'Alice':95, 'Bob':88, 'Charly':91})
print(95 in {'Alice':95, 'Bob':88, 'Charly':91})
'''
True
False
False
True
False
False
'''