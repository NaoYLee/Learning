# 使用{}来定义集合
my_set = {1, 2, 3, 2}
print(type(my_set))
print(my_set)
'''
<class 'set'>
{1, 2, 3}
'''

empty_set = set()  # 使用()定义空集合，不能用 {}，这是空字典

my_list = [1, 2, 3, 2]
list_to_set = set(my_list)
print(list_to_set)
print(type(my_list))
print(type(list_to_set))
'''
{1, 2, 3}
<class 'list'>
<class 'set'>
通过set函数将列表转换为集合，实现自动去重
'''

s1 = {1, 2, 5}
s2 = {2, 6}
print(s1 & s2)
print(s1 | s2)
'''
{2}
{1, 2, 5, 6}
set可以看成数学意义上的无序和无重复元素的集合，因此两个set可以做数学意义上的交集、并集等操作
'''

s3 = {[1, 2, 3]}
'''
TypeError: unhashable type: 'list'
set的原理和dict一样，同样不可以放入可变对象
无法判断两个可变对象是否相等，也就无法保证set内部“不会有重复元素”
'''

# .add()方法
my_set.add(4)
print(my_set)
my_set.add(4)
print(my_set)
'''
{1, 2, 3, 4}
{1, 2, 3, 4}
通过add(key)方法可以添加元素到set中，可以重复添加，但不会有效果
'''

# .remove方法
my_set.remove(2)
print(my_set)
'''
{1, 3, 4}
通过remove(key)方法可以删除元素
'''