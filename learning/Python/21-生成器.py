my_list = [x * x for x in range(5)]
print(my_list)
my_generator = (x * x for x in range(5))
print(my_generator)
'''
[0, 1, 4, 9, 16]
<generator object <genexpr> at 0x0000021691932CF0>
通过列表生成式可以直接创建一个列表，但是受到内存限制列表容量有限
使用生成器按照某种算法可以在循环的过程中不断推算出后续的元素，不必创建完整的list，从而节省大量的空间
把列表生成式的[]改成()，就创建了一个generator
'''

print(next(my_generator))
print(next(my_generator))
print(next(my_generator))
print(next(my_generator))
print(next(my_generator))
# print(next(my_generator))
'''
0
1
4
9
16
StopIteration
generator保存的是算法，每次调用next(my_generator)，就计算出g的下一个元素的值，直到计算到最后一个元素
没有更多的元素时，抛出StopIteration的错误
'''

def odd():
    print('step 1')
    yield 1
    print('step 2')
    yield(3)
    print('step 3')
    yield(5)
print(odd())
'''
<generator object odd at 0x000001E247B73100>
如果一个函数定义中包含yield关键字，那么这个函数就不再是一个普通函数，而是一个generator函数
调用普通函数直接返回结果，而调用一个generator函数将返回一个generator
'''

next(odd())
next(odd())
next(odd())
'''
step 1
step 1
step 1
odd()会创建一个新的generator对象，上述代码实际上创建了3个完全独立的generator
对3个generator分别调用next()每个都会返回第一个值
'''

o = odd()
print(next(o))
print(next(o))
print(next(o))
# print(next(o))
'''
step 1
1
step 2
3
step 3
5
StopIteration
正确的写法是创建一个generator对象，然后不断对这一个generator对象调用next()
generator函数在每次调用next()的时候执行，遇到yield语句返回，再次执行时从上次返回的yield语句处继续执行
执行3次yield后，已经没有yield可以执行了，所以，第4次调用next(o)就报错
'''

def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
for n in fib(6):
    print(n)
'''
1
1
2
3
5
8
在循环过程中不断调用yield，就会不断中断
要给循环设置一个条件来退出循环，否则会产生一个无限数列
'''

g = fib(6)
while True:
    try:
        x = next(g)
        print('g:', x)
    except StopIteration as e:
        print('Generator return value:', e.value)
        break
'''
g: 1
g: 1
g: 2
g: 3
g: 5
g: 8
Generator return value: done
使用for循环调用generator时，无法获得generator的return语句的返回值
如果想要拿到返回值，必须捕获StopIteration错误，返回值包含在StopIteration的value中
'''