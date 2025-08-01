# Shell

Linux 系统中的操作是通过 shell 指令调用内核进行的

## 解释器

解释器用于把 shell 指令翻译给系统内核

Linux 的 Shell 解释器种类众多，一个系统可以存在多个 shell，可以通过 `cat /etc/shells` 命令查看系统中安装的 shell

## 脚本

**Shell是大小写敏感的语言**  

编写第一个脚本

```shell
#!/bin/bash
echo "Hello,world!"
```

第一行的 `#!/bin/bash` 用于确定执行脚本的解释器

### 执行脚本

使用 `chmod` 给脚本增加执行权限

执行方式：

 `绝对路径/<脚本文件名>`

 `./<脚本文件名>`

## 变量

### 定义变量

使用 `<变量名>=<值>` 来定义变量

```shell
name='liyizhi'
age='28'
address="Xi'an"
```

定义变量时需遵循以下规则

- `=` 两边不能有空格
- 首个字符必须为字母
- 变量名不允许出现空格及标点符号，可以使用 `_`
- 不能使用bash中的关键词

#### 只读变量

```shell
readonly <变量名>=<值>
```

### 调用变量

**调用变量首先需要定义变量**  

调用定义过的变量需要在变量名前加 `$`

```shell
echo '我叫'$name'，今年'${age}'岁，住在'$address'。'
```

 `{}` 可选，便于识别变量边界

#### 删除变量

```shell
unset <变量名>
```

**只读变量不可删除**  

### 局部变量

局部变量在脚本或命令中定义，**仅在当前 shell 实例中有效**，其他 shell 启动的程序不能访 问局部变量。

### 全局变量

**所有的程序，包括shell启动的程序，都能访问环境变量**，有些程序需要环境变量来保证其正常运行。

可以用过 set 命令查看当前环境变量。

## 字符串

字符串是shell编程中最常用最有用的数据类型

### 单引号

 `''`

示例：

```shell
skill='linux'
str='I am goot at $skill'
echo "$str"
```

输出结果:

```shell
I am goot at $skill 
```

单引号字符串的限制：

- 单引号里的任何字符都会原样输出，单引号字符串中的变量是无效的。
- 单引号字串中不能出现单独一个的单引号（对单引号使用转义符后也不行），但可成对出现，作为字符串拼接使用。

### 双引号

 `""`

示例：

```shell
skill='linux'
str='I am goot at ${skill}'
echo "$str"
```

输出结果:

```shell
I am goot at linux
```

双引号的优点：

- 双引号里可以有变量。
- 双引号里可以出现转义字符。

### 获取字符长度

使用 `#`

```shell
skill='hadoop'

echo "${skill}" # 输出结果: hadoop

echo "${#skill}" # 输出结果: 6
```

### 提取子字符串

使用`substring`

```shell
substring(2) # 从2开始截取到最后
substring(2,3) # 从2开始截取3个
```

```shell
skill='hadoop'
str="I am goot at $skill"
echo ${str:2} # 输出结果为: am goot at hadoop
echo ${str:2:2} # 输出结果为: am
```

注意：当字符串中有空格时，空格也算一个字符存在（字符串是从0开始计算）

## 参数传递

shell脚本的外部输入输入方式

在执行Shell程序脚本时，是可以向shell程序传递参数。

```shell
sh shellscript.sh # 启动运行解释器， 并把"shellscript.sh"作为参数传递过去
```

### 参数传递方式

#### `$n`

```shell
./<脚本名> <参数1> <参数2> ...
```

shell程序脚本内获取参数的格式为：`$n`
 `n` 代表一个数字， `1` 为执行脚本的第一个参数， `2` 为执行脚本的第二个参数，以此类推……
 `$0` 表示当前脚本名称

|      |                                                           |
| :--: | :-------------------------------------------------------- |
|  $#  | 传递到脚本的参数个数                                      |
|  $*  | 以一个单字符串显示所有向脚本传递的参数                    |
|  $$  | 脚本运行的当前进程PID                                     |
|  $!  | 后台运行的最后一个进程的PID                               |
|  $@  | 与 `$*` 相同，但是使用时加引号，并在引号中返回参数        |
|  $?  | 显示最后命令的退出状态。0表示没有错误，其他值表示错误编号 |

```shell
#!/bin/bash
echo "第一个参数为： $1"
echo "参数个数为： $#"
echo "传递的参数作为一个字符串显示： $*"
```

输出结果为：

```plain
第一个参数为： 1
参数个数为： 3
传递的参数作为一个字符串显示： 1 2 3
```

##### $*和$@的区别

相同点： 都表示传递给脚本的所有参数。
不同点：

- 不被" "包含时：`$*` 和 `$@` 都以 `$1 $2… $n` 的形式组成参数列表
- 被" "包含时：
  - `"$*"` 会将所有的参数作为一个整体，以`$1 $2 … $n` 的形式组成一个整串
  - `"$@"` 会将各个参数分开，以 `$1` `$2` … `$n` 的形式组成一个参数列表

#### `read`

 使用 `read [参数] <变量名>` 由外部向<变量名>赋值

- `-p` 等待输入时显示 `"<提示信息>"`
- `-r` 用于防止输入文本中的 `\` 被视作转义符号
- `-t` 用于控制输入时间，以秒为单位
- `-s` 静默模式，输入内容不在终端上显示

## 参数列表 `{ }` 的用法

### 大括号扩展（Brace Expansion）

用于快速生成序列或组合字符串，**在命令执行前展开**：

```shell
# 生成数字序列
echo {1..5}      # 输出: 1 2 3 4 5
echo {5..1}      # 输出: 5 4 3 2 1（倒序）
echo {1..10..2}  # 输出: 1 3 5 7 9（步长为2）

# 生成字母序列
echo {a..d}      # 输出: a b c d
echo {Z..A}      # 输出: Z Y X ... A（倒序）

# 组合字符串
echo {A,B,C}-file  # 输出: A-file B-file C-file
echo pre-{1..3}-post  # 输出: pre-1-post pre-2-post pre-3-post

# 嵌套组合
echo {A,B{1,2}}   # 输出: A B1 B2
```

####

### 参数扩展（Parameter Expansion）

用于操作变量值，语法为 `${变量名}`：

```shell
name="Alice"
echo ${name}      # 输出: Alice（基本用法）

# 设置默认值
echo ${unset_var:-"默认值"}  # 若变量未定义，输出"默认值"

# 截取子字符串
str="HelloWorld"
echo ${str:0:5}   # 输出: Hello（从索引0开始截取5字符）

# 替换内容
file="file.txt.bak"
echo ${file%.bak}    # 输出: file.txt（删除后缀）
echo ${file%%.*}     # 输出: file（贪婪删除后缀）
echo ${file#file.}   # 输出: txt.bak（删除前缀）
```

## 运算符

Shell和其他编程语言一样，支持包括：算术、关系、逻辑、字符串等运算符。
原生 /bin/bash 不支持简单的数学运算，但是可以通过其他命令来实现，例如： `expr`
 `expr` 是一款表达式计算工具，使用它能完成表达式的求值操作。

### 算术运算符

 `expr <计算式>`

- 表达式需要用反括号 `` 包裹
- 运算符号两边需要加空格

```shell
val_1=`expr 2 + 3`
echo "$val_1"
```

 **`$((<计算式>))`** 主要使用

 `$[计算式]`

```shell
val_2=$((2*3))
echo "$val_2"
val_3=$[5/3]
echo "$val_3"
```

| 运算符号 | 功能 |
| :------: | :--: |
|    +     |  加  |
|    -     |  减  |
|    *     |  乘  |
|    /     | 取整 |
|    %     | 取余 |

#### `i++` 与 `++i`

 `i++` ：先赋值，后+1

 `++i` ：先+1，后赋值

```shell
m=1
n=10
result_1="$((m++))"
result_2="$m"
result_3="$((++n))"
echo "$result_1"
echo "$result_2"
echo "$result_3"
```

结果如下

```plain
1
2
11
```

 `--` 计算逻辑相同

### 关系运算符

关系运算符只能比较数字，或以字符串表示的数字

```shell
 >  >=  <  <=  !=  ==
```

| 运算符 |   含义   |
| :----: | :------: |
|  -eq   |   等于   |
|  -ne   |  不等于  |
|  -lt   |   小于   |
|  -gt   |   大于   |
|  -le   | 小于等于 |
|  -ge   | 大于等于 |

### 逻辑运算符

| 运算符 | 含义 |
| :----: | :--: |
|   -a   |  和  |
|   -o   |  或  |

| 运算符 | 含义 |
| :----: | :--: |
|   &&   |  和  |
|  \|\|  |  或  |

区使用时需注意：

```shell
[ <判断语句1> ] && [ <判断语句2> ]
[ <判断语句1> -a <判断语句2> ]
```

### 字符串运算符

| 运算符号  | 含义                     |
| :-------: | :----------------------- |
| -n STRING | 字符串长度不为零         |
| -z STRING | 字符串长度为零           |
|     =     | 判断两个字符串是否一样   |
|    !=     | 判断两个字符串是否不一样 |

### 文件测试运算符

 `[运算符 <目标路径>]`

| 运算符号 | 含义                 |
| :------: | -------------------- |
|    -f    | 目标存在且是普通文件 |
|    -d    | 目标存在且是目录     |
|    -s    | 文件不为空           |
|    -e    | 文件存在             |
|    -r    | 文件存在并可读       |
|    -w    | 文件存在并可写       |
|    -x    | 文件存在并可执行     |

## 括号的用法区别

### `( )`（圆括号）

**主要用途：**

- **子 Shell 执行**
    在子 Shell 中执行命令，**不影响父 Shell 环境**（如变量、目录）。

    ```shell
    (cd /tmp; ls)  # 在子 Shell 切换目录，父 Shell 目录不变
    ```

- **命令替换**
    使用 `$( )` 捕获命令输出（推荐替代反引号 `` ``）。

    ```shell
    files=$(ls)  # 将 ls 结果存入变量
    ```

- **定义数组**
    初始化数组元素。

    ```shell
    arr=("apple" "banana" "cherry")
    ```

### `[ ]`（方括号）

**主要用途：**

- **条件测试**
    等同于 `test` 命令，用于文件/字符串/数值比较（**注意空格**）。

    ```shell
    if [ -f "file.txt" ]; then   # 检查文件是否存在
      echo "Found"
    fi
    
    if [ "$a" -eq 10 ]; then     # 数值比较
      echo "Equal"
    fi
    ```

- **通配符匹配**
    在文件名扩展中匹配单个字符（非正则表达式）。

    ```shell
    ls [abc]*  # 列出以 a/b/c 开头的文件
    ```

- **数组索引**
    访问数组元素。

    ```shell
    echo ${arr[1]}  # 输出 banana（索引从 0 开始）
    ```

### `(( ))`（双圆括号）

**主要用途：**

- **整数算术运算**
    执行数学计算（无需 `$` 前缀变量）。

    ```shell
    ((result = 5 + 3 * 2))  # 计算 5+3*2
    echo $?                 # 输出上一条命令的退出状态（0表示成功）
    ```

- **逻辑/比较运算**
    支持 `>`, `==`, `&&`, `||` 等。

    ```shell
    if (( count > 10 && flag == 1 )); then
      echo "Valid"
    fi
    ```

- **自增/自减**
    简化变量操作。

    ```shell
    ((i++))  # i 自增 1
    ```

- **C 风格循环**
    用于 `for`/`while` 循环。

    ```shell
    for ((i=0; i<5; i++)); do
      echo $i
    done
    ```

### `{ }`（花括号）

**主要用途：**

- **代码块分组**
    在当前 Shell 执行命令（**影响当前环境**）。

    ```shell
    { 
      cd ~/projects; 
      make 
    }  # 目录切换会影响当前 Shell
    ```

- **序列扩展**
    生成数字或字符序列。

    ```shell
    echo {1..5}     # 输出 1 2 3 4 5
    echo {a..c}.txt # 输出 a.txt b.txt c.txt
    ```

- **变量扩展**
    避免歧义或进行高级操作：

    ```shell
    echo ${var}_suffix  # 明确变量边界
    echo ${var:-default} # 若 var 未定义，使用 default
    echo ${var%.txt}    # 删除 .txt 后缀
    ```

- **组合命令**
    重定向整个代码块的输出。

    ```shell
    { date; ls; } > log.txt  # 将两条命令输出写入文件
    ```

- **创建匿名函数**
    结合 `()` 定义一次性函数。

    ```shell
    { func() { echo "Hello"; }; func; }  # 定义并调用
    ```

### 核心区别总结

|  符号   |   作用域   |          典型用途          |    空格要求    |
| :-----: | :--------: | :------------------------: | :------------: |
|  `( )`  |  子 Shell  |  命令分组、数组、命令替换  | 内部命令需分隔 |
|  `[ ]`  | 测试表达式 |     条件判断、文件检查     | 括号内必须空格 |
| `(( ))` |  算术运算  |    数学计算、C 风格循环    |  内部无需 `$`  |
|  `{ }`  | 当前 Shell | 代码块、序列扩展、变量操作 | 首尾命令需分号 |

## 流程控制

默认执行流程：自上而下依次执行

```shell
#!/bin/bash # 第1行
num=100 # 第2行
((100++)) # 第3行
echo "$num" # 第4行
......
```

当希望改变程序的执行流程需要进行流程控制

- 条件语句：有选择性的执行某行或某段程序
  - `if...else`
  - `case`
- 循环语句：一直重复性的执行某行或某段程序，至到执行结束(条件控制循环执行的次数)
  - `for`
  - `while`

### `if...else...`

#### 单支

```shell
if [ pattern ]
then
<program>
fi
```

根据 `[ pattern ]` 进行判断

- 返回结果为TRUE时执行 `<program>`

- 返回结果为FALSE时不进行后续操作

#### 双支

```shell
if [ pattern ]
then
<program_1>
else
<program_2>
fi
```

根据 `[ pattern ]` 进行判断

- 返回结果为TRUE时执行 `<program_1>`

- 返回结果为FALSE时执行 `<program_2>`

#### 多支

```shell
if [ pattern1 ]
then
<program_1>
elif [ pattern2 ]
then
<program_2>
......
else
<program_n>
fi
```

自上而下根据 `[ pattern ]` 进行判断，当返回结果为TRUE时执行对应的命令，忽略后续指令。

- 返回结果为FALSE时执行下一个 `elif` 语句
- 所有 `[ pattern ]` 均返回FALSE时执行 `<program_n>`

#### 使用 `&&` `||` 用于逻辑运算

 `&&` 两个pattern都返回true才执行 `<program>`

```shell
if [ pattern1 ] && [ pattern2 ]
then
<program>
fi
```

 `||` 两个pattern任一返回true就执行` <program> `

```shell
if [ pattern1 ] || [ pattern2 ]
then
<program>
fi
```

```shell
if [ true ] && [ false ]
then
echo "1"
fi
# 无结果输出
if [ true ] || [ false ]
then
echo "1"
fi
# 输出结果 1
```

### `case`

使用 `case` 将变量进行匹配，执行满足条件的指令

```shell
case $<变量名> in
<pattern_1>)
<program_1>;;
<pattern_2>)
<program_2>;;
...
*) # 所有其他情况
<program_n>;;
esac
```

### `for`

循环流程控制：程序在执行时重复性的执行某行或某段代码，不能出现死循环现象（在循环中添加条件用于在某个时刻结束循环）。

```shell
for((<初始值>;<循环条件>;<步长>))
do
<program>
done
```

```shell
for <变量名> in <指定参数列表>
do
<program>
done
```

### `while`

```shell
while [expression]
do
<program>
done
```

 `<program>` 中必须有能够使 `[expression]` 不被满足的命令，避免死循环。

### `until`

```shell
until [expression]
do
<program>
done
```

 `<program>` 中必须有能够使 `[expression]` 被满足的命令，避免死循环。

## 函数

### 定义函数

 `function <函数名()>{ <program> }`

定义函数要在代码最顶端

### 调用函数

当函数中使用了 `$n` 的方式从外部获取参数时，在调用函数时也要输入参数

先调用函数，再将参数传递到函数定义中，最终输出结果

### `return`

```shell
#!/bin/bash
# 定义函数
function compare() {
    if [ "$1" -lt "$2" ]
    then
     # 使用return返回数据
     return "$2"
    else 
     return "$1"
    fi
}

# 调用函数
compare "$1" "$2"

# 使用$?获得return的返回值
echo "$?大"
```

使用 `return` 时需要利用 `$?` 获取函数的返回值

在 Shell 脚本中，`return` 命令用于函数退出时返回一个**整数值**，该值必须严格限制在 `0` 到 `255` 的范围内（8 位无符号整数）。这是由 Shell 的退出状态码规范决定的。

## 数组

数组可以理解为是一个用来存放多个值的容器。

数组中存储的数据，通常可以称为：元素。

当数组中存储了多个元素后，就会给每一个元素添加一个编号(索引)，从0开始。

### 定义数组

Bash Shell 只支持一维数组（不支持多维数组），初始化时不需要定义数组大小。

Shell 数组用括号来表示，元素用"空格"符号分割开，语法格式如下：

```shell
<array_name>=(<value1> <value2> <value3> ... <valueN>)
```

也可以使用索引来定义数组：

```shell
# <array_name>[index]=<value>
my_array[0]=A
my_array[1]=B
```

### 读取数组

读取数组中元素的一般格式是： `${<array_name>[index]}`

使用 `*` 或 `@` 可以获得数组中所有元素

```shell
#!/bin/bash
my_array=(A B)
echo "${my_array[1]}"
echo "${my_array[*]}"
echo "${my_array[@]}"
```

输出结果为

```shell
B
A B
A B
```

### 获取数组长度

获取数组长度的方法与获取字符串长度的方法相同，使用 `#`

```shell
#!/bin/bash
my_array[0]=A
my_array[1]=B
echo "${#my_array[*]}"
echo "${#my_array[@]}"
```

输出结果为

```shell
2
2
```

## 加载其他文件变量及数组

在一个Shell程序中可以指定包含外部的其他Shell脚本程序。

这样可以很方便的封装一些公用的代码作为一个独立的文件。

Shell 文件包含的语法格式如下：

```shell
. <filename>
source <filename>
```

定义两个shell文件分别为： test1.sh、test2.sh

1. 在test1中定义一个变量 `arr=(linux hadoop shell)`
2. 在test2中对 `arr` 进行循环打印输出

第一步: vim test1.sh

```shell
#!/bin/bash
arr=(linux hadoop shell)
```

第二步: vim test2.sh

```shell
#!/bin/bash
source /class_0618/LYZ/test1.sh # 加载test1.sh 的文件内容
for var in "${my_arr[@]}"
do
echo $var
done
```

优点 :

- 数据源和业务处理分离
- 复用代码扩展性更强

缺点：

- 文件间具有依赖性，文件丢失会导致其他文件报错
