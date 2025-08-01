# Python

Python是著名的“龟叔”Guido van Rossum在1989年圣诞节期间 , 为了打发无聊的圣诞节而编写的一个编程语言 . 龟叔给Python的定位是“优雅”, “明确”, “简单” .

优点 :

- 完成同一个任务 , C语言要写1000行代码 , Java只需要写100行 , 而Python可能只要20行 .

缺点 :

- 代码少的代价是运行速度慢 , C程序运行1秒钟 , Java程序可能需要2秒 , 而Python程序可能就需要10秒 .
- 在非常高的抽象计算中 , 高级的Python程序设计也是非常难学的 .
- 代码不能加密 , 如果要发布你的Python程序 , 实际上就是发布源代码 .

那Python适合开发哪些类型的应用呢 ?

- 首选是网络应用 , 包括网站 , 后台服务等等 ;
- 其次是许多日常需要的小工具 , 包括系统管理员需要的脚本任务等等 ;
- 另外就是把其他语言开发的程序再包装起来 , 方便使用 .

## Python基础

### 输出和输入

#### `print()`

用 `print()` 在括号中加上字符串 , 就可以向屏幕上输出指定的文字 . 比如输出 `'hello,world'` :

```python
print('hello,world')
```

 `print()` 函数也可以接受多个字符串 , 用逗号“,”隔开 , 就可以连成一串输出 :

```python
print('The quick brown fox','jumps over','the lazy dog')
The quick brown fox jumps over the lazy dog
```

 `print()` 会依次打印每个字符串 , 遇到逗号“,”会输出一个空格 .

 `print()` 也可以打印整数 , 或者计算结果 :

```python
print(300)
300
print(100 + 200)
300
```

因此 , 我们可以把计算 `100 + 200` 的结果打印得更漂亮一点 :

```python
print('100 + 200 =', 100 + 200)
100 + 200 = 300
```

注意 , 对于 `100 + 200` , Python解释器自动计算出结果`300` , 但是 , `'100 + 200 ='` 是字符串而非数学公式 , Python把它视为字符串 .

#### `input()`

Python提供了一个 `input()` , 可以让用户输入字符串 , 并存放到一个变量里 . 比如输入用户的名字 :

```python
name = input()
Michael
```

当你输入 `name = input()` 并按下回车后 , Python交互式命令行就在等待你的输入了 . 这时 , 你可以输入任意字符 , 然后按回车后完成输入 .

输入完成后 , 不会有任何提示 , 那我们刚才输入的内容到哪去了 ? 答案是存放到 `name` 变量里了 . 可以直接输入 `name` 查看变量内容 :

```python
>>>name
'Michael'
```

要打印出 `name` 变量的内容 , 除了直接写 `name` 然后按回车外 , 还可以用 `print()` 函数 :

```python
>>>print(name)
Michael
```

有了输入和输出 , 我们就可以把上次打印 `'hello, world'` 的程序改成有点意义的程序了 :

```python
name = input()
print('hello,', name)
```

运行上面的程序 , 第一行代码会让用户输入任意字符作为自己的名字 , 然后存入 `name` 变量中 ; 第二行代码会根据用户的名字向用户说 `hello` , 比如输入 `Michael :

```python
>>>Michael
hello, Michael
```

但是程序运行的时候 , 没有任何提示信息告诉用户 : "嘿 , 赶紧输入你的名字" , 这样显得很不友好 . 幸好 `input()` 可以让你显示一个字符串来提示用户 , 于是我们把代码改成 :

```python
name = input('please enter your name: ')
print('hello,', name)
```

再次运行这个程序 , 你会发现 , 程序一运行 , 会首先打印出`please enter your name:` , 这样 , 用户就可以根据提示输入名字后得到 `hello, xxx` 的输出 :

```python
please enter your name: 
>>>Michael
hello, Michael
```

##### `.split()`

 `input()` 函数本身每次只能读取一行输入 , 但你可以通过以下方法一次性获得两个输入 :

```python
# 用户输入：10 20
a, b = input("请输入两个值（空格分隔）: ").split()
print(f"a = {a}, b = {b}")  # 输出：a = 10, b = 20

# 转换为整数（如果需要）
x, y = map(int, input("请输入两个整数（空格分隔）: ").split())
print(f"x + y = {x + y}")  # 输入"3 5" → 输出"x + y = 8"
```

```python
# 用户输入：apple,orange
fruit1, fruit2 = input("请输入两个水果（逗号分隔）: ").split(',')
print(f"水果1: {fruit1}, 水果2: {fruit2}")  # 输出：水果1: apple, 水果2: orange
```

**小结**  

任何计算机程序都是为了执行一个特定的任务 , 有了输入 , 用户才能告诉计算机程序所需的信息 , 有了输出 , 程序运行后才能告诉用户任务的结果 .

输入是Input , 输出是Output , 因此 , 我们把输入输出统称为Input/Output , 或者简写为IO .

 `input()` 和 `print()` 是在命令行下面最基本的输入和输出 , 但是 , 用户也可以通过其他更高级的图形界面完成输入和输出 , 比如 , 在网页上的一个文本框输入自己的名字 , 点击“确定”后在网页上看到输出信息 .

## 数据类型和变量

### 数据类型

**在Python中 , 能够直接处理的数据类型有以下几种 :**

#### 整数 :  `%d`

Python可以处理任意大小的整数 , 当然包括负整数 , 例如 : `1` `100` `-8080` `0` , 等等 .

计算机由于使用二进制 , 所以有时候用十六进制表示整数比较方便 . 十六进制用`0x`前缀和0-9,a-f表示 , 例如 : `0xff00` `0xa5b4c3d2` , 等等 .

对于很大的数 , 例如 `10000000000` , 很难数清楚0的个数 . Python允许在数字中间以 `_` 分隔 , 因此写成`10_000_000_000` 和 `10000000000` 是完全一样的 . 十六进制数也可以写成 `0xa1b2_c3d4` .

#### 浮点数 :  `%.<标度>f`

浮点数也就是小数 , 之所以称为浮点数 , 是因为按照科学记数法表示时 , 一个浮点数的小数点位置是可变的 . 比如 , 1.23x10^9和12.3x10^8是完全相等的 . 浮点数可以用数学写法 , 如 `1.23` `3.14` `-9.01` , 等等 . 但是对于很大或很小的浮点数 , 就必须用科学计数法表示 , 把10用e替代 , 1.23x10^9就是 `1.23e9` 或者 `12.3e8` , 0.000012可以写成 `1.2e-5` , 等等 .

整数和浮点数在计算机内部存储的方式是不同的 , 整数运算永远是精确的 ( 除法难道也是精确的 ? 是的 !  )  , 而浮点数运算则可能会有四舍五入的误差 .

#### 字符串 :  `%s`

字符串是以单引号 `'` 或双引号 `"` 括起来的任意文本 , 比如 `'abc'` `"xyz"` 等等 . 请注意 , `''` 或 `""` 本身只是一种表示方式 , 不是字符串的一部分 , 因此 , 字符串 `'abc'` 只有 `a` `b` `c` 这3个字符 . 如果 `'` 本身也是一个字符 , 那就可以用 `""` 括起来 , 比如 `"I'm OK"` 包含的字符是 `I` `'` `m` 空格 `O` `K` 这6个字符 .

如果字符串内部既包含 `'` 又包含 `"` 怎么办 ? 可以用转义字符 `\` 来标识 , 比如 :

```python
'I\'m \"OK\"!'
```

表示的字符串内容是 :

```txt
I'm "OK"!
```

转义字符 `\` 可以转义很多字符 , 比如 `\n` 表示换行 , `\t` 表示制表符 , 字符 `\` 本身也要转义 , 所以 `\\` 表示的字符就是 `\` , 可以在Python的交互式命令行用 `print()` 打印字符串看看 :

```python
print('I\'m ok.')
I'm ok.
print('I\'m learning\nPython.')
I'm learning
Python.
print('\\\n\\')
\
\
```

如果字符串里面有很多字符都需要转义 , 就需要加很多 `\` , 为了简化 , Python还允许用 `r''` 表示 `''` 内部的字符串默认不转义 :

```python
print('\\\t\\')
\       \
print(r'\\\t\\')
\\\t\\
```

如果字符串内部有很多换行 , 用 `\n` 写在一行里不好阅读 , 为了简化 , Python允许用 `'''...'''` 的格式表示多行内容 :

```python
print('''line1
line2
line3''')
```

多行字符串 `'''...'''` 还可以在前面加上 `r` 使用 :

```python
print(r'''hello,\n
world''')
hello,\n
world
```

#### 布尔值

布尔值和布尔代数的表示完全一致 , 一个布尔值只有 `True` `False` 两种值 , 要么是`True` , 要么是`False` , 在Python中 , 可以直接用`True`, `False`表示布尔值 ( 请注意大小写 )  , 也可以通过布尔运算计算出来 :

```python
>>> True
True
>>> False
False
>>> 3 > 2
True
>>> 3 > 5
False
```

布尔值可以用`and` `or`和`not`运算 .

##### `and`

运算是与运算 , 只有所有都为`True` `and`运算结果才是 `True` :

```python
>>> True and True
True
>>> True and False
False
>>> False and False
False
>>> 5 > 3 and 3 > 1
True
```

##### `or`

运算是或运算 , 只要其中有一个为`True` , `or`运算结果就是`True` :

```python
>>> True or True
True
>>> True or False
True
>>> False or False
False
>>> 5 > 3 or 1 > 3
True
```

##### `not`

运算是非运算 , 它是一个单目运算符 , 把`True`变成`False` , `False`变成`True` :

```python
>>> not True
False
>>> not False
True
>>> not 1 > 2
True
```

布尔值经常用在条件判断中 , 比如 :

```python
if age >= 18:
    print('adult')
else:
    print('teenager')
```

#### 空值

空值是Python里一个特殊的值 , 用 `None` 表示 . `None`不能理解为 `0` , 因为 `0` 是有意义的 , 而 `None` 是一个特殊的空值 , 空值与空值也不相同 .

### 变量

**变量的概念基本上和初中代数的方程变量是一致的 , 只是在计算机程序中 , 变量不仅可以是数字 , 还可以是任意数据类型 .**

变量在程序中就是用一个变量名表示了 , 变量名必须是大小写英文, 数字和`_`的组合 , 且不能用数字开头 , 比如 :

```python
a = 1
```

变量`a`是一个整数 .

```python
t_007 = 'T007'
```

变量`t_007`是一个字符串 .

```python
Answer = True
```

变量`Answer`是一个布尔值`True` .

在Python中 , 等号`=`是赋值语句 , 可以把任意数据类型赋值给变量 , 同一个变量可以反复赋值 , 而且可以是不同类型的变量 , 例如 :

```python
a = 123 # a是整数
print(a)
a = 'ABC' # a变为字符串
print(a)
```

这种变量本身类型不固定的语言称之为*动态语言* , 与之对应的是*静态语言* . 静态语言在定义变量时必须指定变量类型 , 如果赋值的时候类型不匹配 , 就会报错 . 例如Java是静态语言 , 赋值语句如下 ( // 表示注释 )  :

```java
int a = 123 ; // a是整数类型变量
a = "ABC" ; // 错误:不能把字符串赋给整型变量
```

和静态语言相比 , 动态语言更灵活 , 就是这个原因 .

请不要把赋值语句的等号等同于数学的等号 . 比如下面的代码 :

```python
x = 10
x = x + 2
```

如果从数学上理解`x = x + 2`那无论如何是不成立的 , 在程序中 , 赋值语句先计算右侧的表达式`x + 2` , 得到结果`12` , 再赋给变量`x` . 由于`x`之前的值是`10` , 重新赋值后 , `x`的值变成`12` .

最后 , 理解变量在计算机内存中的表示也非常重要 . 当我们写 :

```python
a = 'ABC'
```

时 , Python解释器干了两件事情 :

1. 在内存中创建了一个`'ABC'`的字符串 ;
2. 在内存中创建了一个名为`a`的变量 , 并把它指向`'ABC'` .

也可以把一个变量`a`赋值给另一个变量`b` , 这个操作实际上是把变量`b`指向变量`a`所指向的数据 , 例如下面的代码 :

```python
a = 'ABC'
b = a
a = 'XYZ'
print(b)
```

最后一行打印出变量`b`的内容到底是`'ABC'`呢还是`'XYZ'` ? 如果从数学意义上理解 , 就会错误地得出`b`和`a`相同 , 也应该是`'XYZ'` , 但实际上`b`的值是`'ABC'` , 让我们一行一行地执行代码 , 就可以看到到底发生了什么事 :

执行`a = 'ABC'` , 解释器创建了字符串`'ABC'`和变量`a` , 并把`a`指向`'ABC'`

执行`b = a` , 解释器创建了变量`b` , 并把`b`指向`a`指向的字符串`'ABC'`

执行`a = 'XYZ'` , 解释器创建了字符串'XYZ' , 并把`a`的指向改为`'XYZ'` , 但`b`并没有更改

所以 , 最后打印变量`b`的结果自然是`'ABC'`了 .

### 常量

**所谓常量就是不能变的变量** , 比如常用的数学常数π就是一个常量 . 在Python中 , 通常用全部大写的变量名表示常量 :

```python
PI = 3.14159265359
```

但事实上 `PI` 仍然是一个变量 , Python根本没有任何机制保证 `PI` 不会被改变 , 所以 , 用全部大写的变量名表示常量只是一个习惯上的用法 , 如果你一定要改变变量 `PI` 的值 , 也没人能拦住你 .

最后解释一下整数的除法为什么也是精确的 . 在Python中 , 有两种除法 , 一种除法是`/` :

```python
>>> 10 / 3
3.3333333333333335
```

 `/` 除法计算结果是浮点数 , 即使是两个整数恰好整除 , 结果也是浮点数 :

```python
>>> 9 / 3
3.0
```

还有一种除法是 `//` , 称为地板除 , 两个整数的除法仍然是整数 :

```python
>>> 10 // 3
3
```

你没有看错 , 整数的地板除 `//` 永远是整数 , 即使除不尽 . 要做结果为浮点数的除法 , 使用 `/` 就可以 .

因为 `//` 除法只取结果的整数部分 , 所以Python还提供一个余数运算 , 可以得到两个整数相除的余数 :

```python
>>> 10 % 3
1
```

无论整数做 `//` 除法还是取余数 , 结果永远是整数 , 所以 , 整数运算的结果永远是精确的 .

**小结**  

Python支持多种数据类型 , 在计算机内部 , 可以把任何数据都看成一个“对象” , 而变量就是在程序中用来指向这些数据对象的 , 对变量赋值就是把数据和变量给关联起来 .

对变量赋值 `x = y` 是把变量 `x` 指向真正的对象 , 该对象是变量 `y` 所指向的 . 随后对变量 `y` 的赋值*不影响*变量 `x` 的指向 .

注意 : Python的整数没有大小限制 , 而某些语言的整数根据其存储长度是有大小限制的 , 例如Java对32位整数的范围限制在 `-2147483648` - `2147483647` .

Python的浮点数也没有大小限制 , 但是超出一定范围就直接表示为 `inf` ( 无限大 ) .

## 字符串和编码

### 字符编码

我们已经讲过了 , 字符串也是一种数据类型 , 但是 , 字符串比较特殊的是还有一个编码问题 .

因为计算机只能处理数字 , 如果要处理文本 , 就必须先把文本转换为数字才能处理 . 最早的计算机在设计时采用8个比特 ( bit ) 作为一个字节 ( byte )  , 所以 , 一个字节能表示的最大的整数就是255 ( 二进制11111111=十进制255 )  , 如果要表示更大的整数 , 就必须用更多的字节 . 比如两个字节可以表示的最大整数是 `65535` , 4个字节可以表示的最大整数是 `4294967295` .

由于计算机是美国人发明的 , 因此 , 最早只有127个字符被编码到计算机里 , 也就是大小写英文字母、数字和一些符号 , 这个编码表被称为 `ASCII` 编码 , 比如大写字母`A`的编码是`65` , 小写字母`z`的编码是 `122` .

但是要处理中文显然一个字节是不够的 , 至少需要两个字节 , 而且还不能和ASCII编码冲突 , 所以 , 中国制定了 `GB2312` 编码 , 用来把中文编进去 .

你可以想得到的是 , 全世界有上百种语言 , 日本把日文编到 `Shift_JIS` 里 , 韩国把韩文编到 `Euc-kr` 里 , 各国有各国的标准 , 就会不可避免地出现冲突 , 结果就是 , 在多语言混合的文本中 , 显示出来会有乱码 .

因此 , Unicode字符集应运而生 . Unicode把所有语言都统一到一套编码里 , 这样就不会再有乱码问题了 .

Unicode标准也在不断发展 , 但最常用的是UCS-16编码 , 用两个字节表示一个字符 ( 如果要用到非常偏僻的字符 , 就需要4个字节 )  . 现代操作系统和大多数编程语言都直接支持Unicode .

现在 , 捋一捋ASCII编码和Unicode编码的区别 : ASCII编码是1个字节 , 而Unicode编码通常是2个字节 .

字母`A`用ASCII编码是十进制的 `65` , 二进制的 `01000001` ;

字符`0`用ASCII编码是十进制的 `48` , 二进制的 `00110000` , 注意字符 `'0'` 和整数 `0` 是不同的 ;

汉字 `中` 已经超出了ASCII编码的范围 , 用Unicode编码是十进制的 `20013` , 二进制的 `01001110 00101101` .

你可以猜测 , 如果把ASCII编码的`A`用Unicode编码 , 只需要在前面补0就可以 , 因此 , `A`的Unicode编码是 `00000000 01000001` .

新的问题又出现了 : 如果统一成Unicode编码 , 乱码问题从此消失了 . 但是 , 如果你写的文本基本上全部是英文的话, 用Unicode编码比ASCII编码需要多一倍的存储空间 , 在存储和传输上就十分不划算 .

所以 , 本着节约的精神 , 又出现了把Unicode编码转化为“可变长编码”的 `UTF-8` 编码 . UTF-8编码把一个Unicode字符根据不同的数字大小编码成1-6个字节 , 常用的英文字母被编码成1个字节 , 汉字通常是3个字节 , 只有很生僻的字符才会被编码成4-6个字节 . 如果你要传输的文本包含大量英文字符 , 用UTF-8编码就能节省空间 :

| 字符 | ASCII    | Unicode           | UTF-8                      |
| ---- | -------- | ----------------- | -------------------------- |
| A    | 01000001 | 00000000 01000001 | 01000001                   |
| 中   |          | 01001110 00101101 | 11100100 10111000 10101101 |

从上面的表格还可以发现 , UTF-8编码有一个额外的好处 , 就是ASCII编码实际上可以被看成是UTF-8编码的一部分 , 所以 , 大量只支持ASCII编码的历史遗留软件可以在UTF-8编码下继续工作 .

搞清楚了ASCII、Unicode和UTF-8的关系 , 我们就可以总结一下现在计算机系统通用的字符编码工作方式 :

在计算机内存中 , 统一使用Unicode编码 , 当需要保存到硬盘或者需要传输的时候 , 就转换为UTF-8编码 .

用记事本编辑的时候 , 从文件读取的UTF-8字符被转换为Unicode字符到内存里 , 编辑完成后 , 保存的时候再把Unicode转换为UTF-8保存到文件 :

![rw-file-utf-8](https://liaoxuefeng.com/books/python/basic/string-encoding/file.png)

浏览网页的时候 , 服务器会把动态生成的Unicode内容转换为UTF-8再传输到浏览器 :

![web-utf-8](https://liaoxuefeng.com/books/python/basic/string-encoding/webpage.png)

所以你看到很多网页的源码上会有类似``的信息 , 表示该网页正是用的UTF-8编码 .

### Python的字符串

#### `'str'`

在最新的Python 3版本中 , 字符串是以Unicode编码的 , 也就是说 , Python的字符串支持多语言 , 例如 :

```python
print('包含中文的str')
包含中文的str
```

#### `ord()`

#### `chr()`

对于单个字符的编码 , Python提供了 `ord()` 函数获取字符的整数表示 , `chr()` 函数把编码转换为对应的字符 :

```python
ord('A')
65
ord('中')
20013
chr(66)
'B'
chr(25991)
'文'
```

如果知道字符的整数编码 , 还可以用十六进制这么写 `str` :

```python
'\u4e2d\u6587'
'中文'
```

两种写法完全是等价的 .

由于Python的字符串类型是 `str` , 在内存中以Unicode表示 , 一个字符对应若干个字节 . 如果要在网络上传输 , 或者保存到磁盘上 , 就需要把 `str` 变为以字节为单位的 `bytes` .

#### `b'<str>'`

Python对 `bytes` 类型的数据用带 `b` 前缀的单引号或双引号表示 :

```python
x = b'ABC'
```

要注意区分 `'ABC'` 和 `b'ABC'` , 前者是 `str` , 后者虽然内容显示得和前者一样 , 但 `bytes` 的每个字符都只占用一个字节 .

#### `encode()`

以Unicode表示的 `str` 通过 `encode()` 方法可以编码为指定的 `bytes` , 例如 :

```python
'ABC'.encode('ascii')
b'ABC'
'中文'.encode('utf-8')
b'\xe4\xb8\xad\xe6\x96\x87'
'中文'.encode('ascii')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)
```

纯英文的 `str` 可以用`ASCII`编码为 `bytes` , 内容是一样的 , 含有中文的 `str` 可以用 `UTF-8` 编码为 `bytes` . 含有中文的 `str` 无法用 `ASCII` 编码 , 因为中文编码的范围超过了 `ASCII` 编码的范围 , Python会报错 .

在 `bytes` 中 , 无法显示为ASCII字符的字节 , 用 `\x##` 显示 .

#### `decode()`

反过来 , 如果我们从网络或磁盘上读取了字节流 , 那么读到的数据就是 `bytes` . 要把 `bytes` 变为 `str` , 就需要用 `decode()` 方法 :

```python
b'ABC'.decode('ascii')
'ABC'
b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')
'中文'
```

如果 `bytes` 中包含无法解码的字节 , `decode()` 方法会报错 :

```python
b'\xe4\xb8\xad\xff'.decode('utf-8')
Traceback (most recent call last):
  ...
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 3: invalid start byte
```

如果 `bytes` 中只有一小部分无效的字节 , 可以传入 `errors='ignore'` 忽略错误的字节 :

```python
b'\xe4\xb8\xad\xff'.decode('utf-8', errors='ignore')
'中'
```

#### `len()`

要计算 `str` 包含多少个字符 , 可以用 `len()` 函数 :

```python
len('ABC')
3
len('中文')
2
```

 `len()` 函数计算的是 `str` 的字符数 , 如果换成 `bytes` , `len()` 函数就计算字节数 :

```python
len(b'ABC')
3
len(b'\xe4\xb8\xad\xe6\x96\x87')
6
len('中文'.encode('utf-8'))
6
```

可见 , 1个中文字符经过UTF-8编码后通常会占用3个字节 , 而1个英文字符只占用1个字节 .

在操作字符串时 , 我们经常遇到 `str` 和 `bytes` 的互相转换 . 为了避免乱码问题 , 应当始终坚持使用UTF-8编码对 `str` 和 `bytes` 进行转换 .

由于Python源代码也是一个文本文件 , 所以 , 当你的源代码中包含中文的时候 , 在保存源代码时 , 就需要务必指定保存为UTF-8编码 . 当Python解释器读取源代码时 , 为了让它按UTF-8编码读取 , 我们通常在文件开头写上这两行 :

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

第一行注释是为了告诉Linux/OS X系统 , 这是一个Python可执行程序 , Windows系统会忽略这个注释 ;

第二行注释是为了告诉Python解释器 , 按照UTF-8编码读取源代码 , 否则 , 你在源代码中写的中文输出可能会有乱码 .

申明了UTF-8编码并不意味着你的 `.py` 文件就是UTF-8编码的 , 必须并且要确保文本编辑器正在使用UTF-8编码 .

如果 `.py` 文件本身使用UTF-8编码 , 并且也申明了 `# -*- coding: utf-8 -*-` , 打开命令提示符测试就可以正常显示中文 .

### 格式化

最后一个常见的问题是如何输出格式化的字符串 . 我们经常会输出类似 `'亲爱的xxx你好！你xx月的话费是xx , 余额是xx'` 之类的字符串 , 而xxx的内容都是根据变量变化的 , 所以 , 需要一种简便的格式化字符串的方式 .

在Python中 , 采用的格式化方式和C语言是一致的 , 用 `%` 实现 , 举例如下 :

```python
'Hello, %s' % 'world'
'Hello, world'
'Hi, %s, you have $%d.' % ('Michael', 1000000)
'Hi, Michael, you have $1000000.'
```

你可能猜到了 , `%`运算符就是用来格式化字符串的 . 在字符串内部 , `%s`表示用字符串替换 , `%d`表示用整数替换 , 有几个`%?`占位符 , 后面就跟几个变量或者值 , 顺序要对应好 . 如果只有一个`%?` , 括号可以省略 .

常见的占位符有 :

| 占位符 |   替换内容   |
| :----: | :----------: |
|   %d   |     整数     |
|   %f   |    浮点数    |
|   %s   |    字符串    |
|   %x   | 十六进制整数 |

其中 , 格式化整数和浮点数还可以指定是否补0和整数与小数的位数 :

```python
print('%2d-%02d' % (3, 1))
print('%.2f' % 3.1415926)
```

如果你不太确定应该用什么 , `%s` 永远起作用 , 它会把任何数据类型转换为字符串 :

```python
>>> 'Age: %s. Gender: %s' % (25, True)
'Age: 25. Gender: True'
```

有些时候 , 字符串里面的 `%` 是一个普通字符怎么办 ? 这个时候就需要转义 , 用 `%%` 来表示一个 `%` :

```python
>>> 'growth rate: %d %%' % 7
'growth rate: 7 %'
```

### `format()`

另一种格式化字符串的方法是使用字符串的 `format()` 方法 , 它会用传入的参数依次替换字符串内的占位符 `{0}`{1}`…… , 不过这种方式写起来比%要麻烦得多 :

```python
>>> 'Hello, {0}, 成绩提升了 {1:.1f}%'.format('小明', 17.125)
'Hello, 小明, 成绩提升了 17.1%'
```

### `f-string`

最后一种格式化字符串的方法是使用以 `f` 开头的字符串 , 称之为 `f-string` , 它和普通字符串不同之处在于 , 字符串如果包含 `{xxx}` , 就会以对应的变量替换 :

```python
r = 2.5
s = 3.14 * r ** 2
print(f'The area of a circle with radius {r} is {s:.2f}')
The area of a circle with radius 2.5 is 19.62
```

上述代码中 , `{r}` 被变量 `r` 的值替换 , `{s:.2f}` 被变量 `s` 的值替换 , 并且 `:` 后面的 `.2f` 指定了格式化参数 ( 即保留两位小数 )  , 因此 , `{s:.2f}` 的替换结果是 `19.62` .

**练习**  

小明的成绩从去年的72分提升到了今年的85分 , 请计算小明成绩提升的百分点 , 并用字符串格式化显示出 `'xx.x%'` , 只保留小数点后1位 :

```python
s1 = 72
s2 = 85
r = (S2 - S1)/S1*100
print('小明成绩提升了%.1f' % r)
```

**小结**  

Python 3的字符串使用Unicode , 直接支持多语言 .

当 `str` 和 `bytes` 互相转换时 , 需要指定编码 . 最常用的编码是 `UTF-8` . Python当然也支持其他编码方式 , 比如把Unicode编码成 `GB2312` :

```python
'中文'.encode('gb2312')
b'\xd6\xd0\xce\xc4'
```

但这种方式纯属自找麻烦 , 如果没有特殊业务要求 , 请牢记仅使用 `UTF-8` 编码 .

格式化字符串的时候 , 可以用Python的交互式环境测试 , 方便快捷 .

## 使用list和tuple

### list

#### `[]`

Python内置的一种数据类型是列表 : list . list是一种有序的集合 , 可以随时添加和删除其中的元素 .

比如 , 列出班里所有同学的名字 , 就可以用一个list表示 :

```python
classmates = ['Michael', 'Bob', 'Tracy']
classmates
['Michael', 'Bob', 'Tracy']
```

变量 `classmates` 就是一个list . 用 `len()` 函数可以获得list元素的个数 :

```python
len(classmates)
3
```

#### `[索引号]`

用索引来访问list中每一个位置的元素 , 记得索引是从`0`开始的 :

```python
classmates[0]
'Michael'
classmates[1]
'Bob'
classmates[2]
'Tracy'
classmates[3]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

当索引超出了范围时 , Python会报一个`IndexError`错误 , 所以 , 要确保索引不要越界 , 记得最后一个元素的索引是`len(classmates) - 1` .

如果要取最后一个元素 , 除了计算索引位置外 , 还可以用`-1`做索引 , 直接获取最后一个元素 :

```python
classmates[-1]
'Tracy'
```

以此类推 , 可以获取倒数第2个,倒数第3个 :

```python
classmates[-2]
'Bob'
classmates[-3]
'Michael'
classmates[-4]
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
IndexError: list index out of range
```

当然 , 倒数第4个就越界了 .

#### `append()`

list是一个可变的有序表 , 所以 , 可以往list中追加元素到末尾 :

```python
classmates.append('Adam')
classmates
['Michael', 'Bob', 'Tracy', 'Adam']
```

#### `insert()`

也可以把元素插入到指定的位置 , 比如索引号为 `1` 的位置 :

```python
classmates.insert(1, 'Jack')
classmates
['Michael', 'Jack', 'Bob', 'Tracy', 'Adam']
```

#### `pop()`

要删除list末尾的元素 , 用 `pop()` 方法 :

```python
>>> classmates.pop()
'Adam'
>>> classmates
['Michael', 'Jack', 'Bob', 'Tracy']
```

要删除指定位置的元素 , 用`pop(i)`方法 , 其中`i`是索引位置 :

```python
>>> classmates.pop(1)
'Jack'
>>> classmates
['Michael', 'Bob', 'Tracy']
```

#### `extend()`

合并两个列表,本质上是将一个列表扩充至另一个列表中

```python
list1 = [1, 2, 3]
list2 = ['a', 'b', 'c']
list1.extend(list2)  # 直接修改 list1
print(list1)  # 输出: [1, 2, 3, 'a', 'b', 'c'] 
```

要把某个元素替换成别的元素 , 可以直接赋值给对应的索引位置 :

```python
>>> classmates[1] = 'Sarah'
>>> classmates
['Michael', 'Sarah', 'Tracy']
```

list里面的元素的数据类型也可以不同 , 比如 :

```python
>>> L = ['Apple', 123, True]
```

list元素也可以是另一个list , 比如 :

```python
>>> s = ['python', 'java', ['asp', 'php'], 'scheme']
>>> len(s)
4
```

要注意 `s` 只有4个元素 , 其中 `s[2]` 又是一个list , 如果拆开写就更容易理解了 :

```python
>>> p = ['asp', 'php']
>>> s = ['python', 'java', p, 'scheme']
```

**要拿到 `'php'` 可以写 `p[1]` 或者 `s[2][1]`** , 因此 `s` 可以看成是一个二维数组 , 类似的还有三维, 四维……数组 , 不过很少用到 .

如果一个list中一个元素也没有 , 就是一个空的list , 它的长度为0 :

```python
>>> L = []
>>> len(L)
0
```

### tuple

#### `()`

另一种有序列表叫元组 : tuple . tuple和list非常类似 , 但是**tuple一旦初始化就不能修改** , 比如同样是列出同学的名字 :

```python
>>> classmates = ('Michael', 'Bob', 'Tracy')
```

现在 , classmates这个tuple不能变了 , 它也没有 `append()` `insert()` 这样的方法 . 其他获取元素的方法和list是一样的 , 你可以正常地使用`classmates[0]` , `classmates[-1]` , 但不能赋值成另外的元素 .

不可变的tuple有什么意义 ? 因为tuple不可变 , 所以代码更安全 . 如果可能 , 能用tuple代替list就尽量用tuple .

tuple的陷阱 : 当你定义一个tuple时 , 在定义的时候 , tuple的元素就必须被确定下来 , 比如 :

```python
>>> t = (1, 2)
>>> t
(1, 2)
```

如果要定义一个空的tuple , 可以写成`()` :

```python
>>> t = ()
>>> t
()
```

但是 , 要定义一个只有1个元素的tuple , 如果你这么定义 :

```python
>>> t = (1)
>>> t
1
```

定义的不是tuple , 是 `1` 这个数！这是因为括号 `()` 既可以表示tuple , 又可以表示数学公式中的小括号 , 这就产生了歧义 , 因此 , Python规定 , 这种情况下 , 按小括号进行计算 , 计算结果自然是`1` .

所以 , 只有1个元素的tuple定义时必须加一个逗号 `,` , 来消除歧义 :

```python
>>> t = (1,)
>>> t
(1,)
```

Python在显示只有1个元素的tuple时 , 也会加一个逗号 `,` , 以免你误解成数学计算意义上的括号 .

最后来看一个“可变的”tuple :

```python
>>> t = ('a', 'b', ['A', 'B'])
>>> t[2][0] = 'X'
>>> t[2][1] = 'Y'
>>> t
('a', 'b', ['X', 'Y'])
```

这个tuple定义的时候有3个元素 , 分别是`'a'` , `'b'`和一个list . 不是说tuple一旦定义后就不可变了吗 ? 怎么后来又变了 ?

别急 , 我们先看看定义的时候tuple包含的3个元素 :

当我们把list的元素`'A'`和`'B'`修改为`'X'`和`'Y'`后 , tuple变为 :

表面上看 , tuple的元素确实变了 , 但其实变的不是tuple的元素 , 而是list的元素 . tuple一开始指向的list并没有改成别的list , 所以 , tuple所谓的“不变”是说 , tuple的每个元素 , 指向永远不变 . 即指向 `'a'` , 就不能改成指向 `'b'` , 指向一个list , 就不能改成指向其他对象 , 但指向的这个list本身是可变的 !

理解了“指向不变”后 , 要创建一个内容也不变的tuple怎么做 ? 那就必须保证tuple的每一个元素本身也不能变 .

**练习**  

请用索引取出下面list的指定元素 :

```python
L = [
    ['Apple', 'Google', 'Microsoft'],
    ['Java', 'Python', 'Ruby', 'PHP'],
    ['Adam', 'Bart', 'Bob']
]
```

```python
# 打印Apple:
print(L[0][0])
```

```python
# 打印Python:
print(L[1][1])
```

```python
# 打印Bob:
print(L[-1][-1])
```

**小结**  

list和tuple是Python内置的有序集合 , 一个可变 , 一个不可变 . 根据需要来选择使用它们 .

## 条件判断

计算机之所以能做很多自动化的任务 , 因为它可以自己做条件判断 .

### `if`

比如 , 输入用户年龄 , 根据年龄打印不同的内容 , 在Python程序中 , 用 `if` 语句实现 :

```python
age = 20
if age >= 18:
    print('your age is', age)
    print('adult')
```

根据Python的缩进规则 , 如果 `if` 语句判断是 `True` , 就把缩进的两行print语句执行了 , 否则 , 什么也不做 .

### `else`

也可以给 `if` 添加一个 `else` 语句 , 意思是 , 如果 `if` 判断是 `False` , 不要执行 `if` 的内容 , 去把 `else` 执行了 :

```python
age = 3
if age >= 18:
    print('your age is', age)
    print('adult')
else:
    print('your age is', age)
    print('teenager')
```

**注意不要少写了冒号 `:` .**

### `elif`

当然上面的判断是很粗略的 , 完全可以用 `elif` 做更细致的判断 :

```python
age = 3
if age >= 18:
    print('adult')
elif age >= 6:
    print('teenager')
else:
    print('kid')
```

 `elif` 是 `else if` 的缩写 , 完全可以有多个 `elif` , 所以 `if` 语句的完整形式就是 :

```python
if <条件判断1>:
    <执行1>
elif <条件判断2>:
    <执行2>
elif <条件判断3>:
    <执行3>
else:
    <执行4>
```

 `if` 语句执行有个特点 , 它是从上往下判断 , 如果在某个判断上是 `True` , 把该判断对应的语句执行后 , 就忽略掉剩下的 `elif` 和 `else` , 所以 , 请测试并解释为什么下面的程序打印的是 `teenager` :

```python
age = 20
if age >= 6: # 判断结果为 TURE,执行对应指令
    print('teenager') # 执行完毕,终止if语句,忽略以下代码
elif age >= 18:
    print('adult')
else:
    print('kid')
```

 `if` 判断条件还可以简写 , 比如写 :

```python
if x:
    print('True')
```

只要 `x` 是非零数值、非空字符串、非空list等 , 就判断为 `True` , 否则为 `False` .

### 再议input

#### `int()`

最后看一个有问题的条件判断 . 很多同学会用 `input()` 读取用户的输入 , 这样可以自己输入 , 程序运行得更有意思 :

```python
birth = input('birth: ')
if birth < 2000:
    print('00前')
else:
    print('00后')
```

输入 `1982` , 结果报错 :

```plain
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unorderable types: str() > int()
```

这是因为 `input()` 返回的数据类型是 `str` , `str` 不能直接和整数比较 , 必须先把 `str` 转换成整数 . Python提供了 `int()` 函数来完成这件事情 :

```python
s = input('birth: ')
birth = int(s)
if birth < 2000:
    print('00前')
else:
    print('00后')
```

再次运行 , 就可以得到正确地结果 . 但是 , 如果输入 `abc` 呢 ? 又会得到一个错误信息 :

```plain
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
ValueError: invalid literal for int() with base 10: 'abc'
```

原来 `int()` 函数发现一个字符串并不是合法的数字时就会报错 , 程序就退出了 .

如何检查并捕获程序运行期的错误呢 ? 后面的错误和调试会讲到 .

**练习**  

小明身高1.75 , 体重80.5kg . 请根据BMI公式 ( 体重除以身高的平方 ) 帮小明计算他的BMI指数 , 并根据BMI指数 :

- 低于18.5 : 过轻
- 18.5-25 : 正常
- 25-28 : 过重
- 28-32 : 肥胖
- 高于32 : 严重肥胖

用 `if-elif` 判断并打印结果 :

```python
height = 1.75
weight = 80.5

bmi = weight / (height * height)

if bmi > 32:
    print('严重肥胖')
elif bmi > 28:
    print('肥胖')
elif bmi > 25:
    print('过重')
elif bmi > 18.5:
    print('正常')
else:
    print('过轻')
    pass
```

**小结**  

条件判断可以让计算机自己做选择 , Python的if...elif...else很灵活 .

条件判断从上向下匹配 , 当满足条件时执行对应的块内语句 , 后续的elif和else都不再执行 .

## 模式匹配

### `match case`

当我们用 `if ... elif ... elif ... else ...` 判断时 , 会写很长一串代码 , 可读性较差 .

如果要针对某个变量匹配若干种情况 , 可以使用 `match` 语句 .

例如 , 某个学生的成绩只能是 `A`、`B`、`C` , 用 `if` 语句编写如下 :

```python
score = 'B'
if score == 'A':
    print('score is A.')
elif score == 'B':
    print('score is B.')
elif score == 'C':
    print('score is C.')
else:
    print('invalid score.')
```

如果用`match`语句改写 , 则改写如下 :

```python
score = 'B'

match score:
    case 'A':
        print('score is A.')
    case 'B':
        print('score is B.')
    case 'C':
        print('score is C.')
    case _: # _表示匹配到其他任何情况
        print('score is ???.')
```

使用 `match` 语句时 , 我们依次用 `case xxx` 匹配 , 并且可以在最后（且仅能在最后）加一个 `case _` 表示“任意值” , 代码较 `if ... elif ... else ...` 更易读 .

#### 复杂匹配

`match`语句除了可以匹配简单的单个值外 , 还可以匹配多个值、匹配一定范围 , 并且把匹配后的值绑定到变量 :

```python
age = 15

match age:
    case x if x < 10:
        print(f'< 10 years old: {x}')
    case 10:
        print('10 years old.')
    case 11 | 12 | 13 | 14 | 15 | 16 | 17 | 18:
        print('11~18 years old.')
    case 19:
        print('19 years old.')
    case _:
        print('not sure.')
```

在上面这个示例中 , 第一个 `case x if x < 10` 表示当 `age < 10` 成立时匹配 , 且赋值给变量 `x` , 第二个 `case 10` 仅匹配单个值 , 第三个 `case 11|12|...|18` 能匹配多个值 , 用 `|` 分隔 .

可见 , `match` 语句的 `case` 匹配非常灵活 .

#### 匹配列表

 `match` 语句还可以匹配列表 , 功能非常强大 .

我们假设用户输入了一个命令 , 用 `args = ['gcc', 'hello.c']` 存储 , 下面的代码演示了如何用 `match` 匹配来解析这个列表 :

```python
args = ['gcc', 'hello.c', 'world.c']
# args = ['clean']
# args = ['gcc']

match args:
    # 如果仅出现gcc , 报错:
    case ['gcc']:
        print('gcc: missing source file(s).')
    # 出现gcc , 且至少指定了一个文件:
    case ['gcc', file1, *files]:
        print('gcc compile: ' + file1 + ', ' + ', '.join(files))
    # 仅出现clean:
    case ['clean']:
        print('clean')
    case _:
        print('invalid command.')
```

第一个 `case ['gcc']` 表示列表仅有 `'gcc'` 一个字符串 , 没有指定文件名 , 报错；

第二个 `case ['gcc', file1, *files]` 表示列表第一个字符串是 `'gcc'` , 第二个字符串绑定到变量 `file1` , 后面的任意个字符串绑定到 `*files` （符号 `*` 的作用将在**函数的参数**中讲解） , 它实际上表示至少指定一个文件；

第三个 `case ['clean']` 表示列表仅有 `'clean'` 一个字符串；

最后一个 `case _` 表示其他所有情况 .

可见 , `match` 语句的匹配规则非常灵活 , 可以写出非常简洁的代码 .

## 循环

要计算1+2+3 , 我们可以直接写表达式 :

```plain
>>> 1 + 2 + 3
6
```

要计算1+2+3+...+10 , 勉强也能写出来 .

但是 , 要计算1+2+3+...+10000 , 直接写表达式就不可能了 .

为了让计算机能计算成千上万次的重复运算 , 我们就需要循环语句 .

### `for...in...`

Python的循环有两种 , 一种是for...in循环 , 依次把list或tuple中的每个元素迭代出来 , 看例子 :

```python
names = ['Michael', 'Bob', 'Tracy']
for name in names:
    print(name)
```

执行这段代码 , 会依次打印 `names` 的每一个元素 :

```plain
Michael
Bob
Tracy
```

所以 `for x in ...` 循环就是把每个元素代入变量`x` , 然后执行缩进块的语句 .

再比如我们想计算1-10的整数之和 , 可以用一个`sum`变量做累加 :

```python
sum = 0
for x in [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]:
    sum = sum + x
print(sum)
```

#### `range()`

#### `list()`  

如果要计算1-100的整数之和 , 从1写到100有点困难 , 幸好Python提供一个`range()`函数 , 可以生成一个整数序列 , 再通过`list()`函数可以转换为list . 比如`range(5)`生成的序列是从0开始小于5的整数 :

```plain
>>> list(range(5))
[0, 1, 2, 3, 4]
```

 `range(101)` 就可以生成0-100的整数序列 , 计算如下 :

```python
sum = 0
for x in range(101):
    sum = sum + x
print(sum)
```

请自行运行上述代码 , 看看结果是不是当年高斯同学心算出的5050 .

### `while`

第二种循环是while循环 , 只要条件满足 , 就不断循环 , 条件不满足时退出循环 . 比如我们要计算100以内所有奇数之和 , 可以用while循环实现 :

```python
sum = 0
n = 99
while n > 0:
    sum = sum + n
    n = n - 2
print(sum)
```

在循环内部变量 `n` 不断自减 , 直到变为 `-1` 时 , 不再满足while条件 , 循环退出 .

**练习**  

请利用循环依次对list中的每个名字打印出`Hello, xxx!` :

```python
L = ['Bart', 'Lisa', 'Adam']
for name in L:
    print('Hello, %s!' % name)
```

### `break`

在循环中 , `break`语句可以提前退出循环 . 例如 , 本来要循环打印1～100的数字 :

```python
n = 1
while n <= 100:
    print(n)
    n = n + 1
print('END')
```

上面的代码可以打印出1~100 .

如果要提前结束循环 , 可以用 `break` 语句 :

```python
n = 1
while n <= 100:
    if n > 10: # 当n = 11时 , 条件满足 , 执行break语句
        break # break语句会结束当前循环
    print(n)
    n = n + 1
print('END')
```

执行上面的代码可以看到 , 打印出1~10后 , 紧接着打印 `END` , 程序结束 .

可见`break`的作用是提前结束循环 .

### `continue`

在循环过程中 , 也可以通过 `continue` 语句 , 跳过当前的这次循环 , 直接开始下一次循环 .

```python
n = 0
while n < 10:
    n = n + 1
    print(n)
```

上面的程序可以打印出1～10 . 但是 , 如果我们想只打印奇数 , 可以用`continue`语句跳过某些循环 :

```python
n = 0
while n < 10:
    n = n + 1
    if n % 2 == 0: # 如果n是偶数 , 执行continue语句
        continue # continue语句会直接继续下一轮循环 , 后续的print()语句不会执行
    print(n)
```

执行上面的代码可以看到 , 打印的不再是1～10 , 而是1 , 3 , 5 , 7 , 9 .

可见 `continue` 的作用是提前结束本轮循环 , 并直接开始下一轮循环 .

**小结**  

循环是让计算机做重复任务的有效的方法 .

 `break` 语句可以在循环过程中直接退出循环 , 而 `continue` 语句可以提前结束本轮循环 , 并直接开始下一轮循环 . 这两个语句通常都*必须*配合 `if` 语句使用 .

要特别注意 , 不要滥用 `break` 和 `continue` 语句 . `break` 和 `continue`会造成代码执行逻辑分叉过多 , 容易出错 . 大多数循环并不需要用到 `break` 和 `continue` 语句 , 上面的两个例子 , 都可以通过改写循环条件或者修改循环逻辑 , 去掉 `break` 和 `continue` 语句 .

有些时候 , 如果代码写得有问题 , 会让程序陷入“死循环” , 也就是永远循环下去 . 这时可以用 `Ctrl+C` 退出程序 , 或者强制结束Python进程 .

请试写一个死循环程序 .

```python

```

## 使用dict和set

### dict

Python内置了字典：dict的支持，dict全称dictionary，在其他语言中也称为map，使用键-值（key-value）存储，具有极快的查找速度。

举个例子，假设要根据同学的名字查找对应的成绩，如果用list实现，需要两个list：

```python
names = ['Michael', 'Bob', 'Tracy']
scores = [95, 75, 85]
```

给定一个名字，要查找对应的成绩，就先要在names中找到对应的位置，再从scores取出对应的成绩，list越长，耗时越长。

如果用dict实现，只需要一个“名字”-“成绩”的对照表，直接根据名字查找成绩，无论这个表有多大，查找速度都不会变慢。用Python写一个dict如下：

```plain
>>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>>> d['Michael']
95
```

为什么dict查找速度这么快？因为dict的实现原理和查字典是一样的。假设字典包含了1万个汉字，我们要查某一个字，一个办法是把字典从第一页往后翻，直到找到我们想要的字为止，这种方法就是在list中查找元素的方法，list越大，查找越慢。

第二种方法是先在字典的索引表里（比如部首表）查这个字对应的页码，然后直接翻到该页，找到这个字。无论找哪个字，这种查找速度都非常快，不会随着字典大小的增加而变慢。

dict就是第二种实现方式，给定一个名字，比如 `'Michael'`，dict在内部就可以直接计算出 `Michael` 对应的存放成绩的“页码”，也就是 `95` 这个数字存放的内存地址，直接取出来，所以速度非常快。

你可以猜到，这种key-value存储方式，在放进去的时候，必须根据key算出value的存放位置，这样，取的时候才能根据key直接拿到value。

把数据放入dict的方法，除了初始化时指定外，还可以通过key放入：

```plain
>>> d['Adam'] = 67
>>> d['Adam']
67
```

由于一个key只能对应一个value，所以，多次对一个key放入value，后面的值会把前面的值冲掉：

```plain
>>> d['Jack'] = 90
>>> d['Jack']
90
>>> d['Jack'] = 88
>>> d['Jack']
88
```

如果key不存在，dict就会报错：

```plain
>>> d['Thomas']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Thomas'
```

#### `in`

要避免key不存在的错误，有两种办法，一是通过 `in` 判断key是否存在：

```plain
>>> 'Thomas' in d
False
```

#### `get()`

二是通过 `dict` 提供的`get()`方法，如果key不存在，可以返回`None`，或者自己指定的value：

```plain
>>> d.get('Thomas')
>>> d.get('Thomas', -1)
-1
```

注意：返回 `None` 的时候Python的交互环境不显示结果。

#### `pop()`

要删除一个key，用 `pop(key)` 方法，对应的value也会从dict中删除：

```plain
>>> d.pop('Bob')
75
>>> d
{'Michael': 95, 'Tracy': 85}
```

请务必注意， dict内部存放的顺序和key放入的顺序是没有关系的。

和list比较，dict有以下几个特点：

1. 查找和插入的速度极快，不会随着key的增加而变慢；
2. 需要占用大量的内存，内存浪费多。

而list相反：

1. 查找和插入的时间随着元素的增加而增加；
2. 占用空间小，浪费内存很少。

所以，dict是用空间来换取时间的一种方法。

dict可以用在需要高速查找的很多地方，在Python代码中几乎无处不在，正确使用dict非常重要，需要牢记的第一条就是dict的key必须是**不可变对象**。

这是因为dict根据key来计算value的存储位置，如果每次计算相同的key得出的结果不同，那dict内部就完全混乱了。这个通过key计算位置的算法称为哈希算法（Hash）。

要保证hash的正确性，作为key的对象就不能变。在Python中，字符串、整数等都是不可变的，因此，可以放心地作为key。而list是可变的，就不能作为key：

```plain
>>> key = [1, 2, 3]
>>> d[key] = 'a list'
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: unhashable type: 'list'
```

```python
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
```

### set

set和dict类似，也是一组key的集合，但不存储value。由于key不能重复，所以，在set中，没有重复的key。

要创建一个set，用`{x,y,z,...}`列出每个元素：

```plain
>>> s = {1, 2, 3}
>>> s
{1, 2, 3}
```

或者提供一个list作为输入集合：

```plain
>>> s = set([1, 2, 3])
>>> s
{1, 2, 3}
```

注意，传入的参数`[1, 2, 3]`是一个list，而显示的`{1, 2, 3}`只是告诉你这个set内部有1，2，3这3个元素，显示的顺序也不表示set是有序的。。

重复元素在set中自动被过滤：

```plain
>>> s = {1, 1, 2, 2, 3, 3}
>>> s
{1, 2, 3}
```

#### `add()`

通过 `add(key)` 方法可以添加元素到set中，可以重复添加，但不会有效果：

```plain
>>> s.add(4)
>>> s
{1, 2, 3, 4}
>>> s.add(4)
>>> s
{1, 2, 3, 4}
```

#### `remove()`

通过`remove(key)`方法可以删除元素：

```plain
>>> s.remove(4)
>>> s
{1, 2, 3}
```

set可以看成数学意义上的无序和无重复元素的集合，因此，两个set可以做数学意义上的交集、并集等操作：

```plain
>>> s1 = {1, 2, 3}
>>> s2 = {2, 3, 4}
>>> s1 & s2
{2, 3}
>>> s1 | s2
{1, 2, 3, 4}
```

```python
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
```

set和dict的唯一区别仅在于没有存储对应的value，但是，set的原理和dict一样，所以，同样不可以放入可变对象，因为无法判断两个可变对象是否相等，也就无法保证set内部“不会有重复元素”。试试把list放入set，看看是否会报错。

### 再议不可变对象

上面我们讲了，str是不变对象，而list是可变对象。

对于可变对象，比如list，对list进行操作，list内部的内容是会变化的，比如：

```plain
>>> a = ['c', 'b', 'a']
>>> a.sort()
>>> a
['a', 'b', 'c']
```

而对于不可变对象，比如str，对str进行操作呢：

```plain
>>> a = 'abc'
>>> a.replace('a', 'A')
'Abc'
>>> a
'abc'
```

虽然字符串有个`replace()`方法，也确实变出了`'Abc'`，但变量`a`最后仍是`'abc'`，应该怎么理解呢？

我们先把代码改成下面这样：

```plain
>>> a = 'abc'
>>> b = a.replace('a', 'A')
>>> b
'Abc'
>>> a
'abc'
```

要始终牢记的是，`a`是变量，而`'abc'`才是字符串对象！有些时候，我们经常说，对象`a`的内容是`'abc'`，但其实是指，`a`本身是一个变量，它指向的对象的内容才是`'abc'`：

```plain
┌───┐    ┌───────┐
│ a │--->│ 'abc' │
└───┘    └───────┘
```

当我们调用`a.replace('a', 'A')`时，实际上调用方法`replace`是作用在字符串对象`'abc'`上的，而这个方法虽然名字叫`replace`，但却没有改变字符串`'abc'`的内容。相反，`replace`方法创建了一个新字符串`'Abc'`并返回，如果我们用变量`b`指向该新字符串，就容易理解了，变量`a`仍指向原有的字符串`'abc'`，但变量`b`却指向新字符串`'Abc'`了：

```plain
┌───┐    ┌───────┐
│ a │--->│ 'abc' │
└───┘    └───────┘
┌───┐    ┌───────┐
│ b │--->│ 'Abc' │
└───┘    └───────┘
```

所以，对于不变对象来说，调用对象自身的任意方法，也不会改变该对象自身的内容。相反，这些方法会创建新的对象并返回，这样，就保证了不可变对象本身永远是不可变的。

**小结**  

使用key-value存储结构的dict在Python中非常有用，选择不可变对象作为key很重要，最常用的key是字符串。

tuple虽然是不变对象，但试试把`(1, 2, 3)`和`(1, [2, 3])`放入dict或set中，并解释结果。

## 函数

**练习**  

请利用Python内置的`hex()`函数把一个整数转换成十六进制表示的字符串：

```python
n1 = 255
n2 = 1000

print(???)
```
