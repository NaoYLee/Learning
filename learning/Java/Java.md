# Java

Java介于编译型语言和解释型语言之间，通过将代码编译成一种“字节码”，针对不同平台编写虚拟机，不同平台的虚拟机负责加载字节码并执行。

## Java的版本

- Java SE
  - Standard Edition
  - 标准版，包含标准的JVM和标准库
- Java EE
  - Enterprise Edition
  - 企业版，在Java SE的基础上加上了大量的API和库，以便开发Web应用、数据库、消息服务等
- Java ME
  - Micro Edition
  - 针对嵌入式设备的“瘦身版”，Java SE的标准库无法在Java ME上使用，Java ME的虚拟机也是“瘦身版”

## 名词解释

- JDK
  - Java Development Kit
  - JDK包含JRE，还提供编译器、调试器等开发工具
- JRE
  - Java Runtime Environment
  - 运行Java字节码的虚拟机
- JSR规范
  - Java Specification Request
  - 为了保证Java语言的规范性，针对某种功能事先创建一个规范，将从JVM的内存模型到Web程序接口全部标准化
- JCP组织
  - Java Community Process
  - 负责审核JSR标准的组织
- RI
  - Reference Implementation
  - 针对某种实现的代码参考，是一个“能跑”的正确的代码
- TCK
  - Technology Compatibility Kit
  - 功能实现工具，保证同一实现的接口和功能是相同的

## Java程序的运行

Java远吗本质上是一个文本文件，需要使用`javac`将代码文件编译为字节码，之后使用`Java`命令执行字节码文件。

可执行文件`javac`是编译器，可执行文件`java`是虚拟机。

## Java程序的基本结构

```java
/**
 * 可以用来自动创建文档的注释
 */
public class Hello {
    public static void main(String[] args) {
        // 向屏幕输出文本:
        System.out.println("Hello, world!");
        /* 多行注释开始
        注释内容
        注释结束 */
    }
} // class定义结束
```

### class 类

```java
public class Hello { // 类名是Hello
    // ...
} // class定义结束
```

在每个JavaScript程序中总有一个类似`public class Hello {...}`的定义，这个定义被称为class（类）。  
java是面向对象的语言，class是程序的基本单位。

`class`是关键字，以上代码定义的`class`名是`Hello`；  
`public`是访问修饰符，表示该class是公开的，不写`public`也能正确编译，但是这个类将无法从命令行执行；  
`Hello`是类的名字，照惯例首字母大写；  
`{...}`为类的定义

保存代码时，文件名必须与定义的类名完全一致。

**类的命名要求**：

必须以英文字母开头，后接字母、数字和下划线的组合；  
默认以大写字母开头；  
不要使用Java的关键字作为类名。

### method 方法

在class内部，可以定义若干方法（method）。  
Java规定，某个类定义的`public static void main(String[] args)`是Java程序的固定入口方法。  
因此Java程序总是从`main`方法开始执行。

```java
public static void main(String[] args) {
    System.out.println("Hello, world!");
}
```

方法定义了一组执行语句，方法内部的代码将会被依次顺序执行。

一个方法除了方法名，还需要有方法参数。

`(...)`中为方法的参数，其中的`String[]`为参数类型，`args`为参数名；  
`static`表示方法为静态的，Java入口程序规定的方法必须是静态方法；  
`void`是方法的返回类型，表示没有任何返回值；  
`{...}`中为方法的代码。

**方法的命名要求**：

必须以英文字母开头，后接字母、数字和下划线的组合；  
默认以小写字母开头。

### 语句

在方法内部，语句才是真正的执行代码，方法的代码每一行用`;`结束，这里只用一行代码：

```java
System.out.println("Hello, world!");
```

功能是打印一个字符串到输出屏幕。

### 注释

注释是一种给人阅读的文本，不是程序的一部分，编译器会自动忽略注释

```java
// 这是注释...

/*
这是注释
blablabla...
这也是注释
*/
```

有一种特殊的多行注释，以/**开头，以*/结束，每行通常以星号开头；  
这种特殊的多行注释需要写在类和方法的定义处，可以用于自动创建文档。

```java
/**
 * 可以用来自动创建文档的注释
 * 
 * @auther liaoxuefeng
 */
public class Hello {
public static void main(String[] args) {
System.out.println("Hello, world!");
}
}
```

## Java的变量

### 定义变量的方式

```java
public class Main {
    public static void main(String[] args) {
        int x = 100; // 定义int类型的变量x，将100赋值给x
        System.out.println(x); // 打印该变量的值
        x = 200;  // 重新赋值为200
        System.out.println(x); // 再次打印x的值
    }
}
```

变量的一个重要特点是可以重新赋值。  
第一次定义变量x的时候，需要指定变量类型int，因此使用语句`int x = 100;`；  
而第二次重新赋值的时候，变量x已经存在了，不能再重复定义，因此不能指定变量类型int，必须使用语句`x = 200;`。

#### var 关键字

有些类型的名字太长，写起来比较麻烦，如果想省略变量类型可以使用`var`关键字。

```java
public class UseOfVar {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();

        var sb = new StringBuilder();
    }
}
```

编译器会根据赋值语句自动推断出变量`sb`的类型是`StringBuilder`。

#### 变量间的赋值

```java
public class Main {
    public static void main(String[] args) {
        int x = 100;
        System.out.println("x=" + x);
        x = 200;  // 重新赋值为200
        System.out.println("x=" + x);

        int n = x;  // 将x的值赋给n
        System.out.println("n=" + n);

        n = n + 100;  // 改变x的值，将x+100赋值给x
        System.out.println("n=" + n);
        System.out.println("x=" + x);
    }
}
```

执行`int x = 100;`时，JVM在内存中为变量`x`分配存储单元，并填入值`100`；  
执行`x = 200;`时，JVM将`200`写入`x`的存储单元，`x`变为`200`；  
执行`int n = x;`时，定义了一个新的变量`n`，同时对`n`赋值，因此，JVM需要新分配一个存储单元给变量`n`，并写入和变量`x`一样的值，结果是变量`n`的值也变为`200`。  
执行`n = n + 100;`时，JVM首先计算等式右边的值`n + 100`，结果为`300`（因为此刻`n`的值为`200`），然后，将结果`300`写入`n`的存储单元，因此，变量`n`最终的值变为`300`，而变量`x`的值不变。

### 变量的作用范围

在Java中，多行语句用`{ ... }`括起来。很多控制语句，例如条件判断和循环，都以`{ ... }`作为它们自身的范围。

```java
if (...) { // if开始
    ...
    while (...) { // while 开始
        ...
        if (...) { // if开始
            ...
        } // if结束
        ...
    } // while结束
    ...
} // if结束
```

只要正确地嵌套这些`{ ... }`，编译器就能识别出语句块的开始和结束。  
而在语句块中定义的变量，它有一个作用域，就是从定义处开始，到语句块结束。超出了作用域引用这些变量，编译器会报错。

```java
{
    ...
    int i = 0; // 变量i从这里开始定义
    ...
    {
        ...
        int x = 1; // 变量x从这里开始定义
        ...
        {
            ...
            String s = "hello"; // 变量s从这里开始定义
            ...
        } // 变量s作用域到此结束
        ...
        // 注意，这是一个新的变量s，它和上面的变量同名，
        // 但是因为作用域不同，它们是两个不同的变量:
        String s = "hi";
        ...
    } // 变量x和s作用域到此结束
    ...
} // 变量i作用域到此结束
```

定义变量时，要遵循**作用域最小化原则**，尽量将变量定义在尽可能小的作用域，并且**不要重复使用变量名**。

### Java的常量

定义变量的时候，如果加上final修饰符，这个变量就变成了常量。

```java
public class Constant {
    public static void main(String[] args) {
        final double PI = 3.14;
        double r = 5.0;
        double area = PI * r * r;
        PI = 314;  // The final local variable PI cannot be assigned. It must be blank and not using a compound assignment

        System.out.println("area=" + area);
    }
}
```

常量在定义时进行初始化后就不可再次赋值，再次赋值会导致编译错误。

常量的作用是用有意义的变量名来避免魔术数字（Magic number），例如，不要在代码中到处写3.14，而是定义一个常量。  
如果将来需要提高计算精度，我们只需要在常量的定义处修改，例如，改成3.1416，而不必在所有地方替换3.14。

为了和变量区分开来，根据习惯，常量名通常全部大写。

## Java的数据类型

### 值类型

#### 整数型

Java只定义了带符号的整型，因此，最高位的bit表示符号位（0表示正数，1表示负数）。

`byte`：-128 ~ 127
`short`：-32768 ~ 32767
`int`：-2147483648 ~ 2147483647
`long`：-9223372036854775808 ~ 9223372036854775807

定义整型：

```java
public class Integer {
    public static void main(String[] args) {
        int i = 2147483647;
        int i2 = -2147483648;
        int i3 = 2_000_000_000;  // 使用下划线加强数字易读性
        int i4 = 0xff0000;  // 十六进制下的16711680，0x表示十六进制
        int i5 = 0b1000000000;  // 二进制下的512,0b表示二进制

        long l1 = 9000000000000000000L;  // long型的结尾需要加L
        long l2 = 900;  // 可以将int类型赋值给long
        int i6 = 900L;  // 错误：不能把long型赋值给int
    }
}
```

#### 浮点型

浮点类型的数就是小数，因为小数用科学计数法表示的时候，小数点是可以“浮动”的，如1234.5可以表示成12.345x102，也可以表示成1.2345x103，所以称为浮点数。

浮点数可表示的范围非常大，float类型可最大表示3.4x10^38，而double类型可最大表示1.79x10^308。

`float`
`double`

```java
public class Float {
    public static void main(String[] args) {
        float f1 = 3.14f;  // float型的结尾要加f
        float f2 = 3.14e38f;  // 使用科学计数法表示3.14x10^38
        float f3 = 1.0;  // Type mismatch: cannot convert from double to float

        double d = 1.79e308;
        double d2 = -1.79e308;
        double d3 = 4.9e-324;
    }
}
```

#### 布尔类型

布尔类型`boolean`只有`true`和`false`两个值，布尔类型总是关系运算的计算结果。

`boolean`

```java
public class Boolean {
    public static void main(String[] args) {
        boolean b1 = true;
        boolean b2 = false;
        boolean isGreater = 5 > 3;  // 计算结果为true
        int age = 12;
        boolean isAdult = age >= 18;  // 计算结果为false
    }
}
```

Java语言对布尔类型的存储并没有做规定，因为理论上存储布尔类型只需要1 bit，但是通常JVM内部会把`boolean`表示为4字节整数。

#### 字符型

字符类型`char`是基本数据类型，它是character的缩写。一个`char`保存一个Unicode字符。

`char`

因为Java在内存中总是使用Unicode表示字符，所以一个英文字符和一个中文字符都用一个`char`类型表示，它们都占用两个字节。要显示一个字符的Unicode编码，只需将`char`类型直接赋值给`int`类型即可。  
还可以直接用转义字符`\u`+Unicode编码来表示一个字符。

```java
public class Character {
    public static void main(String[] args) {
        char c1 = 'A';
        char c2 = '中';
        int n1 = 'A';
        int n2 = '中';
        char c3 = '\u0041';
        char c4 = '\u4e2d';
    }
}
```

char类型使用单引号'，且仅有一个字符，要和双引号"的字符串类型区分开。

### 引用类型

#### 引用类型的指向

引用类型的变量类似于C语言的指针，它内部存储一个“地址”，指向某个对象在内存的位置。
和Python一样，理解了“指向”的概念就能明白。

```java
public class Str {
    public static void main(String[] args) {
        String str = "Hello";
        System.out.println(str);  // Hello
        String nstr = str;
        str = "World";
        System.out.println(str);  // World
        System.out.println(nstr);  // Hello
    }
}
```

#### 字符串

在Java中，字符串和字符是两个不同的类型。  
和`char`类型不同，字符串类型`String`是引用类型，用双引号`"..."`表示字符串。一个字符串可以存储0个到任意个字符。  
因为字符串使用双引号`"..."`表示开始和结束，如果字符串本身恰好包含一个`"`字符时需要借助转义字符`\`。  
因为`\`是转义字符，所以，`\\`表示一个`\`字符。

```java
public class Str {
    public static void main(String[] args) {
        String s4 = "abc\"xyz";
        String s5 = "abc\\xyz";
        System.out.println(s4);
        System.out.println(s5);
    }
}
```

##### 字符串的连接

Java的编译器对字符串做了特殊处理，可以使用`+`连接任意字符串和其他数据类型，极大方便了字符串的处理。  
如果用`+`连接字符串和其他数据类型，会将其他数据类型先自动转型为字符串再连接。

```java
public class Str {
    public static void main(String[] args) {
        String s1 = "Hello";
        String s2 = "World";
        String s = s1 + " " + s2 + "!";
        System.out.println(s);  // Hello World!

        int age = 25;
        String s3 = "age is " + age;
        System.out.println(s3); // age is 25
    }
}
```

##### 字符串的换行

```java
public class Str {
    public static void main(String[] args) {
        String l1 = "First line\nSecond line\nEnd";
        String l2 = """
                SELECT *
                FROM users
                WHERE id > 100
                ORDER BY name;
                """;
        System.out.println(l1);
        System.out.println(l2);
    }
}
```

除了使用换行符`\n`进行换行以外，Java 13添加了使用`"""..."""`的换行方式。  
注意，在最后一个`name`之后还有一个隐藏的`\n`，如果不想在多行字符串后有空行，需要将最后的`"""`与最后一行字符串写在同一行。  
多行字符串总是以最短的行首空格为基准，前面的空格会被去掉。

#### 数组

```java
public class Array {
    public static void main(String[] args) {
        int[] score = new int[5];
        score[0] = 78;
        score[1] = 92;
        score[2] = 84;
        score[3] = 68;
        score[4] = 76;

        System.out.println(score.length);  // 5
    }
}
```

定义一个数组类型的变量，使用数组类型“类型[]”，例如，`int[]`。和单个基本类型变量不同，数组变量初始化必须使用`new int[5]`表示创建一个可容纳5个`int`元素的数组。  
也可以在定义数组时直接指定初始化的元素，这样就不必写出数组大小，而是由编译器自动推算数组大小。

- 数组所有元素初始化为默认值，整型都是0，浮点型是0.0，布尔型是false
- 数组一旦创建后，长度就不可改变
- 使用索引调用、修改数组中的元素
  - 当元素是引用类型时，使用索引修改元素会使该索引指向一个新的对象，而不是改变原本对象的内容
- 如果索引超出范围，运行时将报错
- 使用`变量名.length`的方式获取数组长度

```java
public class Array {
    public static void main(String[] args) {
        int[] ns = {78, 92, 84, 68, 76};
        System.out.println(ns);  // [I@6842775d
        ns = new int[] {1, 2, 3};
        System.out.println(ns);  // [I@574caa3f
    }
}
```

观察两次打印的`ns`变量的哈希码，向一个变量定义新的数组内容会导致变量指向新的数组，旧的数组无法通过该变量访问。

#### 空值null

引用类型的变量可以指向一个空值`null`，它表示不存在，即该变量不指向任何对象。

注意要区分空值`null`和空字符串`""`，空字符串是一个有效的字符串对象，它不等于`null`。

### 常见转义字符

| 转义字符 | 表示 |
| - | - |
| `\"` | `"` |
| `\'` | `'` |
| `\\` | `\` |
| `\n` | 换行符 |
| `\r` | 回车符 |
| `\t` | 水平制表符 |
| `\u####` | Unicode编码的字符 |
| `%%` | `%` |

## 运算

### 运算优先级

在Java的计算表达式中，运算优先级从高到低依次是：

- `()`
- `!` `~` `++` `--`
- `*` `/` `%`
- `+` `-`
- `<<` `>>` `>>>`
- `&`
- `|`
- `+=` `-=` `*=` `/=`

只需要加括号就可以保证运算的优先级正确。

### 整数的运算

Java的整数运算遵循四则运算规则，可以使用任意嵌套的小括号。四则运算规则和初等数学一致。

```java
public class CalcOfInt {
    public static void main(String[] args) {
        int i = (100 + 200) * (99 - 88);  // 3300
        int n = 7 * (5 + (i - 9));  // 23072
        System.out.println(i);
        System.out.println(n);

        int x = 12345 / 67;  // 184
        System.out.println(x);

        int y = 12345 % 67;  // 17
        System.out.println(y);

        i += 100;  // 3400 相当于 i = i + 100
        n -= 200;  // 22782 相当于 n = n - 200
        System.out.println(i);
        System.out.println(n);
    }
}
```

`+=` `-=` `*=` `/=`是运算的简写。

整数的数值表示不但是精确的，而且整数运算永远是精确的，即使是除法也是精确的，因为两个整数相除只能得到结果的整数部分。

**整数的除法对于除数为0时运行时将报错，但编译不会报错**。

#### 自增与自减

 `i++` ：先引用i，后+1

 `++i` ：先+1，后引用i

```java
public class CalcOfInt {
    public static void main(String[] args) {
        int i = 3300;
        i++; // 3301, 相当于 n = n + 1;
        System.out.println(i);
        i--; // 3300, 相当于 n = n - 1;
        System.out.println(i);
    }
}
```

不建议把++运算混入到常规运算中。

#### 整数的溢出

要特别注意，整数由于存在范围限制，如果计算结果超出了范围，就会产生溢出，而**溢出不会报错**，却会得到一个奇怪的结果。

```java
public class Overflow {
    public static void main(String[] args) {
        int x = 2147483640;
        int y = 15;
        int sum = x + y;
        System.out.println(sum);  // -2147483641
    }
}
```

||0111|1111|1111|1111|1111|1111|1111|1000|
| - | - | - | - | - | - | - | - | - |
| + |0000|0000|0000|0000|0000|0000|0000|1111|
||1000|0000|0000|0000|0000|0000|0000|0111|

由于最高位计算结果为`1`，因此，加法结果变成了一个负数。

要解决溢出问题，可以把`int`类型换成`long`类型。

```java
public class Overflow {
    public static void main(String[] args) {
        long m = 2147483640L;
        long n = 15L;
        long sum = m + n;
        System.out.println(l_sum);  // 2147483655
    }
}
```

#### 移位运算

在计算机中，整数总是以二进制的形式表示。例如，int类型的整数7使用4字节表示的二进制如下：  
00000000 0000000 0000000 00000111

可以对整数进行移位运算。对整数7左移1位将得到整数14，左移两位将得到整数28。  
左移29位时，由于最高位变成`1`，因此结果变成了负数。  
如果对一个负数进行右移，最高位的`1`不动，`0`向右移位，结果仍然是一个负数。  
还有一种无符号的右移运算，使用`>>>`，它的特点是不管符号位，右移后高位总是补`0`，因此，对一个负数进行`>>>`右移，它会变成正数，原因是最高位的`1`变成了`0`

```java
public class Integer {
    public static void main(String[] args) {
        int n = 7;
        int a = n << 1;
        int b = n << 2;
        int c = n << 28;
        int d = n << 29;
        System.out.println(a);  // 00000000 00000000 00000000 00001110 = 14
        System.out.println(b);  // 00000000 00000000 00000000 00011100 = 28
        System.out.println(c);  // 01110000 00000000 00000000 00000000 = 1879048192
        System.out.println(d);  // 11100000 00000000 00000000 00000000 = -536870912
    }
}
```

对`byte`和`short`类型进行移位时，会首先转换为int再进行位移。

因为二进制存储数字的特性，左移实际上是十进制下乘2，右移是十进制下除以2。

#### 位运算

位运算是按位进行与、或、非和异或的运算。

- 与 `&`
  - 必须两个数同时为`1`，结果才为`1`
- 或 `|`
  - 只要任意一个为`1`，结果就为`1`
- 非 `~`
  - `0`和`1`互换
- 异或 `^`
  - 如果两个数不同，结果为`1`，否则为`0`

Java没有单个bit的数据类型。在Java中，对两个整数进行位运算，实际上就是按位对齐，然后依次对每一位进行运算。

### 浮点数的运算

浮点数0.1在计算机中就无法精确表示，因为十进制的0.1换算成二进制是一个无限循环小数，很显然，无论使用float还是double，都只能存储一个0.1的近似值。但是，0.5这个浮点数又可以精确地表示。

因为浮点数常常无法精确表示，因此，浮点数运算会产生误差。

```java
public class CalcOfFloat {
    public static void main(String[] args) {
        double x = 1.0 / 10;
        double y = 1 - 9.0 / 10;
        System.out.println(x);  // 0.1
        System.out.println(y);  // 0.09999999999999998

        double r = Math.abs(x - y);
        if (r < 0.00001) {
            // 可以认为相等
        } else {
            // 不相等
        }
    }
}
```

由于浮点数存在运算误差，所以比较两个浮点数是否相等常常会出现错误的结果。正确的比较方法是判断两个浮点数之差的绝对值是否小于一个很小的数。

#### 浮点数的溢出

整数运算在除数为0时会报错，而浮点数运算在除数为0时，不会报错，但会返回几个特殊值。

- `NaN` 表示Not a Number
- `Infinity` 表示无穷大
- `-Infinity` 表示负无穷大

```java
public class Overflow {
    public static void main(String[] args) {
        double d1 = 0.0 / 0;
        double d2 = 1.0 / 0;
        double d3 = -1.0 / 0;
        System.out.println(d1);  // NaN
        System.out.println(d2);  // Infinity
        System.out.println(d3);  // -Infinity
    }
}
```

### 类型提升

在运算过程中，如果参与运算的两个数整型类型不一致，那么计算结果为较大类型的整型。  
如果参与运算的两个数其中一个是整型一个是浮点型，那么整型可以自动提升到浮点型  
需要特别注意，在一个复杂的四则运算中，两个整数的运算不会出现自动提升的情况。

```java
public class Promotion {
    public static void main(String[] args) {
        int i =5;
        double m = 1.2 + 24 / i;
        double n = 1.2 + 24.0 / i;
        System.out.println(m);  // 5.2
        System.out.println(n);  // 6.0
    }
}
```

### 强制转型

可以将结果强制转型，即将大范围的整数转型为小范围的整数。  
要注意，超出范围的强制转型会得到错误的结果，原因是转型时，int的两个高位字节直接被扔掉，仅保留了低位的两个字节。因此，强制转型的结果很可能是错的。

也可以将浮点数强制转型为整数。在转型时，浮点数的小数部分会被丢掉。如果转型后超过了整型能表示的最大范围，将返回整型的最大值。  
如果要进行四舍五入，可以对浮点数加上0.5再强制转型。

```java
public class TypeConversion {
    public static void main(String[] args) {
        int i1 = 1234567;
        short s1 = (short) i1; // -10617
        System.out.println(s1);
        int i2 = 12345678;
        short s2 = (short) i2; // 24910
        System.out.println(s2);
        
        int n1 = (int) 12.3;
        int n2 = (int) 12.7;
        int n3 = (int) -12.7;
        int n4 = (int) (12.7 + 0.5);
        int n5 = (int) 1.2e20;
        System.out.println(n1);  // 12
        System.out.println(n2);  // 12
        System.out.println(n3);  // -12
        System.out.println(n4);  // 13
        System.out.println(n5);  // 2147483647
    }
}
```

### 布尔运算

布尔运算是一种关系运算，包括以下几类：

- 比较运算符：`>`，`>=`，`<`，`<=`，`==`，`!=`
- 与运算 `&&`
- 或运算 `||`
- 非运算 `!`

关系运算符的优先级从高到低依次是：

- `!`
- `>`，`>=`，`<`，`<=`
- `==`，`!=`
- `&&`
- `||`

#### 短路运算

布尔运算的一个重要特点是短路运算。如果一个布尔运算的表达式能提前确定结果，则后续的计算不再执行，直接返回结果。

因为`false && x`的结果总是`false`，无论`x`是`true`还是`false`，因此，与运算在确定第一个值为`false`后，不再继续计算，而是直接返回`false`。

```java
public class ShortcircuitEvaluation {
    public static void main(String[] args) {
        boolean b = 5 < 3;
        boolean result = b && (5 / 0 > 0);
        System.out.println(result);  // false
    }
}
```

以上代码如果没有短路运算，`&&`后面的表达式会由于除数为`0`而报错，但实际上该语句并未报错，原因在于与运算是短路运算符，提前计算出了结果`false`。

如果变量`b`的值为`true`，则表达式变为`true && (5 / 0 > 0)`。因为无法进行短路运算，该表达式必定会由于除数为`0`而报错。

类似的，对于`||`运算，只要能确定第一个值为`true`，后续计算也不再进行，而是直接返回`true`。

#### 三元运算符

Java还提供一个三元运算符b ? x : y，它根据第一个布尔表达式的结果，分别返回后续两个表达式之一的计算结果。

```java
public class Ternary {
    public static void main(String[] args) {
        int n = -100;
        int x = n >= 0 ? n : -n;
        System.out.println(x);  // 100
    }
}
```

上述语句的意思是：判断`n >= 0`是否成立，如果为`true`，则返回`n`，否则返回`-n`。

注意到三元运算`b ? x : y`会首先计算`b`，如果`b`为`true`，则只计算`x`，否则，只计算`y`。此外，`x`和`y`的类型必须相同，因为返回值不是`boolean`，而是`x`和`y`之一。

## 输入与输出

### 输出

在前面的代码中，我们总是使用System.out.println()来向屏幕输出一些内容。

`println`是print line的缩写，表示输出并换行。因此，如果输出后不想换行，可以用`print()`

#### 格式化输出

Java提供了格式化输出的功能。为什么要格式化输出？因为计算机表示的数据不一定适合人来阅读。

```java
public class FormatOutput {
    public static void main(String[] args) {
        double d = 129000000;
        System.out.println(d);  // 1.29E8
    }
}
```

如果要把数据显示成我们期望的格式，就需要使用格式化输出的功能。格式化输出使用`System.out.printf()`，通过使用占位符`%?`，`printf()`可以把后面的参数格式化成指定格式。  

Java的格式化功能提供了多种占位符，可以把各种数据类型“格式化”成指定的字符串：

| 占位符 | 说明 |
| - | - |
| `%d` | 格式化输出整数 |
| `%x` | 格式化输出十六进制整数 |
| `%f` | 格式化输出浮点数 |
| `%e` | 格式化输出科学计数法表示的浮点数 |
| `%s` | 格式化字符串 |

由于%表示占位符，因此，连续两个%%表示一个%字符本身

### 输入

```java
import java.util.Scanner;

public class Input {
    public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Input your name: ");
            String name = scanner.nextLine();
            System.out.print("Input your age: ");
            int age = scanner.nextInt();
            System.out.printf("Hi, %s, you are %d\n", name, age);
        }
    }
}
```

- `import java.util.Scanner;`
  - 通过`import`语句导入`java.util.Scanner`
  - `import`是导入某个类的语句，必须放到Java源代码的开头
- `Scanner scanner = new Scanner(System.in)`
  - 创建`Scanner`对象并传入`System.in`
  - `System.out`代表标准输出流，而`System.in`代表标准输入流
  - 直接使用`System.in`读取用户输入虽然是可以的，但需要更复杂的代码，而通过`Scanner`就可以简化后续的代码
- 有了`Scanner`对象后，使用`scanner.nextLine()`读取用户输入的字符串，使用`scanner.nextInt()`读取用户输入的整数
  - `Scanner`会自动转换数据类型，因此不必手动转换

## 流程控制

### `if`

`if`语句的基本语法：

```java
if (条件) {
    // 条件满足时执行
}
```

根据`if`的计算结果（`true`还是`false`），JVM决定是否执行`if`语句块（即花括号{}包含的所有语句）。  
当条件`n >= 60`计算结果为`true`时，`if`语句块被执行，将打印"及格了"，否则，`if`语句块将被跳过。  
注意到`if`语句包含的块可以包含多条语句，当`if`语句块只有一行语句时，可以省略花括号{}，但是，**省略花括号并不总是一个好主意**。

```java
public class IfStatement {
    public static void main(String[] args) {
        int n = 70;
        if (n >= 60) {
            System.out.println("及格了");
            System.out.println("吃火锅");
        }
        System.out.println("END");
    }
}
```

使用`if`语句时要注意边界条件。  
前面讲过浮点数在计算机中常常无法精确表示，并且计算可能出现误差，因此，判断浮点数相等用`==`判断不靠谱，正确的方法是利用差值小于某个临界值来判断。

#### `if...else`

`if`语句还可以编写一个`else { ... }`，当条件判断为`false`时，将执行`else`的语句块。

```java
public class IfStatement {
    public static void main(String[] args) {
        int n = 70;
        if (n >= 60) {
            System.out.println("及格了");
            System.out.println("吃火锅");
        } else {
            System.out.println("挂科了");
            System.out.println("补考吧");
        }
        System.out.println("END");
    } 
}
```

还可以用多个`if ... else if ...`串联。

```java
public class IfStatement {
    public static void main(String[] args) {
        int n = 70;
        if (n >= 90) {
            System.out.println("优秀");
        } else if (n >= 60) {
            System.out.println("及格了");
            System.out.println("吃火锅");
        } else {
            System.out.println("挂科了");
            System.out.println("补考吧");
        }
        System.out.println("END");
    } 
}
```

在串联使用多个if时，要特别注意判断顺序。  
`if`语句从上到下执行，靠前的判断语句判定为`true`时，后续`else`不再执行。

#### 判断引用类型
