# 使用()来定义元组
my_tuple = (1, 2, 3, 2)
print(type(my_tuple))
print(my_tuple)
'''
<class 'tuple'>
(1, 2, 3)
元组中的元素在定义时固定，无法进行改变
'''

single_tuple = (1,)  # 元组中只有一个元素时，需要使用','消除歧义
test_tuple = (1)
print(type(single_tuple))
print(type(test_tuple))
'''
<class 'tuple'>
<class 'int'>
元组中只有一个元素时，Python 输出时会使用','消除歧义
'''

# .index()方法
print(my_tuple.index(2))  # 1
print(my_tuple.index(2, 2))  # 3

# .count()方法
print(my_tuple.count(2))  # 2

# len()函数
print(len(my_tuple))  # 4

# 嵌套元组和列表
my_tuple = (1, ['l1', 'l2'])
print(my_tuple)
print(type(my_tuple[1]))
my_tuple[1].append('l3')  # 向该元组的第2个元素中追加新元素
print(my_tuple)
'''
(1, ['l1', 'l2'])
<class 'list'>
(1, ['l1', 'l2', 'l3'])
元组中的元素无法更改，但是如果其中包含可变容器，那么可以针对该可变容器的元素进行更改
'''