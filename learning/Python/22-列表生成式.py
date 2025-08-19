square_list = [x * x for x in range(1, 11)]
print(square_list)
'''
[1, 4, 9, 16, 25, 36, 49, 64, 81, 100]
写列表生成式时，把要生成的元素x * x放到前面，后面跟for循环
'''

concat_list = [m + n for m in 'ABC' for n in 'XYZ']
print(concat_list)
even_list = [x for x in range(1, 11) if x % 2 == 0]
print(even_list)
'''
['AX', 'AY', 'AZ', 'BX', 'BY', 'BZ', 'CX', 'CY', 'CZ']
[2, 4, 6, 8, 10]
可以使用嵌套循环和条件判断语句
'''

my_dict = {'x': 'A', 'y': 'B', 'z': 'C' }
for k, v in my_dict.items():
    print(k, '=', v)
my_list = [k + '=' + v for k, v in my_dict.items()]
print(my_list)
'''
x = A
y = B
z = C
['x=A', 'y=B', 'z=C']
for循环可以同时使用多个变量同时迭代
列表生成式也可以使用多个变量来生成list
'''