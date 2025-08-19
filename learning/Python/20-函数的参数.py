def power(x):
    return x * x
print(power(5))
'''
25
对于power(x)函数，参数x就是一个位置参数
当调用power函数时，必须传入有且仅有的一个参数x
'''

def power(x, n):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s
print(power(5, 2))
print(power(n=2, x=5))
# print(power(5))
'''
25
25
TypeError: power() missing 1 required positional argument: 'n'
修改后的power(x, n)函数有两个参数：x和n，这两个参数都是位置参数
调用函数时，传入的两个值按照位置顺序依次赋给参数x和n，也可以明确指定赋予参数的值
但是，旧的调用代码失败了，原因是增加了一个参数，导致旧的代码因为缺少一个参数而无法正常调用
'''

def power(x, n=2):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s
print(power(5))
print(power(5, 3))
'''
25
125
把第二个参数n的默认值设定为2，调用power(5)时，相当于调用power(5, 2)
而对于n > 2的其他情况，就必须明确地传入n，比如power(5, 3)
'''

def enroll(name, gender, age=6, city='Beijing'):
    print('name:', name)
    print('gender:', gender)
    print('age:', age)
    print('city:', city)
    print('-' * 20)
enroll('Sarah', 'F')
enroll('Bob', 'M', 7)
enroll('Adam', 'M', city='Tianjin')
'''
name: Sarah
gender: F
age: 6
city: Beijing
--------------------
name: Bob
gender: M
age: 7
city: Beijing
--------------------
name: Adam
gender: M
age: 6
city: Tianjin
--------------------
默认参数可以简化函数的调用。
设置默认参数时，有几点要注意：
一是必选参数在前，默认参数在后，否则Python的解释器会报错
二是当函数有多个参数时，把变化大的参数放前面，变化小的参数放后面。
变化小的参数就可以作为默认参数，只有与默认参数不符的参数才需要提供额外的信息
有多个默认参数时，既可以按顺序提供默认参数
比如调用enroll('Bob', 'M', 7)，意思是，除了name，gender这两个参数外，最后1个参数应用在参数age上，city参数由于没有提供，仍然使用默认值。
也可以不按顺序提供部分默认参数。当不按顺序提供部分默认参数时，需要把参数名写上。
比如调用enroll('Adam', 'M', city='Tianjin')，意思是，city参数用传进去的值，其他默认参数继续使用默认值。
'''

def add_end(L=[]):
    L.append('END')
    return L
print(add_end([1, 2, 3]))
print(add_end(['x', 'y', 'z']))
print(add_end())
print(add_end())
'''
[1, 2, 3, 'END']
['x', 'y', 'z', 'END']
['END']
['END', 'END']
Python函数在定义的时候，默认参数L的值就被计算出来了，即[]，因为默认参数L也是一个变量，它指向对象[]
每次调用该函数，如果改变了L的内容，则下次调用时，默认参数的内容就变了，不再是函数定义时的[]了
定义默认参数要牢记一点：默认参数必须指向不变对象！
'''

def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L
print(add_end())
print(add_end())
'''
['END']
['END']
可以用None这个不变对象来修改上面的例子
'''

def calc_sum(*numbers):
    sum = 0
    for n in numbers:
        sum += n
    return sum
print(calc_sum(1, 2, 3))
'''
6
在Python函数中，还可以定义可变参数，就是传入的参数个数是可变的
定义可变参数和定义一个list或tuple参数相比，仅仅在参数前面加了一个*号。
在函数内部，参数numbers接收到的是一个tuple，因此，函数代码完全不变。
但是，调用该函数时，可以传入任意个参数，包括0个参数
'''

my_list = [1, 2, 3]
print(calc_sum(*my_list))
'''
6
Python允许在一个已定义的list或tuple前面加一个*号，把list或tuple的元素变成可变参数传进去
'''

def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)
person('Michael', 30)
person('Bob', 35, city='Beijing')
person('Adam', 45, gender='M', job='Engineer')
'''
name: Michael age: 30 other: {}
name: Bob age: 35 other: {'city': 'Beijing'}
name: Adam age: 45 other: {'gender': 'M', 'job': 'Engineer'}
关键字参数允许你传入0个或任意个含参数名的参数，这些关键字参数在函数内部自动组装为一个dict
也可以传入任意个数的关键字参数
关键字参数可以扩展函数的功能
'''

extra = {'city': 'Beijing', 'job': 'Engineer'}
person('Jack', 24, city=extra['city'], job=extra['job'])
person('Jack', 24, **extra)
'''
name: Jack age: 24 other: {'city': 'Beijing', 'job': 'Engineer'}
name: Jack age: 24 other: {'city': 'Beijing', 'job': 'Engineer'}
和可变参数类似，也可以先定义一个dict，然后，把该dict转换为关键字参数传进去
'''

def person(name, age, *, city, job):
    print(name, age, city, job)
person('Jack', 24, city='Beijing', job='Engineer')
'''
Jack 24 Beijing Engineer
对于关键字参数，函数的调用者可以传入任意不受限制的关键字参数。
如果要限制关键字参数的名字，就可以用命名关键字参数，例如，只接收city和job作为关键字参数。
和关键字参数**kw不同，命名关键字参数需要一个特殊分隔符*，*后面的参数被视为命名关键字参数
'''

def person(name, age, *args, city, job):
    print(name, age, args, city, job)
# person('Jack', 24, 'Beijing', 'Engineer')
'''
TypeError: person() missing 2 required keyword-only arguments: 'city' and 'job'
和位置参数不同，命名关键字参数必须传入参数名。
由于调用时缺少参数名city和job，Python解释器把前两个参数视为位置参数，后两个参数传给*args，但缺少命名关键字参数导致报错
如果函数定义中已经有了一个可变参数，后面跟着的命名关键字参数就不再需要一个特殊分隔符*了
如果没有可变参数，就必须加一个*作为特殊分隔符，否则Python解释器将无法识别位置参数和命名关键字参数
'''

def person(name, age, *, city='Beijing', job):
    print(name, age, city, job)
person('Jack', 24, job='Engineer')
'''
Jack 24 Beijing Engineer
命名关键字参数可以有缺省值，从而简化调用
由于命名关键字参数city具有默认值，调用时，可不传入city参数
'''

def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)
def f2(a, b, c=0, *, d, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)
    
f1(1, 2)
f1(1, 2, c=3)
f1(1, 2, 3, 'a', 'b')
f1(1, 2, 3, 'a', 'b', x=99)
f2(1, 2, d=99, ext=None)
'''
a = 1 b = 2 c = 0 args = () kw = {}
a = 1 b = 2 c = 3 args = () kw = {}
a = 1 b = 2 c = 3 args = ('a', 'b') kw = {}
a = 1 b = 2 c = 3 args = ('a', 'b') kw = {'x': 99}   
a = 1 b = 2 c = 0 d = 99 kw = {'ext': None}
在Python中定义函数，可以用必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数都可以组合使用
但是请注意，参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数
在函数调用的时候，Python解释器自动按照参数位置和参数名把对应的参数传进去
虽然可以组合多达5种参数，但不要同时使用太多的组合，否则函数接口的可理解性很差。
'''

args = (1, 2, 3, 4)
kw = {'d': 99, 'x': '#'}
f1(*args, **kw)
args = (1, 2, 3)
kw = {'d': 88, 'x': '#'}
f2(*args, **kw)
'''
a = 1 b = 2 c = 3 args = (4,) kw = {'d': 99, 'x': '#'}
a = 1 b = 2 c = 3 d = 88 kw = {'x': '#'}
对于任意函数，都可以通过类似func(*args, **kw)的形式调用它，无论它的参数是如何定义的
'''