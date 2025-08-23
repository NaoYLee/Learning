# Java

Java介于编译型语言和解释型语言之间，通过将代码编译成一种“字节码”，针对不同平台编写虚拟机，不同平台的虚拟机负责加载字节码并执行

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

Java远吗本质上是一个文本文件，需要使用`javac`将代码文件编译为字节码，之后使用`Java`命令执行字节码文件  
可执行文件`javac`是编译器，可执行文件`java`是虚拟机

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

在每个JavaScript程序中总有一个类似`public class Hello {...}`的定义，这个定义被称为class（类）  
java是面向对象的语言，class是程序的基本单位

`class`是关键字，以上代码定义的`class`名是`Hello`  
`public`是访问修饰符，表示该class是公开的，不写`public`也能正确编译，但是这个类将无法从命令行执行  
`Hello`是类的名字，照惯例首字母大写  
`{...}`为类的定义

保存代码时，文件名必须与定义的类名完全一致

**类的命名要求**：

必须以英文字母开头，后接字母、数字和下划线的组合  
默认以大写字母开头  
不要使用Java的关键字作为类名

### method 方法

在class内部，可以定义若干方法（method）  
Java规定，某个类定义的`public static void main(String[] args)`是Java程序的固定入口方法  
因此Java程序总是从`main`方法开始执行

```java
public static void main(String[] args) {
    System.out.println("Hello, world!");
}
```

方法定义了一组执行语句，方法内部的代码将会被依次顺序执行

一个方法除了方法名，还需要有方法参数

`(...)`中为方法的参数，其中的`String[]`为参数类型，`args`为参数名  
`static`表示方法为静态的，Java入口程序规定的方法必须是静态方法  
`void`是方法的返回类型，表示没有任何返回值  
`{...}`中为方法的代码

**方法的命名要求**：

必须以英文字母开头，后接字母、数字和下划线的组合  
默认以小写字母开头

### 语句

在方法内部，语句才是真正的执行代码，方法的代码每一行用`;`结束，这里只用一行代码：

```java
System.out.println("Hello, world!");
```

功能是打印一个字符串到输出屏幕

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

有一种特殊的多行注释，以/**开头，以*/结束，每行通常以星号开头  
这种特殊的多行注释需要写在类和方法的定义处，可以用于自动创建文档

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

变量的一个重要特点是可以重新赋值  
第一次定义变量x的时候，需要指定变量类型int，因此使用语句`int x = 100;`  
而第二次重新赋值的时候，变量x已经存在了，不能再重复定义，因此不能指定变量类型int，必须使用语句`x = 200;`

### 变量间的赋值

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

执行`int x = 100;`时，JVM在内存中为变量`x`分配存储单元，并填入值`100`  
执行`x = 200;`时，JVM将`200`写入`x`的存储单元，`x`变为`200`  
执行`int n = x;`时，定义了一个新的变量`n`，同时对`n`赋值，因此，JVM需要新分配一个存储单元给变量`n`，并写入和变量`x`一样的值，结果是变量`n`的值也变为`200`  
执行`n = n + 100;`时，JVM首先计算等式右边的值`n + 100`，结果为`300`（因为此刻`n`的值为`200`），然后，将结果`300`写入`n`的存储单元，因此，变量`n`最终的值变为`300`，而变量`x`的值不变

### 变量的作用范围

在Java中，多行语句用`{ ... }`括起来。很多控制语句，例如条件判断和循环，都以`{ ... }`作为它们自身的范围

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
而在语句块中定义的变量，它有一个作用域，就是从定义处开始，到语句块结束。超出了作用域引用这些变量，编译器会报错

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

定义变量时，要遵循**作用域最小化原则**，尽量将变量定义在尽可能小的作用域，并且**不要重复使用变量名**

## Java的数据类型

### 基本类型

**整数型**：

Java只定义了带符号的整型，因此，最高位的bit表示符号位（0表示正数，1表示负数）

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

**浮点型**：

浮点类型的数就是小数，因为小数用科学计数法表示的时候，小数点是可以“浮动”的，如1234.5可以表示成12.345x102，也可以表示成1.2345x103，所以称为浮点数

浮点数可表示的范围非常大，float类型可最大表示3.4x10^38，而double类型可最大表示1.79x10^308

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

**布尔类型**：

布尔类型boolean只有`true`和`false`两个值，布尔类型总是关系运算的计算结果

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

Java语言对布尔类型的存储并没有做规定，因为理论上存储布尔类型只需要1 bit，但是通常JVM内部会把`boolean`表示为4字节整数

**字符型**：

字符类型`char`表示一个字符。Java的`char`类型除了可表示标准的ASCII外，还可以表示一个Unicode字符

`char`

```java
public class Character {
    public static void main(String[] args) {
        char a = 'A';
        char zh = '中';

        System.out.println(a);
        System.out.println(zh);
    }
}
```

char类型使用单引号'，且仅有一个字符，要和双引号"的字符串类型区分开

### 引用类型

引用类型的变量类似于C语言的指针，它内部存储一个“地址”，指向某个对象在内存的位置

**字符串**：

```java
public class Str {
    public static void main(String[] args) {
        String s = "hello";
        System.out.println(s);
    }
}
```

## Java的常量

定义变量的时候，如果加上final修饰符，这个变量就变成了常量

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

常量在定义时进行初始化后就不可再次赋值，再次赋值会导致编译错误

常量的作用是用有意义的变量名来避免魔术数字（Magic number），例如，不要在代码中到处写3.14，而是定义一个常量。  
如果将来需要提高计算精度，我们只需要在常量的定义处修改，例如，改成3.1416，而不必在所有地方替换3.14。

为了和变量区分开来，根据习惯，常量名通常全部大写

## var 关键字

有些类型的名字太长，写起来比较麻烦，如果想省略变量类型可以使用`var`关键字

```java
public class UseOfVar {
    public static void main(String[] args) {
        StringBuilder sb = new StringBuilder();

        var sb = new StringBuilder();
    }
}
```

编译器会根据赋值语句自动推断出变量`sb`的类型是`StringBuilder`

## 运算

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

`+=` `-=` `*=` `/=`是运算的简写

整数的数值表示不但是精确的，而且整数运算永远是精确的，即使是除法也是精确的，因为两个整数相除只能得到结果的整数部分

**整数的除法对于除数为0时运行时将报错，但编译不会报错**  

#### 溢出

要特别注意，整数由于存在范围限制，如果计算结果超出了范围，就会产生溢出，而**溢出不会报错**，却会得到一个奇怪的结果

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

由于最高位计算结果为`1`，因此，加法结果变成了一个负数

要解决溢出问题，可以把`int`类型换成`long`类型

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
