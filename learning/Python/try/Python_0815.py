print('Hello World')

print('Hello\tWorld')
print('Hello\nWorld')
print('''Hello
World''')

s_1 = input('Number1:')
s_2 = input('Number2:')
d_1 = int(s_1)
d_2 = int(s_2)
concat_s = s_1 + s_2
sum_d = d_1 + d_2
print(type(concat_s))
print(type(sum_d))
print('字符串拼接：', concat_s)
print('数字加和：', sum_d)

name = input('请输入姓名：')
age = int(input('请输入年龄：'))
hight = float(input('请输入身高：'))
print('%s的年龄为%d,身高%0.2f' %(name, age, hight))
print(f'{name}的年龄为{age},身高{hight}')
print(name+ '的年龄为'+ str(age)+ ',身高'+ str(hight))
print('%s5年后%d岁' %(name, age+5))

price = float(input('苹果单价为：'))
weight = float(input('购买重量为：'))
amount = price*weight
print('苹果单价%0.2f元/斤，购买了%0.2f斤，需要支付%0.2f元。' %(price, weight, amount))

a = 4
b = 2
print(a + b)
print(a - b)
print(a * b)
print(a / b)
print(a // b)
print(a % b)
print(a ** b)
a += b
print(a)
a -= b
print(a)
a *= b
print(a)
a /= b
print(a)
a //= b
print(a)
a %= b
print(a)

-1 % 3
2 % 3