# 空集合（不能用{}，因为{}是字典）
s1 = set()

# 直接初始化
s2 = {1, 2, 3, 2}  # 自动去重: {1, 2, 3}

# 从列表转换
s3 = set([4, 5, 6, 5])  # {4, 5, 6}

s2.add(4)     # {1, 2, 3, 4}
s2.update([5, 6])  # 添加多个元素

s2.remove(3)   # 删除元素3（不存在则报KeyError）
s2.discard(10) # 安全删除（不存在也不报错）
s2.pop()       # 随机删除一个元素并返回

# 检查元素是否存在
if 2 in s2:
    print("Element found")

a = {1, 2, 3}
b = {3, 4, 5}

# 并集
union = a | b  # 或 a.union(b) → {1, 2, 3, 4, 5}

# 交集
intersection = a & b  # 或 a.intersection(b) → {3}

# 差集
diff = a - b  # 或 a.difference(b) → {1, 2}

# 对称差集（异或）
sym_diff = a ^ b  # 或 a.symmetric_difference(b) → {1, 2, 4, 5}

s = {1, 2, 3}

# 子集/超集检查
{1, 2}.issubset(s)   # True
s.issuperset({1, 2}) # True

# 集合推导式
even_squares = {x**2 for x in s if x % 2 == 0}  # {4}