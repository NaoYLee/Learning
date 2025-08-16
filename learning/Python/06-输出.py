name = 'Monty Python'
age = 33
salary = 1000.31523

print(name)
print(age)
print(salary)

# 同时输出多个变量
print(name, age, salary)

s_1 = '1'
s_2 = '2'
d_1 = int(s_1)
d_2 = int(s_2)
concat_s = s_1 + s_2
sum_d = d_1 + d_2
print(type(concat_s))
print(type(sum_d))
print('字符串拼接：', concat_s)
print('数字加和：', sum_d)

# 占位符输出，%s 表示 字符串，%d 表示整数，%f 表示浮点数
print('我叫%s, 我的年龄是%d, 我的工资是%f' % (name, age, salary))

# 浮点型保留2位
print('我叫%s, 我的年龄是%d, 我的工资是%.2f' % (name, age, salary))

# 格式化(format)输出
print(f'我叫{name}, 我的年龄是{age}, 我的工资是{salary}')

# 保留小数位
print(f'我叫{name}, 我的年龄是{age}, 我的工资是{round(salary, 2)}')
print(f'我叫{name}, 我的年龄是{age}, 我的工资是{salary:.2f}')

# 转义%
count = 3
print('我叫%s, 我的成绩是班级的前%d%%' % (name, count))  # %%表示1个%
print(f'我叫{name}, 我的成绩是班级的前{count}%')

# 指定行分隔符输出
# print('Hello') 默认补全是  print('hello', end='\n')

print('Hello', end='\t')
print('World')
print('Hello\tWorld')

print('Hello\nWorld')
print('''Hello
World''')