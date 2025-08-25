""" Lambda 函数
也称为匿名函数，是一种特殊的函数，它没有函数名，只用一行代码就能定义。
它的核心设计理念是：用于简化那些只需要使用一次、功能简单的函数定义。
基本语法如下：

lambda arguments: expression

lambda: 定义 lambda 函数的关键字。
arguments: 函数的参数，可以是一个或多个，用逗号分隔。与普通函数的参数完全一致。
expression: 一个单一的表达式。这个表达式的结果就是 lambda 函数的返回值。

关键限制：expression 只能是一个表达式，不能是复杂的代码块或多条语句
（可以使用三元表达式，但不能使用 if...else... 语句；也不能使用 for 或 while 循环）。
"""

def square(x):
    return x * x
print(square(5))  # 输出：25

square_lambda = lambda x: x * x
print(square_lambda(5))  # 输出：25
""" 以上两者完全等价 """

""" Lambda 函数的核心用途和场景
Lambda 函数真正的威力不在于把它赋值给一个变量（那样通常不如直接用 def 定义清晰），而在于作为参数传递给其他需要函数作为参数的函数（高阶函数）。

最常见的应用场景是配合 sorted(), filter(), map() 等内置函数使用。
"""

""" 1. 与 sorted() 结合：进行自定义排序
sorted() 函数可以接受一个 key 参数，这个参数是一个函数，用于指定排序的依据。
"""
# 有一个列表，元素是元组（姓名，年龄）
students = [('Alice', 25), ('Bob', 20), ('Charlie', 23), ('Diana', 21)]

# 按年龄排序
# key 函数将接收列表的每一个元素（即一个元组），并返回元组的第二个元素（索引1）作为排序依据
students_sorted_by_age = sorted(students, key=lambda student: student[1])
print(students_sorted_by_age)
# 输出：[('Bob', 20), ('Diana', 21), ('Charlie', 23), ('Alice', 25)]

# 按姓名排序（元组的第一个元素）
students_sorted_by_name = sorted(students, key=lambda student: student[0])
print(students_sorted_by_name)
# 输出：[('Alice', 25), ('Bob', 20), ('Charlie', 23), ('Diana', 21)]

"""
如果没有 lambda，需要先单独定义一个函数，代码会显得更冗长
"""
def get_age(student):
    return student[1]

students_sorted_by_age = sorted(students, key=get_age)

""" 2. 与 filter() 结合：过滤序列
filter() 函数用于过滤序列，它接受一个函数和一个序列。
函数用于判断每个元素是否满足条件，返回 True 或 False。
"""
numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

# 过滤出所有偶数
even_numbers = list(filter(lambda x: x % 2 == 0, numbers))
print(even_numbers)  # 输出：[2, 4, 6, 8, 10]

""" 3. 与 map() 结合：对序列中每个元素进行操作
map() 函数会将一个函数应用于序列的每一个元素，并返回结果组成的迭代器。
"""
numbers = [1, 2, 3, 4, 5]

# 将列表中每个数都平方
squared_numbers = list(map(lambda x: x ** 2, numbers))
print(squared_numbers)  # 输出：[1, 4, 9, 16, 25]

""" 注意事项和局限性
简洁性优先，但可读性更重要：
    不要过度使用 lambda。如果逻辑变得复杂，老老实实使用 def 来定义函数会让代码更清晰、更易维护。
    如果 lambda 表达式很长或难以理解，就应该换用普通函数。

只能是表达式：
    Lambda 函数体只能包含一个表达式，不能包含复杂的语句块（如循环、if 语句等）。
    条件逻辑可以用三元运算符实现：lambda x: ‘even’ if x % 2 == 0 else ‘odd’。

没有函数名：
    __name__ 属性是 <lambda>，这在调试时可能不太友好。
"""