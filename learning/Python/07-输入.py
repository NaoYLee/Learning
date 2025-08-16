# 提示用户录入姓名, 并接收打印.
name = input('请输入姓名: ')
print(f'您的姓名是: {name}')

# 提示用户录入年龄, 并接收打印.
age = input('请输入年龄: ')
print(f'您的年龄是: {age}')

# input函数默认接收字符串类型
print(type(name))
print(type(age))

# 使用类型转换函数设置接收类型
name = input('请输入姓名：')
age = int(input('请输入年龄：'))
height = float(input('请输入身高：'))
print(type(name))
print(type(age))
print(type(height))