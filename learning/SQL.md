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
