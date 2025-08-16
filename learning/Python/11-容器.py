# 字符串
my_str = 'Hello, Python!'  # 单引号/双引号定义
print(type(my_str))
'''
<class 'str'>
不可变的字符容器，支持索引和切片操作
内容不可修改，修改操作会生成新字符串
'''

# 列表
my_list = [1, 'apple', True, 3.14]  # 方括号定义
print(type(my_list))
'''
<class 'list'>
有序、可变（Mutable）的容器，可存储不同类型元素
元素按插入顺序排列，支持索引
允许重复元素
内容可修改
'''

# 元组
my_tuple = (10, 'banana', False)  # 圆括号定义
single_tuple = (42,)  # 单元素元组需加逗号
print(type(my_tuple))
'''
<class 'tuple'>
有序、不可变（Immutable） 的容器
元素不可修改
允许重复元素
通常用于存储异构数据（如坐标 (x, y)）
'''

# 集合
my_set = {1, 2, 3, 2}  # 花括号定义
print(type(my_set))
empty_set = set()  # 空集合（不能用 {}，这是空字典）
'''
<class 'set'>
无序、唯一元素的容器，基于哈希表实现
元素不可重复，自动去重
不支持索引
内容可增删，但元素本身必须是不可变类型
'''

# 字典
my_dict = {'name': 'Alice', 'age': 30}  # 花括号 + 键值对
print(type(my_dict))
'''
<class 'dict'>
无序的键值对（Key-Value）容器，键必须唯一且不可变
键（Key）必须是不可变类型
值（Value）可以是任意类型
内容可变（可增删改键值对）
'''