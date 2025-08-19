# 使用单引号/双引号来定义字符串
my_str = 'The quick brown fox jumps over a lazy dog'
print(type(my_str))
print(my_str)
'''
<class 'str'>
The quick brown fox jumps over a lazy dog
'''

# .find()方法
# <string>.find('<sub_string>', <start_num>)
print(my_str.find('cat'))  # -1 无匹配子串时返回-1
print(my_str.find('o'))  # 12 返回第一个子串开始处的索引
print(my_str.find('o', 13))  # 17 指定开始寻找的索引位置
# .rfind()函数
print(my_str.rfind('o'))  # 39 从末尾开始向前寻找

# .index()方法
# <string>.index('<sub_string>', <start_num>, <end_num>)
print(my_str.index('cat'))  # 'ValueError: substring not found' 子串不存在时报错
print(my_str.index('o'))  # 12
print(my_str.index('o', 13))  # 17 指定寻找子串的起始索引，默认为0
print(my_str.index('o', 0, 11))  # 报错 指定寻找子串的终止索引，默认为最大索引
# .rindex()函数
print(my_str.rindex('o'))  # 39 从末尾开始向前寻找

# .count()方法
# <container>.count('<sub_string>', <start_num>, <end_num>)
print(my_str.count('o'))  # 4 查找子串出现的次数
print(my_str.count('cat'))  # 0 无匹配子串时返回0
print(my_str.count('o', 13))  # 3 指定开始寻找的索引位置
print(my_str.count('o', 13, 39))  # 2 指定寻找子串的终止索引，默认为最大索引

# .replace()
# <string>.count('<old_string>', '<new_string>', <num>)
print(my_str.replace('o', 'a'))
'''
The quick brawn fax jumps aver a lazy dag
'''
print(my_str.replace('o', 'a', 2))
'''
The quick brawn fax jumps over a lazy dog
指定替换的次数
'''

# .split()
print(my_str.split())
'''
['The', 'quick', 'brown', 'fox', 'jumps', 'over', 'a', 'lazy', 'dog']
不指定分隔符时默认使用空格分割
'''
print(my_str.split(' ', 2))
'''
['The', 'quick', 'brown fox jumps over a lazy dog']
指定进行分割的次数，默认全部分割
'''
print(my_str.split('s'))
'''
['The quick brown fox jump', ' over a lazy dog']
'''