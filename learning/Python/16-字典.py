# 使用{}和键值对来定义字典
my_dict = {'Alice':95, 'Bob':88, 'Charly':91}
print(type(my_dict))
print(my_dict)
'''
<class 'dict'>
{'Alice': 95, 'Bob': 88, 'Charly': 91}
'''

print('David' in my_dict)
my_dict['David'] = 85
print('David' in my_dict)
print(my_dict)
'''
False
True
{'Alice': 95, 'Bob': 88, 'Charly': 91, 'David': 85}
通过指定key的方式判断是否存在于字典中
通过指定key的方式插入键值对
'''

# .get()方法
print(my_dict.get('Bob'))
print(my_dict.get('Ela', '不存在'))
print(my_dict.get('Ela'))
'''
88
不存在
None
安全的获得字典中指定key的value，key不存在于字典中时返回设置的默认值，默认为None
'''

# .keys()方法
for i in my_dict.keys():
    print(i)
'''
Alice
Bob
Charly
David
'''

# .values()方法
for i in my_dict.values():
    print(i)
'''
95
88
91
85
'''

# .items()方法
for i in my_dict.items():
    print(i)
'''
('Alice', 95)
('Bob', 88)
('Charly', 91)
('David', 85)
'''