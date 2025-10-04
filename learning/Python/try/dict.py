# 空字典
d1 = {}
d2 = dict()

# 直接初始化
d3 = {"name": "Alice", "age": 30, "city": "Paris"}

# 使用dict()构造函数
d4 = dict(name="Bob", age=25)  # 键自动转为字符串
d5 = dict([("id", 1001), ("role", "admin")])  # 从元组列表创建

print(d3["name"])  # 输出: Alice
print(d3.get("age"))  # 输出: 30（推荐，避免KeyError）
print(d3.get("country", "N/A"))  # 键不存在时返回默认值"N/A"

d3["email"] = "alice@example.com"  # 添加新键值对
d3["age"] = 31  # 修改已有键的值

del d3["city"]  # 删除键"city"
value = d3.pop("age")  # 删除并返回值
d3.clear()  # 清空字典

# 检查键是否存在
if "name" in d3:
    print("Key exists")

# 遍历所有键
for key in d3.keys():
    print(key)

# 遍历所有值
for value in d3.values():
    print(value)

# 遍历键值对
for key, value in d3.items():
    print(f"{key}: {value}")

d = {"a": 1, "b": 2}

# 合并字典（Python 3.9+）
d.update({"c": 3})  # 或 d |= {"c": 3}

# 获取所有键/值
keys = list(d.keys())    # ['a', 'b']
values = list(d.values()) # [1, 2]

# 字典推导式
squared = {k: v**2 for k, v in d.items()}  # {'a': 1, 'b': 4}