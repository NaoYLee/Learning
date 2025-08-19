# 使用[]来定义列表
my_list = ['string', 2, 3.0, True]
print(type(my_list))
print(my_list)
'''
<class 'list'>
['string', 2, 3.0, True]
'''

my_list[3] = False
print(my_list)
'''
['string', 2, 3.0, False]
使用索引可以指定调用的列表元素
'''

# 使用循环语句遍历列表
i = 0
while i < len(my_list):
    print(my_list[i], type(my_list[i]))
    i += 1
'''
string <class 'str'>
2 <class 'int'>
3.0 <class 'float'>
True <class 'bool'>
容器中的元素会保持自己的类型
'''

# 列表的嵌套
double_list = [['天甲', '天乙', '天丙'], ['地甲', '地乙', '地丙'], ['玄甲', '玄乙', '玄丙']]
print(double_list[0][2])  # 天丙
print(type(double_list[0]))  # <class 'list'>

# len()函数，统计元素数量
print(len('Monty Python'))  # 12
print(len(my_list))  # 4

# .index()方法，查找指定元素索引
# <container>.index(<item>, <start_index>, <end_index>)
print(my_list.index(2))  # 1
# print(my_list.index(2, 2))  # ValueError: 2 is not in list 指定查找的起始索引

# .append()方法
my_list.append(555)
print(my_list)
'''
['string', 2, 3.0, True, 555]
.append()方法可以向列表末尾追加一个元素
'''

# .extend()方法
my_list.extend([110, '120'])
print(my_list)
'''
['string', 2, 3.0, True, 555, 110, '120']
.extend()方法可以在列表末尾追加新的列表
'''

# .insert()方法
my_list.insert(1, 'new_item')
print(my_list)
'''
['string', 'new_item', 2, 3.0, True, 555, 110, '120'] 
.insert()方法可以在列表中指定索引位置插入新元素
'''

# .reverse()方法
my_list.reverse()
print(my_list)
print(my_list.reverse())
'''
['120', 110, 555, True, 3.0, 2, 'new_item', 'string']
None
.reverse()方法可以倒序排列列表元素
不能直接print()
'''