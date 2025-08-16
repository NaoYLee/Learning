my_str = 'Hello, Python!'
my_list = [1, 'apple', True, 3.14]
my_tuple = (10, 'banana', False)
my_set = {1, 2, 3, 2}
my_dict = {'name': 'Alice', 'age': 30}
sep, iterable, old, new, sub, prefix, suffix, i, x, s, key, default, other_dict = 0

# 容器函数
len(my_str)  # 返回容器元素数量  适用于 列表/元组/集合/字典/字符串等
max(my_list)  # 返回最大元素  适用于 列表/元组/集合/字符串（按编码）
min(my_tuple)  # 返回最小元素  适用于 列表/元组/集合/字符串（按编码）
sum(my_set)  # 求和（仅数值型元素）  适用于 列表/元组/集合
sorted(my_dict)  # 返回排序后的新列表  适用于 列表/元组/集合/字符串/字典键
any(my_list)  # 任意元素为真则返回 True  列适用于 表/元组/集合/字典键
all(my_tuple)  # 所有元素为真则返回 True  适用于 列表/元组/集合/字典键s
enumerate(my_str)  # 生成(索引, 元素)元组迭代器  适用于 列表/元组/字符串
# 函数可以使用<contaniner>.__<function>__()以方法的形式调用函数，但是极不推荐

# 字符串（String）方法
my_str.split(sep)  # 按分隔符分割为列表
my_str.join(iterable)  # 连接可迭代对象的元素
my_str.strip()  # 移除两端空白字符
my_str.replace(old, new)  # 替换子串
my_str.find(sub)  # 查找子串位置（不存在返回-1）
my_str.startswith(prefix)  # 检查是否以指定前缀开头
my_str.endswith(suffix)  # 检查是否以指定后缀结尾

# 列表（List）方法
my_list.append(x)  # 末尾添加元素
my_list.insert(i, x)  # 在索引 i 处插入 x
my_list.pop([i])  # 移除并返回索引 i 的元素（默认末尾）
my_list.remove(x)  # 移除第一个值为 x 的元素
my_list.index(x)  # 返回 x 的索引
my_list.count(x)  # 统计 x 出现次数
my_list.sort()  # 原地排序
my_list.reverse()  # 原地反转
my_list.clear()  # 清空列表

# 集合（Set）方法
my_set.add(x)  # 添加元素
my_set.remove(x)  # 移除元素（不存在时报错）
my_set.discard(x)  # 移除元素（不存在不报错）
my_set.pop()  # 随机移除并返回一个元素
my_set.union(s)  # 返回并集（等价于 |）
my_set.intersection(s)  # 返回交集（等价于 &）
my_set.difference(s)  # 返回差集（等价于 -）

# 字典（Dict）方法
my_dict.get(key, default)  # 安全获取键值（无键返回默认值）
my_dict.setdefault(key, default)  # 若键不存在则设默认值并返回
my_dict.pop(key, default)  # 移除键（并返回值默认值）
my_dict.update(other_dict)  # 合并另一个字典
my_dict.keys()  # 返回所有键的视图
my_dict.values()  # 返回所有值的视图
my_dict.items()  # 返回所有键值对的视图
my_dict.clear()  # 清空字典