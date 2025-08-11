# SQL structured query language

## DDL data definition language

**用于对库的框架进行操作，不涉及具体数据**  

### 查看数据库版本

```sql
SELECT version();
```

### 查看数据库

```sql
SHOW DATABASES;
```

### 查看当前数据库

```sql
SELECT DATABASE;
```

### 创建数据库

```sql
CREATE DATABASE [IF NOT EXISTS] <库名> [CHARACTER SET utf8mb4 COLLATE tf8mb4_unicode_ci]；
```

### 切换数据库

```sql
USE <库名>;
```

### 删除数据库

```sql
DROP DATABASE [IF EXISTS] <库名>;
```

### 创建表

```sql
CREATE TABLE [IF NOT EXISTS] [<库名>.]<表名> (
 <字段1>  字段类型 [约束] [comment '注释1']，
    <字段2>  字段类型 [约束] [comment '注释2']，
    ...
 <字段n>  字段类型 [约束] [comment '注释n']
 );
```

#### 数据类型

`数值`

|     关键词     |      数值类型       |         描述          |
| :------------: | :-----------------: | :-------------------: |
|     `INT`      |        整型         | 无符号时加 `UNSINGED` |
|   `TINYINT`    |       小整型        | 无符号时加 `UNSINGED` |
|    `BIGINT`    |       大整型        | 无符号时加 `UNSINGED` |
|    `DOUBLE`    |     双精度浮点      |                       |
| `DECIMAL(M,D)` | 小数精度(精度,标度) |                       |

`字符串`

输入数据时使用单引号 `' '`

|  关键词   |       字符串类型       | 描述 |
| :-------: | :--------------------: | :--: |
|  `CHAR`   | 定长字符串(需指定长度) |      |
| `VARCHAR` | 变长字符串(需指定长度) |      |

`日期时间`

输入数据时使用单引号 `' '`

|   关键词    |          时间日期类型           |
| :---------: | :-----------------------------: |
|   `DATE`    |        日期 (YYYY-MM-DD)        |
|   `TIME`    |         时间 (HH:MM:SS)         |
|   `YEAR`    |               年                |
| `DATETIME`  | 日期+时间 (YYYY-MM-DD HH:MM:SS) |
| `TIMESTAMP` |  时间戳 (YYYY-MM-DD HH:MM:SS)   |

示例：

```sql
CREATE TABLE emp_info (
 serial_num INT PRIMARY KEY NOT NULL comment '编号',
 emp_num VARCHAR(10) NOT NULL comment '员工工号',
 name VARCHA(10) NOT NULL comment '员工姓名',
 gender CHAR(1) DEFAULT '男' comment '性别',
 age TINYINT comment '年龄',
 id_num CHAR(18) NOT NULL unique comment '身份证号',
 hiredate DATE NOT NULL comment '入职时间'
);
```

### 查看建表语句

```sql
SHOW CREATE TABLE [<库名>.]<表名>;
```

### 查看表

```sql
SHOW TABLES;
```

查询指定数据库中的所有表名

```sql
-- 从'information_schema'数据库的'tables'表中查询指定数据库的表名
SELECT table_name  
FROM information_schema.tables 
WHERE table_schema = '<数据库名>'; -- 指定数据库
```

### 查看表结构

```sql
DESC [<库名>.]<表名>;
```

### 修改表结构

```sql
-- 添加字段
ALTER TABLE [<库名>.]<表名> ADD <字段名> 字段类型 [约束] [comment '注释'];
-- 修改字段类型
ALTER TABLE [<库名>.]<表名> MODIFY <字段名> 字段类型;
-- 修改字段
ALTER TABLE [<库名>.]<表名> CHANGE <字段名> <新字段名> 字段类型 [约束] [comment '注释'];
-- 删除字段
ALTER TABLE [<库名>.]<表名> DROP <字段名>；
```

`MODIFY` 只能修改字段类型，不能与已有数据冲突

`ADD` 添加默认约束 `DEFAULT` 可以向已有行的新字段的增加默认值

`CHANGE` 修改字段约束对已有数据无效，字段类型不能与已有数据冲突，新旧字段名可以相同

### 删除表

```sql
DROP TABLE [IF EXISTS] [<库名>.]<表名>;
```

## DML data manipulation language

**用于对表中的数据进行增删改**  

### 插入数据

```sql
INSERT INTO [<库名>.]<表名> (<字段1>，<字段2>,...,<字段n>)
VALUES
 (<值11>,<值12>,...,<值1n>),-- 使用','分割进行多行插入
 (<值21>,<值22>,...,<值2n>),
 ...
 (<值n1>,<值n2>,...,<值nn>)
;
```

​使用自动增长 `AUTO_INCREMENT` 、默认约束 `DEFAULT` 时可以省略对应字段  
​两种情况下 `(<字段1>，<字段2>,...,<字段n>)` 可以全部省略：

* 一次性给所有字段插入数据
* 不输入数据的字段使用 `NULL` 占位

### 更新数据

```sql
UPDATE [<库名>.]<表名>
-- 更新的数据内容
SET <字段1> = <新值1>[,
 <字段2> = <新值2>,
    ...
    <字段n> = <新值n>]
-- 指定要更新的行,不指定时对所有行的指定字段数据进行修改
WHERE <判断条件>;
```

### 删除数据

```sql
DELETE FROM [<库名>.]<表名>
[WHERE <判断条件>];-- 省略 WHERE <判断条件> 时删除<表名>的所有内容
```

## DQL data query language

**用于对表中的数据进行查询**  

### 简单查询

```sql
SELECT <字段1>,<字段2>,...,<字段n>
FROM [<库名>.]<表名>;
```

​ 可以使用 `*` 表示所有字段，数据量大时避免使用

​ 查询非当前库的表时 `<库名>.` 不可省略

#### 设置别名

`AS` 在同一条代码中便捷输入及显示库、表、字段

```sql
SELECT <字段1>[ AS <别名1>],<字段2>[ AS <别名2>]
FROM [<库名>.]<表名>;
```

​ 别名只在当前语句中生效

### 去重查询

`DISTINCT` 去除 `<字段名>` 中重复出现的值

```sql
SELECT DISTINCT <字段名>
FROM [<库名>.]<表名>;
```

### 条件查询

`WHERE <判断条件>`  根据 `<判断条件>` 选择进行运算的数据

```sql
SELECT <字段1>,<字段2>,...,<字段n>
FROM [<库名>.]<表名>
WHERE <判断条件>;
```

|  逻辑运算符  |     功能     |
| :----------: | :----------: |
| `AND` / `&&` | 与，同时成立 |
| `OR` / `\|\|`  | 或，任一成立 |
| `NOT` / `!`  |  非，不成立  |

|       比较运算符      |     功能      |
| :-------------------: | :-----------: |
|          `>`          |     大于      |
|         `>=`          |   大于等于    |
|          `<`          |     小于      |
|         `<=`          |   小于等于    |
|       `<>` / `!=`       |    不等于     |
| `<=>` | 严格比较，可以避免 `NULL` 的影响 |

|  关键词  |     功能     |
| :----------: | :----------: |
| `bewteen` ... `and` ... |    闭区间内    |
|    `IN()`    | `()` 内各项遍历运行 |
|       `IS NULL`       |     为空      |
|     `IS NOT NULL`     |    非空    |
|     `LIKE '_%'`       | 模糊匹配，`_` 匹配单个字符， `%` 匹配任意字符 |

### 分组查询

`GROUP BY <字段名>` 根据 `<字段名>` 数据内容进行分组，返回各组第一个数据所在行的数据

```sql
SELECT <字段1>,<字段2>,...,<字段n>
FROM [<库名>.]<表名>
GROUP BY <字段名>;
```

### 聚合函数

```sql
SELECT <aggregate function>(column), ... FROM <table>;
```

**常用聚合函数：**

| 函数 | 功能 |
| - | - |
| `COUNT` | 统计数量 |
| `MAX` | 最大值 |
| `MIN` | 最小值 |
| `AVG` | 平均值 |
| `SUM` | 求和 |

* 聚合函数会忽略空值 `NULL` ，可以使用 `COALESCE` 函数进行处理
* `AVG(<expression>)` 可以用于计算满足 `<expression>` 的行数占比

## PL/SQL

Pecedure Language

* 复用性强，一个存储过程多处调用
* 减少网络开销，逻辑在数据库内部执行，避免程序与数据库频繁交互
* 数据更安全，敏感操作封装在数据库内，避免暴露给外部

```sql
[DECLARE  -- 声明变量
    <var_1> <type_1>;  -- 只声明变量，未初始化默认为`NULL`
    <var_2> <type_2> := <value_1>;
    <var_3> CONSTANT <type_3> := <value_2>;  -- 声明常量,后续无法更改
]
BEGIN  -- plsql开始
    [exception  -- 捕获异常
      -- 处理异常
    ]
END;  -- plsql结束

DECLARE  -- 声明变量
    <var_1> <table_1>.<column> %type;  -- 声明变量类型为<table_1>.<column_1>的类型
    <var_2> <table_2> %rowtype;  -- 声明变量类型为<table_2>中字段的类型
BEGIN  -- plsql开始
    <program>
END;  -- plsql结束

DECLARE
    type <rec_var_type> is record(  -- 定义一个记录类型
        <var_1> <type_1>,
        <var_2> <type_2>,
        ...
    );
    <var_n> <rec_var_type>;  -- 声明一个记录类型的变量
BEGIN
    <program>
END;
```

* 变量名只能是字母、数字、下划线、`$`、`#`
* 变量名首字符必须是字母，约定以<v_>或<var_>开头
* 不允许使用关键字作为变量名
* `:=` 表示赋值，`=` 表示等值比较
* 变量数据类型可以使用 `<column> %type` 声明类型为指定字段数据类型
* 变量数据类型可以使用 `<table_2> %rowtype` 声明类型为指定表中字段类型

```sql
-- Oracle语法
BEGIN
    RAISE info 'hello world';
END;
```

```sql
-- Postgre语法
DO $$
BEGIN
    RAISE NOTICE 'hello world';
END $$;
```

### SELECT INTO

```sql
DECLARE
    <var_1> <type_1>;
    <var_2> <type_2>;
BEGIN
    SELECT
        <column_1>,
        <column_2>
    INTO
        <var_1>,
        <var_2>
    FROM <table>
    WHERE <expression>;
END;
```

### 游标

游标本质上是内存中的一块区域，用来临时储存处SQL的结果集。  
游标提供了一个指针，通过 `FETCH` 语句移动来访问结果集中的每一行。

* 定位到结果集中的特定行
* 逐行遍历结果集
* 对每一行执行特定操作
* 修改或删除当前指向的行

GaussDB中游标分为 `隐式游标` 和 `显式游标` 两类

* 隐式游标  
  隐式游标由系统自动创建，当执行 `DML` 和 `DQL` 时系统会自动创建一个隐式游标来处理语句，代码执行完毕后游标自动关闭。
* 显式游标
  * 游标的声明打开和关闭需要手动控制
  * 当结果集为多行时需要显式游标保存结果集
  * 使用 `FETCH INTO` 逐行获取游标中的数据，每次获取一行

| 属性 | 返回值类型 | 说明 |
| - | - | - |
| `%ROWCOUNT` | 整型 | 获得游标中数据的行数 |
| `%FOUND` | Boolean | 最近的 `FETCH` 语句返回一行数据则为真，否则为假 |
| `%NOTFOUND` | Boolean | 与 `%FOUND` 返回值相反，代表游标结束 |
| `%ISOPEN` | Boolean | 游标打开时值为真，否则为假 |

访问游标属性时，需要使用游标名  
使用隐式游标时未指定游标名，默认使用 `SQL` 作为游标名  

```sql
DO $$
DECALER
    CURSOR <cur_cursor> IS <DQL>;
    <var> <table> %rowtype;
BEGIN
    OPEN <cur_cursor>;
    LOOP
        FETCH <cursor> INTO <var>;
        EXIT WHEN <expression>;
        <program_code>;
    END LOOP;
    CLOSE <cur_cursor>;
END $$;

DO $$
DECALER
    TYPE <ref_cursor_type> IS REF CURSOR;
    <cur_cursor> <ref_cursor_type>;
    <var> <table> %rowtype;
BEGIN
    OPEN <cur_cursor> FOR <DQL>;
    LOOP
        FETCH <cursor> INTO <var>;
        EXIT WHEN <expression>;
        <program_code>;
    END LOOP;
    CLOSE <cur_cursor>;
END $$;
```

### 分区

| 分区类型 | 描述 | 使用场景 |
| - | - | - |
| 范围分区 | 按分区键值的范围划分（如日期、数值） | 数据内容连续 |
| 列表分区 | 按分区键的离散值划分 | 数据有明显分类|
| 哈希分区 | 通过哈希函数均匀分布数据 | 数据分布均匀，避免热点 |
| 复合分区 | 结合两种分区 | 多层次管理 |

范围分区语法

```sql
CREATE TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) PARTITION BY RANNGE (<column>) (
    PARTITION <area_1> VALUES LESS THAN (<expression_1>),
    PARTITION <area_2> VALUES LESS THAN (<expression_2>),
    ...
    PARTITION <area_M> VALUES LESS THAN (MAXVALUE)
);
```

* `PARTITION BY RANNGE (<column>)`  
  按`<column>`字段范围分区
* `PARTITION <area>`  
  分区名称
* `VALUES LESS THAN (<expression>)`  
  数据内容小于`<expression>`
* `PARTITION <area_M> VALUES LESS THAN (MAXVALUE)`  
  超过定义范围的数据落入`<area_M>`分区

范围分区示例

```sql
CREATE TABLE employee (
    empno bigint PRIMARY KEY,
    ename varchar2(20),
    job varchar2(20),
    hiredate date,
    sal number(11,2),
    comm number(11,2),
    deptno int
) PARTITION BY RANGE (hiredate) (
    partition p2023 values less than ('2024-01-01'),
    partition p2024 values less than ('2025-01-01'),
    partition pmax values less than (maxvalue)
);
```

列表分区语法

```sql
CREATE TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) PARTITION BY LIST (<column>) (
    PARTITION <area_1> VALUES (<'value_11', 'value_12', ...>),
    PARTITION <area_2> VALUES (<'value_21', 'value_22', ...>),
    ...
    PARTITION <area_other> VALUES (DEFAULT)
);
```

```sql
CREATE TABLE employee(
    empno bigint PRIMARY KEY,
    ename varchar2(20),
    job varchar2(20),
    hiredate date,
    sal number(11,2),
    comm number(11,2),
    deptno int
) PARTITION BY LIST (job)(
    partition p_1 values ('CLERK','ANALYST'),
    partition p_2 values ('SALESMAN'),
    partition p_other values (DEFAULT)
);
```

哈希分区语法

```sql
CREATE TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) PARTITION BY HASH (<column>) (
    PARTITION <area_1> [TABLESPACE <tablespace_1>],
    PARTITION <area_2> [TABLESPACE <tablespace_2>],
    ...
);
```

* 选取分区键时尽量选取唯一列（Unique）或列中有大量唯一值（Almost_Unique）的列。
* 创建哈希分区时，分区的数量尽量是2的倍数。

哈希分区示例

```sql
CREATE TABLE employee(
    empno bigint PRIMARY KEY,
    ename varchar2(20),
    job varchar2(20),
    hiredate date,
    sal number(11,2),
    comm number(11,2),
    deptno int
) PARTITION BY HASH (empno)(
    PARTITION p1,
    PARTITION p2,
    PARTITION p3,
    PARTITION p4
);
```

复合分区示例

```sql
CREATE TABLE employee (
    empno bigint PRIMARY KEY,
    ename varchar2(20),
    job varchar2(20),
    hiredate date,
    sal number(11,2),
    comm number(11,2),
    deptno int
)
PARTITION BY RANGE (hiredate)  -- 先按照日期进行范围分区 
SUBPARTITION BY LIST (job) (   -- 再按照职位进行列表分区
    PARTITION p_2023 VALUES LESS THAN ('2024-01-01') (
        SUBPARTITION p_1 values ('CLERK','ANALYST'),
        SUBPARTITION p_2 values ('SALESMAN'),
        SUBPARTITION p_other values (DEFAULT)
    ),
    PARTITION p_max VALUES LESS THAN (MAXVALUE)
);
```

尽量手动指定查询分区，提高查询效率

### 自定义函数

![Static Badge](https://img.shields.io/badge/TO_BE-COUTINUE-yellow)
