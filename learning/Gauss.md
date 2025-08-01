# Gauss

## PL/SQL

Pecedure Language

- 复用性强，一个存储过程多处调用
- 减少网络开销，逻辑在数据库内部执行，避免程序与数据库频繁交互
- 数据更安全，敏感操作封装在数据库内，避免暴露给外部

```plsql
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

```plsql
-- Oracle语法
BEGIN
    RAISE info 'hello world';
END;
```

```pgsql
-- Postgre语法
DO $$
BEGIN
    RAISE NOTICE 'hello world';
END $$;
```

### SELECT INTO

```plsql
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

## 游标

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

>访问游标属性时，需要使用游标名  
>使用隐式游标时未指定游标名，默认使用 `SQL` 作为游标名  

```pgsql
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

## 分区

| 分区类型 | 描述 | 使用场景 |
| - | - | - |
| 范围分区 | 按分区键值的范围划分（如日期、数值） | 数据内容连续 |
| 列表分区 | 按分区键的离散值划分 | 数据有明显分类|
| 哈希分区 | 通过哈希函数均匀分布数据 | 数据分布均匀，避免热点 |
| 复合分区 | 结合两种分区 | 多层次管理 |

范围分区语法

```plsql
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

```plsql
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

```plsql
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

```plsql
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

```plsql
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

```plsql
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

```plsql
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

## 函数

自定义函数
