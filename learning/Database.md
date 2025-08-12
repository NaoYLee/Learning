# Oracle Database

## 数据库管理系统

简称：数据库  
本质：可以部署在个人电脑或服务器的软件  
功能：存储和管理企业日常运营的业务数据  

## 关系型数据库

**RDBMS**  

表中的数据由字段和行组成,表与表之间、表与字段之间、字段和行之间都由关系模型连接

Oracle Database  
高斯 Gauss  
MySQL  
DB2

- 关系型数据库
  - 高度结构化
  - 侧重稳定性
  - 有限支持分布式

## SQL Structured Query Language

- DDL：数据定义语言
  - **用于对数据库的框架进行操作,不涉及具体数据**
- DML：数据操作语言
  - **用于对表中的数据进行增删改**
- DQL：数据查询语言
  - **用于对表中的数据进行查询**
- DCL：数据控制语言
  - **用于管理数据库权限**
- DTL：数据事务语言
  - **用于操作事务**

基本语法

```sql
SELECT * FROM <table>;  -- 关键字大写

SELECT *
FROM <table>;  -- 以分号结尾

-- 这是单行注释

/* 
 这是
 多行
 注释
 */
```

### 数据类型

不同的数据库软件使用的数据类型不同,**需要检查兼容性**

#### 数值

| 关键词 | 数值类型 | 描述 |
| - | - | - |
| `INT` |  整型 | 无符号时加 `UNSINGED` |
| `TINYINT` | 小整型 | 无符号时加 `UNSINGED` |
| `BIGINT` | 大整型 | 无符号时加 `UNSINGED` |
| `DOUBLE` | 双精度浮点 |  |
| `DECIMAL(P,S)` | 小数精度(精度,标度) | P：总位数,S：小数位数 |
| `NUMBER(P,S)` | 小数精度(精度,标度) | P：总位数,S：小数位数 |

#### 字符串

| 关键词 | 字符串类型 | 描述 |
| - | - | - |
| `CHAR` | 定长字符串(需指定长度) | 按设置字符长度存储 |
| `VARCHAR` | 变长字符串(需指定长度) |  |
| `VARCHAR2` | 变长字符串(需指定长度) | 按实际字符长度存储 |
| `LONG` | 大文本类型 | 最大2GB |
| `STRING` | 字符串 |  |

#### 日期时间

| 关键词  | 时间日期类型  | 描述 |
| - | - | - |
| `DATE` | 日期 | 不同数据库格式不同 |
| `TIME` | 时间 | HH:MM:SS |
| `DATETIME` | 日期+时间 | YYYY-MM-DD HH:MM:SS |
| `TIMESTAMP` | 时间戳 | 精确到秒小数点后9位 |

| 元素 | 说明 | 示例 |
| - | - | - |
| `YYYY` | 4位年份 | 2023 |
| `YY` | 2位年份 | 23 |
| `YEAR` | 年份的英文拼写 | TWENTY TWENTY-THREE |
| `MM` | 月份(01-12) | 07 |
| `MON` | 月份的缩写(与NLS设置相关) | JUL |
| `MONTH` | 月份的全名(与NLS设置相关) | JULY |
| `DD` | 日期(01-31) | 09 |
| `D` | 一周中的第几天(1-7) | 1(代表星期日,取决于NLS设置) |
| `DY` | 星期的缩写(与NLS设置相关) | SUN  |
| `DAY` | 星期的全名(与NLS设置相关) | SUNDAY |
| `DDD` | 一年中的第几天(1-366) | 190 |
| `HH` | 小时(01-12) | 08 |
| `HH12` | 同HH | 08 |
| `HH24` | 小时(00-23) | 20 |
| `MI` | 分钟(00-59) | 30 |
| `SS` | 秒(00-59) | 45 |
| `FF` | 小数秒(精度可指定) | 123456 |
| `AM` 或 `PM` | 上下午指示 | AM |

#### 二进制型

| 关键词 | 类型 | 描述 |
| - | - | - |
| `CLOB` | 存储字符 | 最大可以存4个G |
| `BLOB` | 存储图像、声音、视频等二进制数据 | 最多可以存4个G |

### 函数

#### 字符函数

| 函数 | 说明 |
| - | - |
| `ASCII` | 返回对应字符的 `ASCII` 值 |
| `CHR` | 给出十进制返回字符 |
| `CONCAT` | 拼接**两个**字符串 |
| `\|\|` | 拼接字符串 |
| `INITCAP` | 将字符串的第一个字母变为大写 |
| `INSTR` | 找出某个字符串的位置 |
| `INSTRB` | 找出某个字符串的位置和字节数 |
| `LENGTH` | 以字符给出字符串的长度 |
| `LENGTHB` | 以字节给出字符串的长度 |
| `LOWER` | 将字符串转换成小写 |
| `UPPER` | 将字符串转换成大写 |
| `LPAD` | 使用指定的字符在字符的左边填充 |
| `LTRIM` | 在左边裁剪掉指定的字符 |
| `RPAD` | 使用指定的字符在字符的右边填充 |
| `RTRIM` | 在右边裁剪掉指定的字符 |
| `REPLACE` | 执行字符串搜索和替换 |
| `SUBSTR` | 取字符串的子串 |
| `SUBSTRB` | 以字节取字符串的子串 |
| `SOUNDEX` | 返回一个同音字符串 |
| `TRANSLATE` | 执行字符串搜索和替换 |
| `TRIM` | 裁剪掉前面或后面的字符串 |

#### 数值函数

| 函数 | 说明 |
| - | - |
| `ABS(value)` | `value` 的绝对值 |
| `CEIL(value)` | 大于或等于 `value` 的最小整数 |
| `FLOOR(value)` | 小于或等于 `value` 的最大整数 |
| `COS(value)` | 余弦 |
| `COSH(value)` | 反余弦 |
| `SIN(value)` | 正弦 |
| `SINH(value)` | 反正弦 |
| `TAN(value)` | 正切 |
| `TANH(value)` | 反正切 |
| `EXP(value)` | e的 `value` 次幂 |
| `LN(value)` | `value` 的自然对数 |
| `LOG(value)` | `value` 的以10为底的对数 |
| `MOD(value,divisor)` | 求模 |
| `POWER(value,exponent)` | `value` 的 `exponent` 次幂 |
| `ROUND(value,precision)` | 按 `precision` 精度4舍5入 |
| `SIGN(value)` | `value` 为正返回1;为负返回-1;为0返回0 |
| `SQRT(value)` | `value` 的平方根 |
| `TRUNC(value,precision)` | 按照 `precision` 截取 `value` |
| `VSIZE(value)` | 返回 `value` 在ORACLE的存储空间大小 |

### DDL data definition language

**用于对数据库的框架进行操作,不涉及具体数据**  

#### 创建表空间

```sql
CREATE TABLESPACE <tablespace>  -- 表空间名
DATAFILE '../../<tablespace>.dbf'  -- 表空间物理文件存储路径(物理文件最好与表空间同名)
SIZE 10m  -- 表空间物理存储初始大小
AUTOEXTEND ON  -- 物理存储空间不足时自动扩充开启(省略时默认OFF:关闭)
NEXT 10m;  -- 自动扩充每次扩充大小(自动扩充OFF时省略)
```

#### 删除表空间

```sql
DROP TABLESPACE <tablespace> ;  -- 只删除表空间目录,保留物理文件
DROP TABLESPACE <tablespace> INCLUDING CONTENTS AND DATAFILES;  -- 删除表空间及其下物理文件
```

#### 修改表空间

```sql
-- 修改整体设定
ALTER DATABASE
DATAFILE '../../<tablespace>.dbf'  -- 选择要修改的表空间的物理存储路径
AUTOEXTEND ON  -- 自动扩充开启
NEXT 20M  -- 自动扩充每次扩充大小
MAXSIZE 2G;  -- 最大表空间的物理存储大小

-- 修改原有的数据文件大小
ALTER DATABASE DATAFILE '../../<tablespace>.dbf' RESIZE 20M;

-- 为表空间增加新的数据文件
ALTER TABLESPACE <tablespace> ADD DATAFILE '../../<tablespace>.dbf' SIZE 10M;
```

##### 查看表空间

```sql
SELECT * FROM DBA_TABLESPACES;

- 查询结果：`SYSTEM`、`SYSAUX`、`TEMP`、`UNDOTBS1`、`USERS`
- SYSTEM是系统表空间,存放系统的最基本的信息,如果SYSTEM表空间坏掉,Oracle将无法启动
- SYSAUX从10g中引入,作为SYSTEM的辅助表空间,用以减少SYSTEM表空间的负荷 。以前其他表空间中的一些组件,现在放到SYSAUX表空间中了
- TEMP是临时表空间,当排序不能在分配的空间中完成时,就会使用磁盘排序的方式,即在Oracle实例中的临时表空间中进行
- UNDOTBS1是撤销表空间(回滚),是UNDO类型的表空间,保存用户进行DML操作中,修改前的数据
- USERS是数据库默认的永久表空间
```

#### 查看数据库版本

```sql
SELECT version();
```

#### 查看数据库

```sql
SHOW DATABASES;
```

#### 查看当前数据库

```sql
SELECT DATABASE;
```

#### 创建数据库

```sql
CREATE DATABASE [IF NOT EXISTS] <库名> [CHARACTER SET utf8mb4 COLLATE tf8mb4_unicode_ci];
```

#### 切换数据库

```sql
USE <库名>;
```

#### 删除数据库

```sql
DROP DATABASE [IF EXISTS] <database>;
```

#### 查看建表语句

```sql
SHOW CREATE TABLE [<database>.]<table>;
```

#### 查看表

```sql
SHOW TABLES;
```

#### 创建表

```sql
CREATE TABLE [IF NOT EXISTS] <table> (
  <column_1> <type_1(length)> [DEFAULT <expression_1>] [<constraint_1>],
  <column_2> <type_2(length)> [DEFAULT <expression_2>] [<constraint_2>],
  ...,
  CONSTRAINT <constraint_name>
    <constraint> (column)
) TABLESPACE <tablespace>;
```

示例

```sql
CREATE TABLE employees (
  employee_id NUMBER(6) PRIMARY KEY,  -- 列级主键约束
  first_name VARCHAR2(50) NOT NULL,  -- 列级非空约束
  last_name VARCHAR2(50) NOT NULL,  -- 列级非空约束
  email VARCHAR2(100) UNIQUE,  -- 列级唯一约束
  hire_date DATE DEFAULT SYSDATE,  -- 默认值
  salary NUMBER(8,2) CHECK (salary > 0),  -- 列级检查约束
  department_id NUMBER(4),
  -- 表级外键约束 (更清晰的写法)
  CONSTRAINT fk_emp_dept
    FOREIGN KEY (department_id)
      REFERENCES departments(department_id)
)
TABLESPACE users_data
STORAGE (INITIAL 100K NEXT 50K)
LOGGING;
```

##### 约束类型

| 约束名称 | 关键词 | 描述 | 表级约束 | 列级约束 |
| - | - | - | - | - |
| 主键约束 | `PRIMARY KEY` | 字段内容唯一且不能为空 | 是 | 是 |
| 非空约束 | `NOT NULL` | 字段内容不能为空 | 否 | 是 |
| 唯一约束 | `UNIQUE` | 字段内容唯一 | 是 | 是 |
| 检查约束 | `CHECK` | 限制字段值的范围 | 是 | 是 |
| 外键约束 | `FOREIGN KEY` | 声明引用,与 `REFERENCES` 一起使用 | 是 | 否 |
| 外键约束 | `REFERENCES` | 引用另一表的主键/唯一键 | 否 | 是 |
| 默认约束 | `DEFAULT` | 未输入数值时使用默认值 | 否 | 是 |

##### 主键约束特性

- 一个表必须要有一个主键
- 一个表只能有一个主键
- 主键可以是单个字段或多个字段的组合

##### 空值特性

- NULL进行算数运算,结果都为空值
- NULL进行逻辑运算,结果都为false
- NULL不参与聚合运算
- 空字符串不是NULL
- 0不是NULL
- NULL与NULL不相同

##### 外键约束特性

**物理外键**  
物理外键指在表之间直接创建外键约束,可以确保数据引用的完整性,防止无效数据插入  
数据库会自动维护物理外键

**逻辑外键**  
逻辑外键是指不直接创建外键约束,而是通过业务规则或应用程序逻辑来维护数据间引用关系  
通过减少插入和查询时的外键检查提高性能,但如果维护逻辑不够严密可能导致数据不一致

|  | 数据完整性 | 数据一致性 | 性能影响 | 模型优化 |
| - | - | - | - | - |
| **物理外键** | 数据库确保数据完整 | 数据库自动维护一致性 |  |  |
| **逻辑外键** | 通过应用程序代码| 具有数据一致性风险 | 减少外键检查提高性能 | 简化模型 |

```sql
-- REFERENCES 单独使用
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT REFERENCES customers(customer_id) -- 声明引用表(引用字段)
);

-- FOREIGN KEY 与 REFERENCES 共同使用
CREATE TABLE orders (
  order_id INT PRIMARY KEY,
  customer_id INT,
  CONSTRAINT fk_orders_customers
    FOREIGN KEY (customer_id)    -- 声明外键列
      REFERENCES customers(customer_id) -- 声明引用表(引用字段)
);

-- 引用多列外键时必须组合使用
CREATE TABLE order_items (
  order_id INT,
  product_id INT,
  quantity INT,
  CONSTRAINT fk_items_orders 
    FOREIGN KEY (order_id)          -- 声明外键列
      REFERENCES orders(order_id),    -- 声明引用目标
  CONSTRAINT fk_items_products 
    FOREIGN KEY (product_id)        -- 另一组外键列
      REFERENCES products(product_id) -- 另一引用目标
);
```

### 查看表结构

```sql
DESC [<database>.]<table>;
```

#### 修改表结构

```sql
-- 增加字段
ALTER TABLE <table> ADD <column> <type>;

-- 删除字段
ALTER TABLE <table> DROP COLUMN <column>;

-- 修改字段名
ALTER TABLE <table> RENAME COLUMN <old_column> TO <new_column>;

-- 修改字段内容
ALTER TABLE <table> MODIFY <column> <new_type>;

-- 修改约束名
ALTER TABLE <table> RENAME CONSTRAINT <old_constraint> TO <new_constraint>;
```

`MODIFY` 只能修改字段类型,不能与已有数据冲突

`ADD` 添加默认约束 `DEFAULT` 可以向已有行的新字段的增加默认值

##### 注释

```sql
-- 添加表注释
COMMENT ON TABLE <table> IS '<comment>';

-- 添加字段注释
COMMENT ON COLUMN <table>.<column> IS '<comment>';
```

需要修改注释时直接使用新注释覆盖即可,使用空字符串覆盖原注释达到删除注释效果

#### 删除表

```sql
DROP TABLE [IF EXISTS] <table>;
```

### DML data manipulation language

**用于对表中的数据进行增删改**  

#### 插入数据

```sql
-- 隐式插入,必须输入全部字段数据
INSERT INTO <table> VALUES
  (<value_1>, <value_2>, ...);

-- 显式插入,可以自定义插入数据的字段,不能省略非空字段
INSERT INTO <table>
  (<column_1>, <column_2>, ...)
  VALUES
    (<value_11>, <value_12>, ...),
    (<value_21>, <value_22>, ...), 
    ...
;

-- 多表插入(待研究)
INSERT ALL
  INTO 表1 (列1, 列2) VALUES (值1, 值2)
  INTO 表2 (列A, 列B) VALUES (值A, 值B)
  ...
SELECT <column_1>, <column_2>, ... FROM <table>;  -- 从查询结果获取值
```

多表插入示例

```sql
INSERT ALL
  INTO EMPLOYEES (ID, NAME, SALARY) 
    VALUES (emp_id, emp_name, salary)
  INTO MANAGERS (ID, NAME, DEPARTMENT) 
    VALUES (mgr_id, mgr_name, dept)
SELECT 
  101 AS emp_id, 
  'Alice' AS emp_name, 
  20000 AS salary,
  201 AS mgr_id,
  'Alice' AS mgr_name,
  'IT' AS dept
FROM dual;
```

​两种情况下`(<value_1>, <value_2>, ...)`可以全部省略：

- 一次性给所有字段插入数据
- 不输入数据的字段使用`NULL`占位

#### 更新数据

```sql
UPDATE <table> SET
  <column_1>=<value_1>,
  <column_2>=<value_2>,
  ...
[WHERE <expression>];  -- 不附加判断条件时默认修改全表
```

#### 删除数据

```sql
DELETE FROM <table>
[WHERE <expression>];  -- 不附加判断条件时默认删除全表

TRUNCATE TABLE <table>;
```

| `DELETE` | `TRUNCATE` |
| - | - |
| 可以选择删除对象 | 删除整张表 |
| 按行删除数据,保留表结构 | 先摧毁表,再原样重构 |
| 可能产生碎片 | 不会产生碎片 |
| 不释放空间 | 立即释放空间 |
| 可以rollback | 无法恢复 |

### DQL data query language

**用于对表中的数据进行查询**  

#### 基本语法

```sql
SELECT [DISTINCT]
  <column_1>,
  <column_2>,
  ...  -- 查看全表时可使用`*`,尽量少用
FROM <table>  -- 进行查找的数据来源表
[WHERE <expression>]  -- 选择符合条件的数据进行显示
[GROUP BY <column>]  -- 以<column>进行分组
[HAVING <expression>]
[ORDER BY <column>];
```

​可以使用 `*` 表示所有字段,数据量大时避免使用  
​查询非当前库的表时 `<库名.>` 不可省略

#### 使用别名

`AS` 在同一条代码中便捷输入及显示库、表、字段  
别名只在当前语句中生效

```sql
SELECT
  <column_1> [AS ]<alias_1>,
  <column_2> [AS ]<alias_2>,
  ...
FROM <table> <alias>;
```

- 在显示查询结果时显示别名而不是原名
- 涉及多表查询时必须设置表别名
- 使用<表别名>.<字段别名>表示数据具体表及字段
- 别名可以是汉字,设置时使用双引号""

#### 去重查询

`DISTINCT`去除`<字段名>`中重复出现的值,可以对字段或字段组合去重

```sql
SELECT DISTINCT <column>
FROM <table>;
```

#### 条件查询

只选择满足 `<expression>` 的数据进行显示

```sql
SELECT *
FROM <table>
WHERE <expression>;
```

运算符号：

| 逻辑运算符 | 功能 |
| - | - |
| `AND` | 与,同时成立 |
| `OR` | 或,任一成立 |
| `NOT` | 非,不成立 |
| `EXISTS` | 子查询存在结果集 |
| `NOT EXISTS` | 子查询不存在结果集 |

| 比较运算符 | 功能 |
| - | - |
| `>` | 大于 |
| `>=` | 大于等于 |
| `<` | 小于 |
| `<=` | 小于等于 |
| `<>` / `!=` | 不等于 |
| `<=>` | 严格比较,可以避免`NULL`的影响 |
| `BETWEEN` ... `AND` ... | 闭区间内 |
| `IN()` | `()` 内各项遍历运行 |
| `IS NULL` | 为空 |
| `IS NOT NULL` | 非空 |
| `LIKE '_%'` | 模糊匹配,`_`匹配单个字符,`%`匹配任意字符 |

#### 分组查询

`GROUP BY`和聚合函数结合使用

基本语法

```sql
SELECT <aggregate_function>(<column>)
FROM <table>
GROUP BY <column>;
```

| `WHERE` | `HAVING` |
| - | - |
| 可以单独使用 | 必须配合 `GROUP BY` 使用 |
| 针对全局进行判断 | 对 `GROUP BY` 结果进行判断 |

##### 聚合函数

```sql
SELECT <aggregate function>(column)
FROM <table>;
```

**常用聚合函数：**

| 函数 | 功能 |
| - | - |
| `COUNT` | 统计数量 |
| `MAX` | 最大值 |
| `MIN` | 最小值 |
| `AVG` | 平均值 |
| `SUM` | 求和 |

**聚合函数会忽略空值`NULL`,可以使用`COALESCE`函数进行处理**

#### 排序查询

基本语法

```sql
SELECT *
FROM <table>
ORDER BY <column_1> [ASC|DESC];
```

| 关键字 | 功能 |
| - | - |
| `ASC` | 升序 |
| `DESC` |  降序 |

- 省略时默认按照升序
- 数据相同时按下一个指定的字段进行排序

#### 执行顺序

```sql
SELECT DISTINCT *
FROM <table>
WHERE <expression>
GROUP BY <column>
HAVING <expression>
ORDER BY <column>;
```

1. `FROM`  
  首先,根据 `FROM` 子句确定读取数据的表
2. `WHERE`  
  从 `FROM` 子句获取数据后,根据 `WHERE` 子句的条件来过滤这些数据,可以显著减少需要处理的数据量
3. `GROUP BY`  
  如果查询中包含 `GROUP BY` 子句,那么将根据指定的列对数据进行分组,如果同时包含 `WHERE` 子句,则在过滤后的数据上进行分组
4. `HAVING`  
  在数据被分组后, `HAVING` 子句会对分组后的结果进行过滤,类似于 `WHERE` 子句,但作用于 `GROUP BY` 的结果
5. `SELECT`  
  `SELECT` 阶段会选择出需要显示的列,聚合函数会在这一步被计算。
6. `DISTINCT`  
  `DISTINCT` 会在这一步对结果进行去重
7. `ORDER BY`  
  根据 `ORDER BY` 子句指定的列对结果进行排序,在最后进行,不会对性能产生太大影响

### DCL data control language

**用于管理数据库权限**  

#### 创建用户

```sql
CREAT USER <user>  -- 创建的用户名
    DEFAULT TABLESPACE <tablespace>  -- 为用户指定默认表空间
    IDENTIFIED BY <passwd>;  -- 为用户设置密码
```

##### 查看用户归属的表空间

```sql
SELECT username, default_tablespace FROM dba_users WHERE username = '<user>';  -- 显示dba_users表中username字段数据为<user>的username,default_tablespace
```

#### 删除用户

```sql
DROP USER <user> CASCADE;
```

#### 用户授权

```sql
GRANT dba TO <user>;  -- 把数据库中的DBA权限授予<user>

GRANT CREATE SESSION, CREATE TABLESPACE,CREATE TABLE TO <user>;
```

### PL/SQL

Pecedure Language

- 复用性强，一个存储过程多处调用
- 减少网络开销，逻辑在数据库内部执行，避免程序与数据库频繁交互
- 数据更安全，敏感操作封装在数据库内，避免暴露给外部

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

- 变量名只能是字母、数字、下划线、`$`、`#`
- 变量名首字符必须是字母，约定以<v_>或<var_>开头
- 不允许使用关键字作为变量名
- `:=` 表示赋值，`=` 表示等值比较
- 变量数据类型可以使用 `<column> %type` 声明类型为指定字段数据类型
- 变量数据类型可以使用 `<table_2> %rowtype` 声明类型为指定表中字段类型

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

- 定位到结果集中的特定行
- 逐行遍历结果集
- 对每一行执行特定操作
- 修改或删除当前指向的行

GaussDB中游标分为 `隐式游标` 和 `显式游标` 两类

- 隐式游标  
  隐式游标由系统自动创建，当执行 `DML` 和 `DQL` 时系统会自动创建一个隐式游标来处理语句，代码执行完毕后游标自动关闭。
- 显式游标
  - 游标的声明打开和关闭需要手动控制
  - 当结果集为多行时需要显式游标保存结果集
  - 使用 `FETCH INTO` 逐行获取游标中的数据，每次获取一行

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

- `PARTITION BY RANNGE (<column>)`  
  按`<column>`字段范围分区
- `PARTITION <area>`  
  分区名称
- `VALUES LESS THAN (<expression>)`  
  数据内容小于`<expression>`
- `PARTITION <area_M> VALUES LESS THAN (MAXVALUE)`  
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

- 选取分区键时尽量选取唯一列（Unique）或列中有大量唯一值（Almost_Unique）的列。
- 创建哈希分区时，分区的数量尽量是2的倍数。

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

## 数据库使用

### 三范式

三范式是数据库逻辑设计的关键方法,其目的是**对数据结构进行优化**,**降低数据冗余**,**增强数据一致性和完整性**。  
在逻辑设计阶段,按三范式的指导把概念模型转换为具体的数据库表结构。

**三范式的作用**  

1. 避免重复数据  
  避免同一信息在多表中重复存储
2. 减少错误操作  
  修改数据时只需要在一张表中修改
3. 提升查询效率  
  表结构清晰,提高可读性
4. 防止数据矛盾  
  避免数据更新不同步产生矛盾

#### 第一范式：原子性,不可拆分

- 每个字段的值必须是"最小单位",不能再拆分
- 错误示例：
  - 问题："地址"中包含省、市、区、街道等,混在一起,无法单独查询

| 学生 | 住址 |
| - | - |
| 张三 | 浙江省杭州市钱塘区11号大街469号1幢4楼 |

- 正确设计：

| 学生 | 住址 | 城市 | 区县 | 街道 | 详细地址 |
| - | - | - | - | - | - |
| 张三 | 浙江省 | 杭州市 | 钱塘区 | 11号大街 | 469号1幢4楼 |

#### 第二范式：消除部分依赖

- 表必须有唯一标识(主键),且其他字段必须完全依赖主键,不能只依赖主键的一部分
- 错误示例(学生成绩表)：
  - 问题：
    - "学生姓名"只依赖"学号",和"课程"无关
    - "课程老师"只依赖"课程",和"学号"无关

| 学号 | 课程 | 成绩 | 学生姓名 | 任课教师 |
| - | - | - | - | - |
| 001 | 数学 | 90 | 张三 | 王老师 |

- 正确设计：

学生表

| 学号 | 学生姓名 |
| - | - |
| 001 | 张三 |

课程表

| 课程 | 任课教师 |
| - | - |
| 数学 | 王老师 |

成绩表

| 学号 | 课程 | 成绩 |
| - | - | - |
| 001 | 数学 | 90 |

#### 第三范式：消除传递依赖

- 表中的字段不能依赖其他非主键字段,只能直接依赖主键
- 错误示例(订单表)：
  - 问题："用户名"和"用户等级"依赖"用户ID",而"用户ID"依赖主键"订单号"

| 订单号(主键) | 用户ID | 用户名 | 用户等级 | 订单金额 |
| - | - | - | - | - |
| 1001 | 001 | 张三 | VIP | 500 |

- 正确设计：

订单表

| 订单号 | 用户ID | 订单金额 |
| - | - | - |
| 1001 | 001 | 500 |

用户表

| 用户ID | 用户名 | 用户等级 |
| - | - | - |
| 001 | 张三 | VIP |

#### 反三范式

三范式可能导致：  
> 1.查询变慢,需要频繁联表查询  
> 2.开发复杂,要处理多表关联,容易出错  
> 3.性能瓶颈,高并发场景下,联表操作可能拖垮数据库

反三范式适合的场景:  
> 1.读多写少的系统  
> 2.对查询速度要求极高的场景。  
> 3.数据量极大,联表查询成本过高。

| 优点 | 缺点 |
| - | - |
| 查询速度大幅提升 | 数据冗余占用存储空间 |
| 简化SQL复杂度 | 数据更新成本高 |
| 减少联表操作压力 | 需要额外维护数据一致性 |

反三范式注意事项：  
> 1.明确场景,只有读频率远远大于写频率的场景才适合反三范式  
> 2.数据一致性,用触发器、事务或定时任务同步冗余数据,避免脏数据  
> 3.文档注释,在表结构设计中注明冗余字段的作用和同步机制  
> 4.如果存储空间紧张,或数据频繁修改,优先遵循三范式

### 视图

视图 `VIEW` 是封装SQL结果集的虚拟表。

视图的作用：

1. 简化复杂查询  
  可以将语句复杂的SQL封装为视图,之后只需要查视图而不必重复使用语句
2. 保护数据安全  
  可以通过视图隐藏基表中的敏感列或敏感行,用户只能访问视图无法访问基表
3. 复用常用查询  
  将常用查询封装为视图

基本语法

```sql
--创建视图
CREATE [OR REPALCE] [FORCE] VIEW <view>
AS <SQL>
[WHERE <expression> WITH CHECK OPTION]
[WITH READ ONLY]

-- 删除试图
DROP VIEW <view>;
```

`[OR REPALCE]` 若创建的视图已存在,自动重建该视图
`[FORCE]` 忽略基表是否存在,强制建立视图
`<SQL>` 一条完整的SQL语句
`[WITH CHECK OPTION]` 插入或新建数据必须满足约束要求
`[WITH READ ONLY]` 只读视图

### 多表关系

多表关系基本上可以分为三种：

1. 一对一
2. 一对多
3. 多对多

"一"、"多"指的都是字段中行数量

#### 一对一

一对一关系表在实际开发中通常是用来做单表的拆分,也就是将一张大表拆分成两张小表。将大表中的一些基础字段放在一张表当中,将其他的字段放在另外一张表当中,以此来提高数据的操作效率。  
一对一的实现：  

1. 在任意一方的表中新增一个字段(叫外键),关联另外一方的主键字段,并且给外键字段设置唯一约束(UNIQUE)。

#### 一对多

概念：一边是"1个",另一边是"多个"。比如：一个班级有多个学生。  
一对多的实现：

1. 在"多"的表里,增加一个外键字段,指向"一"的表的主键字段。

#### 多对多

多对多的实现：

1. 把复杂的多对多关系拆分为两个一对多关系
2. 建立第三张中间表,中间表至少包含两个外键,分别关联两方主键

### 多表查询

多表查询时表和字段都需要设置别名,使用 `<表别名>.<字段别名>` 表示数据具体表及字段

#### 笛卡尔积

**笛卡尔乘积**是指**两个集合的所有组合情况**  
多表查询会产生大量无效的笛卡尔积,需要使用 `ON` 或 `WHERE` 来消除无效笛卡尔积

#### 交叉连接

仅介绍定义,生产环境**避免使用**交叉连接

基本语法

```sql
SELECT * FROM <table_1> <alias_1>, <table_2> <alias_2>;
```

- 交叉连接不会消除笛卡尔积
- 不需要任何连接条件,显式条件会导致语法错误
- 包含所有行的组合,无论是否有实际关联
- 生成所有可能的组合(如测试数据、全量矩阵)

#### 内连接查询

基本语法

```sql
-- 隐式内连接,不推荐
SELECT * FROM <table_1> <alias_1>, <table_2> <alias_2> WHERE <expression>;

-- 显式内连接
SELECT * FROM <table_1> [INNER ]JOIN <table_2> ON <expression>;
```

内连接时正确使用 `ON` 关键词,结果集中不会产生新的 `NULL`

示例

```sql
-- 标准写法
SELECT
    ow.id,
    ow.name AS owner_name,
    ot.NAME AS type_name 
FROM owners ow
INNER JOIN ownertype ot ON ow.ownertypeid = ot.id;

-- 使用 WHERE 代替 ON,不推荐
SELECT
    ow.id,
    ow.name AS owner_name,
    ot.NAME AS type_name 
FROM
    owners ow,
    ownertype ot
WHERE ow.ownertypeid =ot.id;
```

##### 等值内连接

```sql
SELECT
    ow.id,
    ow.name AS owner_name,
    ot.NAME AS type_name 
FROM owners ow
INNER JOIN ownertype ot ON ow.ownertypeid = ot.id;
```

##### 不等值内连接

```sql
SELECT
    ow.id,
    ow.name AS owner_name,
    ot.NAME AS type_name 
FROM owners ow
INNER JOIN ownertype ot ON ow.id BETWEEN 10 AND 20;
```

#### 外连接查询

##### 左外连接

基本语法

```sql
SELECT
    <column_1>,
    <column_2>,
    ...,
    <column_n>
FROM <table_1>
LEFT [OUTER ]JOIN <table_2> ON <expression>;
```

- 使用 `LEFT JOIN` 左侧表中的每行数据,查找右侧表中满足 `<expression>` 的行
  - 如果满足则结合两表数据输出一行
  - 如果没有满足的行则右表对应字段产生 `NULL` 输出一行
- 生产环境尽量使用行数多的表作为左表

##### 右外连接

基本语法

```sql
SELECT
    <column_1>,
    <column_2>,
    ...,
    <column_n>
FROM <table_1>
RIGHT [OUTER ]JOIN <table_2> ON <expression>;
```

- 使用 `RIGHT JOIN` 右侧表中的每行数据,查找左侧表中满足 `<expression>` 的行
  - 如果满足则结合两表数据输出一行
  - 如果没有满足的行则左表对应字段产生 `NULL` 输出一行
- 生产环境尽量使用 `LEFT JOIN` 替换 `RIGHT JOIN`

##### 全外连接

基本语法

```sql
SELECT
    <column_1>,
    <column_2>,
    ...,
    <column_n>
FROM <table_1>
FULL [OUTER ]JOIN <table_2> ON <expression>;
```

- 使用 `FULL JOIN` 两侧表中的每行数据,查找对方表中满足 `<expression>` 的行
  - 如果满足则结合两表数据输出一行
  - 如果没有满足的行则对方表对应字段产生 `NULL` 输出一行
- `FULL JOIN` 为 `LEFT JOIN` 与 `RIGHT JOIN` 结果的并集

#### 自然连接

在两张表中寻找数据类型和列名都相同的字段,然后自动地将他们连接起来,并返回所有符合条件的结果。

基本语法

```sql
SELECT
    <column_1>,
    <column_2>,
    ...,
    <column_n>
FROM <table_1>
NATURAL JOIN <table_2>[ USING <column>];
```

### 子查询

子查询也称为嵌套查询,指在一个查询语句中嵌套另一个查询语句。  
子查询通常被括在圆括号内,它可以出现在 SELECT、 FROM、 WHERE、 HAVING 等子句中。  
子查询可以帮助用户更灵活地从数据库中获取所需的数据,实现一些复杂的查询逻辑。

根据查询结果分类

#### 标量子查询

- 子查询结果为单个值(一行一列)
- 多用于比较运算

```sql
SELECT <column_1>
FROM <table_1>
WHERE <expression_1> > (
    SELECT <column_2>
    FROM <table_2>
    WHERE <expression_2>
);
```

#### 列子查询

- 子查询结果为一列
- 多用于范围运算

```sql
SELECT <column_1>
FROM <table_1>
WHERE <expression_1> IN (
    SELECT <column_2>
    FROM <table_2>
);
```

#### 行子查询

- 子查询结果为一行
- 多用于比较运算

```sql
SELECT <column_1>
FROM <table_1>
WHERE <expression_1> = (
    SELECT <column_2>, <column_3>
    FROM <table_2>
    WHERE <expression_2>
);
```

#### 表子查询

- 子查询结果为多行多列
- 多用于构建临时表

```sql
SELECT <column_1>
FROM <table_1> <alias_1>
LEFT JOIN (
    SELECT <column_2>, <column_3>
    FROM <table_2>
    WHERE <expression_1>
) <alias_2>
WHERE <expression_2>;
```

| 比较运算符 | 功能 |
| - | - |
| `>` | 大于 |
| `>=` | 大于等于 |
| `<` | 小于 |
| `<=` | 小于等于 |
| `<>` / `!=` | 不等于 |
| `<=>` | 严格比较,可以避免 `NULL` 的影响 |

| 范围运算符 | 功能 |
| - | - |
| `IN` | 在子查询返回值内 |
| `NOT IN` | 不在子查询返回值内 |
| `ANY` | 与子查询返回值中任意一项比较 |
| `ALL` | 与子查询返回值中所有项比较 |

根据查询顺序分类

- 关联子查询
  - 子查询不能作为一段独立的代码单独运行,必须借助外部SELECT查询才能执行
  - 先执行外部查询再执行内部子查询
- 非关联子查询
  - 子查询能够作为一段独立的代码单独运行
  - 先执行子查询,然后根据子查询的结果执行外部查询

### 分页查询

#### 基于伪列的查询

`ROWID`

- 使用 `ROWID` 值可以标识表中唯一的一行;
- 表中的每一行在数据文件中都有一个物理地址,`ROWID` 返回的就是该行的物理地址,由于 `ROWID` 返回的是该行的物理地址,因此使用 `ROWID` 可以显示行是如何存储的;
- `ROWID` 的值是由大小写字母组成,表示该条数据位于硬盘中的存储地址,系统在查询表中数据时,就是依靠 `ROWID` 字段的地址进行查询;
- 每一条数据的 `ROWID` 都不为空;
- 每一条数据的 `ROWID` 都不相同,如果 `ROWID` 相同则证明是同一条数据;
- `ROWID` 一般用于删除重复数据。

```sql
DELETE FROM <table>
WHERE NOT ROWID IN (
  SELECT MIN(rowid)
  FROM <table>
  GROUP BY <column_1>, <column_2>
);
```

`ROWNUM`

- 在查询的结果集中,`ROWNUM` 为结果集中每行的标识行号,第一行返回1,第二行返回2,以此类推;
- 通过 `ROWNUM` 伪列可以限制查询结果集中返回的行数;
- `ROWNUM` 是逐行扫描表中每条记录时产生,每扫描到一行, `ROWNUM` 就赋予一个行号,所以不能使用 `>` 或 `>=` 符号,只能使用 `<` 或 `<=`。

```sql
SELECT
    ROWNUM,
    <alias>.*
FROM <table> <alias>
ORDER BY <column_1>, <column_2>
WHERE ROWNUM < <number>;

-- 查询 `ROWNUM` 大于指定值的方式
SELECT * 
FROM (
    SELECT
        ROWNUM AS rn,
        <column>
    FROM <table> <alias>
    WHERE ROWNUM <= <number_1>
) WHERE rn > <number_2>;  -- 在进行本步时已经查询出表<table>的 `ROWNUM`

-- Oracle分页查询代码
SELECT * 
FROM (
    SELECT
        ROWNUM AS rn,
        <alias>.* 
    FROM (
        SELECT * 
        FROM <table>
        ORDER BY <column_> desc
    ) <alias>
    WHERE ROWNUM <= <number_1> -- 选择本页要展示的最后一条
) WHERE rn > <number_2>;  -- 选择本页要展示的第一条
```

### 集合运算

- `UNION ALL` 并集
  - 返回来自任一查询所有行,包括重复行
- `UNION` 并集
  - 返回来自任一查询的所有唯一行
- `INTERSECT` 交集
  - 返回同时存在于两个查询中的所有唯一行
- `MINUS` 差集
  - 返回存在于第一个查询但不存在于第二个查询的所有唯一行

基本语法

```sql
SELECT *
FROM <table_1>
WHERE <expression_1>
<set_operation>
SELECT *
FROM <table_2>
WHERE <expression_2>
```

在 Oracle 数据库中**进行集合运算需要满足以下条件**

- 结果集的列数必须相同：
  - 第一个 `SELECT` 语句选择的列数必须与第二个 `SELECT` 语句选择的列数相同,如果有第三个、第四个 `SELECT` 语句的列数也必须相同
- 对应列的数据类型必须兼容：
  - 两个结果集中对应位置的列(即第一列对第一列,第二列对第二列,依此类推)的数据类型必须是 Oracle 可以隐式转换的,或者是相同的数据类型族
  - 常见的兼容情况
    - `NUMBER` 与 `NUMBER` (各种精度/标度)
    - `VARCHAR2` 与 `CHAR` (以及 `NVARCHAR2`, `NCHAR`)
    - `DATE` 与 `TIMESTAMP` (Oracle 通常会隐式转换 `DATE` 为 `TIMESTAMP`)
    - `CLOB` 与 `VARCHAR2` (在某些上下文中有隐式转换,但通常不建议直接集合运算,最好显式转换)
    - `BLOB` 与 `BLOB` (相同类型)
  - 不兼容的示例
    - `VARCHAR2` 与 `NUMBER` (除非字符串内容完全是数字且 Oracle 能隐式转换,但强烈不建议依赖隐式转换,应显式转换)
    - `DATE` 与 `VARCHAR2` (除非字符串是有效日期格式且能隐式转换,同样不建议)
- 列名和别名：
  - 结果集的列名不需要相同
  - 最终结果集的列名取自第一个 `SELECT` 语句中的列名或别名

- `ORDER BY` 子句的位置
  - `ORDER BY` 子句只能出现在整个集合运算语句的最后
  - 只能使用第一个 `SELECT` 语句中的列名、别名或位置编号
  - 它用于对整个集合运算后的最终结果集进行排序
  - 不能在单个 `SELECT` 语句后面放置 `ORDER BY` (除非该 `SELECT` 是子查询的一部分)。例如：

```sql
-- 错误
SELECT emp_id FROM emp UNION SELECT dept_id FROM dept ORDER BY dept_id; 
-- 如果 dept_id 不是第一个 SELECT 的列名/别名

-- 正确
SELECT emp_id AS id FROM emp UNION SELECT dept_id AS id FROM dept ORDER BY id;
-- 使用别名

-- 正确
SELECT emp_id FROM emp UNION SELECT dept_id FROM dept ORDER BY 1; 
-- 使用位置编号
```

- 数据类型转换(可选但推荐)：
  - 如果对应列的数据类型不完全相同但兼容,Oracle 会尝试隐式转换。
  - 为了避免潜在的隐式转换错误或性能问题,强烈建议在 SELECT 列表中使用 CAST 或 TO_CHAR, TO_NUMBER, TO_DATE 等函数进行显式转换,确保对应列具有完全相同或高度兼容的目标类型。例如：

```sql
SELECT TO_CHAR(employee_id) AS id, hire_date FROM employees
UNION
SELECT department_id, TO_DATE(NULL) FROM departments; -- 假设 departments 没有日期列,用 NULL 占位并转换为 DATE
```

### 行列转换

数据库的行列转换是一个抽象概念,指的是改变数据在结果集中呈现的方式,通常涉及将行中的数据值动态地变成新的列,或者将列中的数据值变成新的行,不等同于单纯的数学上的“**转置**”。

#### 行转列

使用 `CASE WHEN` 进行行转列

使用 `PIVOT` 进行行转列

#### 列转行

使用 `UNION ALL` 进行列转行

```sql
SELECT
    <column_1>,
    <column_2>,
    '<content_1>' <alias>
FROM <table>
UNION ALL
SELECT
    <column_3>,
    <column_4>,
    '<content_2>'
FROM <table>
```

使用 `UNPIVOT` 进行列转行

```sql
SELECT *   
FROM (
    SELECT
    <column_1>,
    <column_2>,
    ...,
    <column_n>
   FROM table
) UNPIVOT (
    <value_column>  -- 转换后行数据所在的列的名称
    FOR <pivot_column> IN (  -- 是转换后原列名所在的列的名称
       <column_1> <alias_1>, 
       <column_1> <alias_2>, 
       ...,
       <column_n> <alias_n>
    )
);
```

### 开窗函数

开窗函数是一种能在**不合并数据行**的情况下,对数据进行分组统计(如排名、求和、平均等)的工具。  
它会给每一行数据"额外计算"一个结果(比如排名、组内总和),但不会像 `GROUP BY` 把一组数据合并成一行。

基本语法

```sql
<function()> OVER ([PARTITION BY <column_1> ][ORDERO BY <filed_2> ][<window_frame_clause>])
```

- PARTITION BY <column_1>
以<column_1>中数据进行分组

- ORDERO BY <filed_2>
以<filed_2>中数据进行排序

- <window_frame_clause>
{ ROWS | RANGE | GROUPS } BETWEEN <frame_start> AND <frame_end>
ROWS BETWEEN 1 PRECEDING: AND 1 FOLLOWING,表示计算时包含当前行、前一行、后一行共3行的数据。  
如果不写,默认是"从组内第一行到当前行"。

#### 开窗排序函数

- `ROW_NUMBER()`
  - 无并列,1.2.3.4
- `RANK()`
  - 有并列,按总数排名,1.2.2.4
- `DENSE_RANK()`
  - 有并列,按顺序排名,1.2.2.3

```sql
<function> OVER (
    [PARTITION BY <column_1>]
    ORDER BY <filed_2> [ASC/DESC]
    [<window_frame_clause>]
)
```

#### 开窗聚合函数

- SUM
  - 按照[PARTITION BY <column_2>]分组结果按[ORDER BY <filed_3> [ASC | DESC]]顺序依次计算<column_1>中的和
- MAX
  - 按照[PARTITION BY <column_2>]分组结果取<column_1>中的最大值
- MIN
  - 按照[PARTITION BY <column_2>]分组结果取<column_1>中的最小值
- AVG
  - 按照[PARTITION BY <column_2>]分组结果求<column_1>中的平均值
- COUNT
  - 按照[PARTITION BY <column_2>]分组结果统计<column_1>中行的数量

在聚合开窗函数中使用 `[ORDER BY <filed_3> [ASC | DESC]]` 会导致**每行都进行一次运算**并输出。  
可以将 `ORDER BY` 放置在 `FROM` 后使用进行排序。

```sql
<function>(<column_1>) OVER (
    [PARTITION BY <filed_2>]
    [ORDER BY <filed_3> [ASC | DESC]]
    [<window_frame_clause>]
)
```

#### `LISTAGG()`

`LISTAGG()` 的**基本功能**是把**多行数据合并成一个字符串**

```sql
LISTAGG(<column_1>, <delimiter>) WITHIN GROUP (ORDER BY <column_2>)
```

- `<column_1>` 为要合并的列
- `<delimiter>` 为合并结果里用于分隔元素的分隔符,比如`,` `、``;` 等
- `<column_2>` 用于对要合并的数据进行排序的列

搭配 `OVER()` 使用

```sql
LISTAGG(<column_1>,<delimiter>) WITHIN GROUP (ORDER BY <column_2>) OVER (PARTITION BY <column_3>)
```

使用 `PARTITION BY` 对需要合并的数据按照指定列进行分组

#### 位置偏移函数

##### `LAG()`

- 用于从当前行向前获取指定列

```sql
LAG(<column_1>,<offset>,[<default_value>]) OVER (
  [PARTITION BY <column_2>]
  ORDER BY <column_3>
)
```

- `<column_1>` 为需要获取值的列
- `<offset>` 为偏移量,默认为1
- `[<default_value>]` 当偏移位置超出结果集范围时返回的值,未设置时默认返回 `NULL`
- `[PARTITION BY <column_2>]` 按照 `<column_2>` 中内容进行分组查询
- `ORDER BY <column_3>` 将结果集按照 `<column_3>` 中内容进行排序

##### `LEAD()`

- 用于从当前行向后获取指定列

```sql
LEAD(<column_1>,<offset>,[<default_value>]) OVER (
  [PARTITION BY <column_2>]
  ORDER BY <column_3>
)
```

- `<column_1>` 为需要获取值的列
- `<offset>` 为偏移量,默认为1
- `[<default_value>]` 当偏移位置超出结果集范围时返回的值,未设置时默认返回 `NULL`
- `[PARTITION BY <column_2>]` 按照 `<column_2>` 中内容进行分组查询
- `ORDER BY <column_3>` 将结果集按照 `<column_3>` 中内容进行排序

### 索引

索引是一个用于加速数据获取的数据对象,借用一种特有的数据结构来快速定位表中的数据行,从而提高数据访问性能,通过占用底层 `B-Tree` 存储空间提高高频查询字段的查询速度。

基本语法

```sql
-- 建立索引
CREAT INDEX <index> ON <table> (<column>);

-- 使用索引查询
SELECT *
FROM <table>
WHERE <index> = <value>;
```

- `<index>` 索引名称,要求在数据库中唯一
  - 约定命名格式：idx_\<column>
- `<table>` 指定建立索引的表
- `<column>` 指定建立索引的列,可以为单列也可以为多列

索引通常是在表中的数据量比较大,且字段经常被作为 `WHERE` 查询条件时才创建  
创建索引时,需要占用一定的空间  
在某列上创建了索引后,在该列进行插入、更新、删除数据时,会对已有的索引进行维护,此时会降低写的性能

**索引分类**  

- 普通索引
  - 只起到加速查询速度的作用
- 主键索引
  - 索引列唯一且非空,设置主键约束时默认设置
- 复合索引
  - 基于**两个及以上的列**建立**一个索引**
  - 通常选择作为查询条件最频繁的字段或过滤效率最好的列,作为复合索引的第1个列
  - 只有索引在查询条件最左侧才能命中索引(比如复合索引是A,B,C,查询条件包含A、A,B、A,B,C,如果查询条件只包含B或C,则无法命中索引)
- 唯一索引
  - 基于**唯一约束字段**建立建立索引
- 位图索引
  - 基于**低基数**的字段建立索引,不直接存储 `rowid` ,而是存储字节位到 `rowid` 的映射
- 函数索引
  - 索引列是经过函数运算后的结果
- 反向键索引
  - 将原数据字节倒序后索引,解决"最右插入热点"
  - 无法进行范围查询

基本语法

```sql
-- 复合索引
CREATE INDEX <index> ON <table>(<column_1>,<column_2>,...);

-- 唯一索引
CREATE UNIQUE INDEX <index> ON <table>(<column>);

-- 位图索引
CREATE BITMAP INDEX <index> ON <table>(<column>);

-- 函数索引
CREATE INDEX <index> ON <table>(<function(<column>)>);

-- 反向键索引
CREATE INDEX <index> ON <table>(<column>) REVERSE;
```

| 优点 | 缺点 |
| - | - |
| 加速查询,减少全表扫描 | 占用额外存储空间 |
| 提高排序、分组、连接效率 | 插入、更新、删除数据时,需要维护索引,降低写性能 |
| 支持唯一性约束 | 频繁修改数据可能导致索引碎片化,需定期重建 |

#### 索引失效

1. 对非函数索引列使用函数
2. 对索引列进行运算  
  破坏索引列原始结构
3. 使用前模糊匹配 '%n'
4. 隐式数据类型转换
5. 使用 `IS NULL` 或 `IS NOT NULL`  
  B-Tree结构不储存空值
6. 使用 `OR` 连接多个条件  
  优化器可能认为全表索引性能优于使用索引
7. 使用 `NOT` 或 `<>`
8. 统计信息过期或缺失
9. 索引列选择性过低
10. 使用 `HINT` 强制全表扫描

数据量增长影响索引效率的关键原因和需要考虑的方面：

1. **索引层级增加**  
  Oracle最常用的索引结构是B-Tree索引。随着数据行（叶子节点）的增加,为了维持树形结构的平衡,索引的层级（深度）会逐渐增加。  

    影响： 要定位到特定的索引键值（或起始点）,需要遍历更多的分支节点（Branch Block）。每多一层就意味着多一次（通常）物理I/O操作（如果块不在内存中）。虽然对于点查询（精确匹配）来说,增加的层级带来的额外开销相对较小（因为每次I/O读取一个块）,但确实增加了访问路径的长度。  

2. **索引范围扫描成本增加**  
  当执行范围查询（WHERE column BETWEEN val1 AND val2）或全索引扫描时,需要读取的索引叶子块数量会随着数据量的增加而显著增加。  

    影响： 扫描更多的块意味着更多的物理I/O（或逻辑I/O,如果块在Buffer Cache中）。即使索引本身结构高效,读取大量块的时间成本也会线性（或接近线性）增长。这是数据量增大后索引效率下降最明显的地方之一。  

3. **聚簇因子恶化**  
  聚簇因子表示表中行的物理存储顺序与索引键值顺序的匹配程度。低聚簇因子是好的（行物理上集中存储）,高聚簇因子是差的（行物理上分散存储）。  
  
    影响： 随着数据量的增加和频繁的DML（尤其是非顺序插入和删除）,数据在表段中的物理存储顺序往往会变得与索引顺序越来越不一致（聚簇因子变高）。当通过索引访问大量行时（索引范围扫描后需要回表）,数据库需要访问大量分散的数据块,导致物理I/O急剧增加。高聚簇因子是数据量大时索引查询变慢的一个非常关键且常被忽视的因素。  

4. **优化器选择变化**  
  随着表数据量剧增,优化器对成本的评估会变化。  

    影响：放弃索引选择全表扫描： 当优化器估算通过索引回表访问大部分数据块的成本高于直接全表扫描的成本时,它会选择全表扫描,即使索引存在。这通常发生在需要返回表中很大比例行的情况下。虽然索引本身效率没变低,但优化器不再使用它。  

5. **统计信息过时**  
  如果表、索引的统计信息没有及时更新（收集）,优化器基于过时的信息（如很小的行数估计）可能错误地选择了索引扫描,而实际上数据量已经很大,全表扫描更优。错误的执行计划会导致性能急剧下降。

6. **索引维护开销增加**  
  对表进行INSERT, UPDATE（索引键值）,DELETE操作时,都需要维护索引。  

    影响： 数据量越大,索引本身也越大。维护操作（如分裂叶子块、平衡树结构）可能需要更多时间和资源,尤其是在高并发写入场景下。虽然这主要影响写性能,但维护过程中可能产生的争用也会间接影响查询。

7. **索引碎片化**  
  频繁的DML操作（尤其是删除和更新）会导致索引块内出现空闲空间,或者索引块变得稀疏。物理存储上也可能变得不连续。  

    影响：  

      虽然Oracle的B-Tree索引能较好地处理碎片,但严重的碎片化会：

      ```plain
        1.增加索引的物理大小（占用更多空间）。
        2.增加范围扫描时需要读取的索引块数量（因为有效数据更分散）。  
        3.增加逻辑/物理I/O。  
        4.数据量越大,经历DML越多,碎片化风险越高。
      ```

8. **缓冲区缓存效率**  
  数据库的Buffer Cache内存是有限的。数据量和索引量越大,Buffer Cache能缓存的索引块的比例就越低。  
  
    影响： 查询时更可能发生物理读（Physical Read）,需要从磁盘读取索引块和数据块,速度远慢于内存访问。频繁访问的“热”索引部分可能还能常驻内存,但范围扫描涉及的大量“冷”索引块和数据块很可能需要物理I/O。

### 执行计划

创建计划表

```sql
EXPLAIN PLAN FOR SELECT * FROM EMPLOYEES WHERE <expression>;
```

查看执行计划

```sql
SELECT * FROM TABLE(DBMS_XPLAN.DISPLAY);
```

执行计划表

```plain
Plan hash value: 2949544139
------------------------------------------------------------------------------------------
| Id  | Operation                    | Name       | Rows | Bytes | Cost (%CPU)| Time     |
------------------------------------------------------------------------------------------
|   0 | SELECT STATEMENT             |            |    1 |    69 |    1   (0) | 00:00:01 |
|   1 |  TABLE ACCESS BY INDEX ROWID | EMPLOYEES  |    1 |    69 |    1   (0) | 00:00:01 |
|*  2 |   INDEX UNIQUE SCAN          | EMP_ID_PK  |    1 |       |    0   (0) | 00:00:01 |
------------------------------------------------------------------------------------------
```

- `Id`：步骤的编号,由内向外执行
- `Operation`：操作类型
- `Name`：对象名称
- `Rows`：预估处理的行数,越小越好
- `Cost`：代价数值越小效率越高

`access`  
`filter`

### 事务

事务是逻辑上的一组SQL操作,组成事务的操作**要么全部成功,要么全部失败**。

#### 事务的特性 ACID

- 原子性 Atomicity  
  要么全部完成,要么全部回滚至执行前
- 一致性 Consistency  
  事务执行前后的数据都必须是合法状态
- 隔离性 Isolation  
  多个事务间独立进行,互不干扰
- 持久性 Durability  
  事务提交完成后数据永久改变

#### 事务的并发问题

事务并发访问引发的三个问题

1. 脏读  
  一个事务读取到另一个事务尚未提交的数据
2. 不可重复读  
  一个事务中多次读取的数据内容不一致
3. 幻读  
  一个事务读取到了别的事务插入或删除的数据

**脏读**  
事务A在时序T3读取事务B未提交的数据

| 时序 | A | B |
| :-: | :-: | :-: |
| T1 | 开始事务 | 开始事务 |
| T2 |  | 更新数据 |
| T3 | **读取数据** |  |
| T4 |  | 回滚数据 |

解决办法：  
设置读已提交,使查询只能获取其他事务**已提交的数据**,事务在读取数据时会固定看到**最新的已提交版本**

**不可重复读**  
事务A在时序T2和时序T4读取同一行数据的内容不一致

| 时序 | A | B |
| :-: | :-: | :-: |
| T1 | 开始事务 | 开始事务 |
| T2 | 读取数据 |  |
| T3 |  | 更新数据 |
|  |  | 提交数据 |
| T4 | **读取数据** |  |

解决办法：  
设置可序列化,确保事务串行执行。事务在读取数据时会固定看到**事务开始时的版本**,后续其他事务提交的修改在**本事务提交或回滚前不可见**

**幻读**  
事务A相同查询语句在时序T2和时序T4读取数据结果集不一致

| 时序 | A | B |
| :-: | :-: | :-: |
| T1 | 开始事务 | 开始事务 |
| T2 | 读取数据 |  |
| T3 |  | 插入/删除数据 |
|  |  | 提交数据 |
| T4 | **读取数据** |  |

解决办法：  
设置可序列化,确保事务串行执行。事务在读取数据时会固定看到**事务开始时的版本**,后续其他事务提交的修改在**本事务提交或回滚前不可见**

| 并发问题 | 读已提交 | 可序列化 |
| - | - | - |
| 脏读 | 否 | 否 |
| 不可重复读 | 可能 | 否 |
| 幻读 | 可能 | 否 |
| 并发性能 | 高 | 中 |
| 数据一致性 | 中 | 高 |

#### 事务的生命周期

在Oracle数据库中,执行第一条DML开始,到 `COMMIT` 或 `ROLLBACK` 为止,为一个事务的生命周期  
DDL自动提交

### 数据字典

数据字典是对数据库中数据结构的详细描述,涵盖了表名、列名、数据类型、约束条件、数据含义等信息  
通常在逻辑设计阶段完成,表结构确定后生成,用于记录和管理数据库中的元数据。  
数据字典的作用在于为数据库开发、维护和使用提供统一的标准和参考,方便开发人员、数据库管理员和业务人员之间的沟通和协作。

### 序列

主键字段手动维护繁琐,Oracle提供**序列**进行自动维护。  
**序列**是ORACLE提供的用于产生一系列唯一数字的对象,能够按照预先设定的规则,依次产生一系列唯一的数字。这些数字通常是整数,并且会按照特定的顺序递增或者递减。  
序列**独立于表存在**,可以通过序列设置表中的`NUMBER`类型的字段自动增长,可被多个表或者同一个表的不同列使用。

1. 序列可以自动生成主键值
2. 保证数据的唯一性

基本语法

```sql
-- 创建序列
CREATE SEQUENCE <sequence>;  -- 约定命名为<column>_seq

-- 获取序列的当前值
SELECT <sequence>.CURRVAL FROM dual;

-- 获取序列的下一个值
SELECT <sequence>.NEXTVAL FROM dual;

-- 创建序列完整语法
CREATE SEQUENCE <sequence>
    [INCREMENT BY <n>]  -- 序列递增值,默认为1
    [START WITH <n>]  -- 序列起始值,递增默认为minvalue 递减为maxvalue
    [{MAXVALUE <n> | NOMAXVALUE}]  -- 最大值
    [{MINVALUE <n> | NOMINVALUE}]  -- 最小值
    [{CYCLE | NOCYCLE}]  -- 循环或不循环,默认NOCYCLE
    [{CACHE <n> | NOCACHE}]  -- 提前生成并存入内存,默认CACHE 20
; 

-- 删除序列
DROP SEQUENCE <sequence>;
```

![Static Badge](https://img.shields.io/badge/TO_BE-COUTINUE-yellow)
