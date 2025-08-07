# Apache Hive

Apache Hive是建立在Hadoop至上的开源数据仓库系统,可以将存储在Hadoop中的结构化、半结构化数据文件映射为数据库表,并提供类似`SQL`的查询模型,称为Hive查询语言`HQL`  
Hive的核心是将`HQL`转换为`MapReduce`进程并提交到Hadoop集群执行

## 功能实现关键

### 映射信息记录

Hive通过内置的Derby或外部数据库存储Hadoop集群中数据文件的元数据,使用`metaserver`进行管理  
HQL的DDL与DML本质上是修改元数据  
直接通过HDFS操作Hive表路径不会影响元数据

### Hive读写文件机制

- 读取文件
  - 首先调用InputFormat(默认TextInputFormat),返回一条一条kv键值对记录(默认是一行对应一条记录)
  - 然后调用SerDe(默认LazySimpleSerDe)的Deserializer,将一条记录中的value根据分隔符切分为各个字段
  - HDFS files --> InputFormat --> <key,value> --> Deserializer --> Row object
- 写文件机制
  - 首先调用SerDe(默认LazySimpleSerDe)的Serializer将对象转换成字节序列,
  - 然后调用OutputFormat将数据写入HDFS文件中
  - Row object --> Serializer --> <key,value> --> OutputFormat --> HDFS files

## 数据类型

- Hive对于英文字母大小写不敏感
- 除SQL数据类型外,还支持Java数据类型,比如：string
- 复杂数据类型的使用通常需要和分隔符指定语法配合使用

### 原生数据类型

- 数值类型
  - TINYINT
  - SMALLINT
  - **INT**
  - BIGINT
  - FLOAT
  - **DOUBLE**
  - DECIMAL
  - NUMERIC
- 时间类型
  - **TIMESTAMP**
  - **DATE**
  - INTERVAL
- 字符串类型
  - **STRING**
  - VARCHAR
  - CHAR
- 杂项数据类型
  - BOOLEAN
  - BINARY

原生数据类型支持从窄类型到宽类型的隐式转换

### 复杂数据类型

**`ARRAY`** \<type>

**`MAP`** <key_type, value_type>

`STRUCT` <name, type>

`UNION` <type, type, ...>

| 特性 | ARRAY | MAP | STRUCT | UNIONTYPE |
| - | - | - | - | - |
| 本质 | 有序的同类型元素列表 | 键值对集合(键基本类型/唯一) | 命名字段的集合(字段名/类型) | 值可以是多个指定类型之一(当前仅一种) |
| 访问方式 | 整数索引[0], [1], ... | 键(Key) ['key'] | 字段名(Field Name).fieldname | 函数(create_union, uniontype_tag, uniontype_value, uniontype_get) |
| 元素要求 | 所有元素类型相同 | 键类型相同(基本类型),值类型相同 | 字段类型可不同,名称必须唯一 | 值必须是声明中某一种类型 |
| 顺序 | 有(索引顺序) | 无(但迭代顺序可能确定) | 无(按字段名访问) | - |
| 键/字段 | 无 | 键(Key) | 字段(Field) | - |
| 典型用途 | 列表、序列、重复项集合(标签、电话号码) | 属性字典、键值配置、稀疏向量 | 组合相关属性(地址、坐标点、用户对象) | 模式演化、处理字段类型可能不同的稀疏数据 |
| 声明示例 | ARRAY\<STRING> | MAP<STRING, INT> | STRUCT<street: STRING, city: STRING, zip: INT> | UNIONTYPE<INT, FLOAT, STRING> |
| 值示例 | ['apple', 'banana', 'orange'] | {'color': 'red', 'size': 10} | {'street': 'Main St', 'city': 'Anytown', 'zip': 12345} | create_union(0, 42)(INT 42) 或 create_union(2, "error")(STRING "error") |

## Hive DDL

### 数据库

**创建数据库**  

```HQL
CREATE [DATABASE|SCHEMA] [IF NOT EXISTS] <database>
[COMMENT '<comment>']
LOCATION '</HDFS_path>'
[WITH DBPROPERTIES ('<property>'='<value>', ...)];
```

**查看数据库结构**  

```HQL
DESCRIBE DATABASE [EXTENDED] <database>;
```

**查看数据库建库语句**  

```HQL
SHOW CREATE DATABASE <database>;
```

**切换数据库**  

```HQL
USE <database>;
```

**删除数据库**  

```HQL
DROP DATABASE <database> [RESTRICT|CASCADE];  -- 默认RESTRICT只能删除空库,CASCADE用于强制删除
```

**修改数据库属性**  

```HQL
ALTER DATABASE <database> SET DBPROPERTIES ('<property>'='<value>', ...);
ALTER DATABASE <database> SET OWNER [USER|ROLE] <account_type>;
ALTER DATABASE <database> SET LOCATION '</HDFS_path>';
```

**查询所有数据库**  

```HQL
SHOW DATABASES;
SHOW SCHEMAS;
```

**查看当前数据库**  

```HQL
SELECT current_database();
```

### 表

**完整建表语句**  

```HQL
CREATE [TEMPORARY] [EXTERNAL] TABLE [IF NOT EXISTS] [<database>.]table (
    <column_1> <type_1> [COMMENT <comment_1>],
    <column_2> <type_2> [COMMENT <comment_2>],
    ...
) [COMMENT <comment>]
[PARYTITIONED BY (<column> <type> [COMMENT <comment>], ...)]
[CLUSTERED BY (<column_1>, <column_2>, ...) [SORTED BY (<column>) [ASC|DESC], ...] INTO <num_buckets> BUCKETS]
[ROW FORMAT [DELIMITED
[FIELDS TERMINATED BY '<separator>']
[COLLECTION ITEMS TERMINATED BY '<separator>']
[MAP KEYS TERMINATED BY '<separator>']
[LINES TERMINATED BY '<separator>']
|SERDE <serde>
[WITH SERDEPROPERTIES (<property>=<value>, ...)]]]
[STORED AS <file_format>]
[LOCATION </HDFS_path>]
[TBLPROPERTIES ('<property>'='<value>', ...)];
```

**查看表元数据**  

```HQL
DESCRIBE [EXTENED] <table>;
DESCRIBE FORMATTED <table>;
```

**删除表**  

```HQL
DROP TABLE [IF EXISTS] <table> [PURGE];
TRUNCATE [TABLE] <table>;
```

- `DROP`
  - 删除元数据和数据,实际上是将该表数据文件移入垃圾桶目录,只删除元数据
  - 删除EXTERNAL表时,该表的数据文件不会从HDFS中删除,只删除元数据  
  - 如果指定了`PURGE`则数据不会进入垃圾桶目录直接被删除,无法找回表数据
- `TRUNCATE`
  - 只删除数据文件,保留表的元数据结构
  - 如果HDFS启用了垃圾桶,数据将被移入垃圾桶,否则将被删除

**修改表**  

```HQL
-- 更改表名
ALTER TABLE <table_name> RENAME TO <new_table_name>;

-- 更改表属性
ALTER TABLE <table> SET TBLPROPERTIES (property_name = property_value, ... );

-- 更改表注释
ALTER TABLE <table> SET TBLPROPERTIES ('comment' = "new comment for student table");

-- 更改SerDe属性
ALTER TABLE <table> SET SERDE serde_class_name [WITH SERDEPROPERTIES (<property> = <value>, ... )];
ALTER TABLE <table> [PARTITION <partition>] SET SERDEPROPERTIES serde_properties;
ALTER TABLE <table> SET SERDEPROPERTIES ('field.delim' = ',');

-- 移除SerDe属性
ALTER TABLE <table> [PARTITION <partition>] UNSET SERDEPROPERTIES (<property>, ... );

-- 更改表的文件存储格式 该操作仅更改表元数据。现有数据的任何转换都必须在Hive之外进行。
ALTER TABLE <table> SET FILEFORMAT file_format;

-- 更改表的存储位置路径
ALTER TABLE <table> SET LOCATION '</file_path>';

-- 更改列名称/类型/位置/注释
  -- 使用前先备份数据及元数据
  -- 数据类型只能同宽或向更宽修改
ALTER TABLE <table> CHANGE <column> [<column>|<new_column>] [<type>|<new_type>] [FIRST|AFTER <column_target>] [COMMENT <comment>];

-- 添加/替换列
  -- ADD可以将新列添加到现有列的末尾但在分区列之
  -- REPLACE将删除所有现有列,并添加新的列
ALTER TABLE <table> [ADD|REPLACE] COLUMNS (<column> <type>,...);
```

**查询所有表**  

```HQL
SHOW TABLES [IN <database>];
```

#### 分隔符

指定数据文件中字段间的分隔符
>`FIELDS TERMINATED BY '<separator>'`

指定`ARRAY`集合元素间的分隔符
>`COLLECTION ITEMS TERMINATED BY '<separator>'`

指定`MAP`类型映射间的分隔符
>`MAP KEYS TERMINATED BY '<separator>'`

指定行数据间的分隔符
>`LINES TERMINATED BY '<separator>'`

不使用`ROW FORMAT`指定分隔符时默认使用下述控制字符为分隔符

| 2进制 | 10进制 | 16进制 | ctrl | 显示信息 | 解释 |
| :-: | :-: | :-: | :-: | :-: | :-: |
| 0000 0001 | 1 | 01 | ^A | SOH | 头标开始 |

#### 内部表 MANAGED TABLE

内部表是默认情况下创建的表,Hive拥有该表的结构和文件,完全管理该表元数据和数据的生命周期  
当删除内部表时,**会删除表的元数据及存储在HDFS中的数据**

#### 外部表 EXTERNAL TABLE

使用`EXTERNAL`关键字创建外部表,Hive只管理外部表的元数据
删除外部表时,**只会删除Hive管理的元数据,不会删除数据**

#### 分区表 Partitioned Table

Hive支持根据指定字段进行分区  
实质是建立一个新的字段,并在HDFS中将不同分区的数据文件分别存储,当使用分区查询时只查询对应路径下的数据文件  
**分区字段不能是表中存在的字段**

```HQL
CREATE TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) PARTITIONED BY (<partition_1> <type_1>, <partition_2> <type_2>, ...);
```

**查询分区**  

```HQL
SHOW PARTITIONS <table>;
SHOW TABLE EXTENDED [IN|FROM <database>] LIKE <table>;
```

**修改分区表**  

```HQL
-- 增加分区/多重分区/多个分区
ALTER TABLE <table> ADD
    PARTITION (<partition_1> = '<value_1>'[, <partition_2> = '<value_2>', ...]) LOCATION '/<HDFS_path_1>'
   [PARTITION (<partition_3> = '<value_3>') LOCATION '/<HDFS_path_2>'];

-- 重命名分区
ALTER TABLE <table> PARTITION <partiton> RENAME TO PARTITION <new_partiton>;

-- 删除分区
ALTER TABLE <table> DROP PARTITION (<partition> = '<value>');

-- 修复分区
  -- ADD用于向元数据增加HDFS中存在而元数据中不存在的分区
  -- DROP用于从元数据删除HDFS中不存在而元数据中存在的分区
  -- SYNC用于同步元数据与HDFS间的差异
MSCK [REPAIR] TABLE <table> [ADD|DROP|SYNC] PARTITIONS;

-- 修改分区位置信息
ALTER TABLE <table> PARTITION (<partition> = '<value>') SET LOCATION '</HDFS_path>'
```

##### 多重分区

多重分区时,分区之间是一种递进关系,在迁移分区基础上继续分区  
反映在HDFS中表现为分区文件夹中建立新的文件夹

**向多重分区表中插入数据时,必须按先静态再动态的顺序进行**  

#### 分桶表 Bucketed Table

分桶表是一种用于优化查询而设计的表类型  
分桶时需要指定分桶字段及分桶数,桶编号相同的数据会被分到同一个桶中  

```HQL
CREAT TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) CLUSTERED BY (<column>)  -- 指定分桶的字段
[SORTED BY (<column>) [ASC|DESC], ...]  -- 指定分桶后排序的字段
INTO <N> BUCKETS;  -- 指定分桶数
```

**分桶字段必须是表中存在的字段**  

- 在查询时使用`WHERE`子句指定分桶,避免全表扫描
- 使用`JOIN`子句时若两表都根据相同列值进行了分桶,将提高连接效率

| 特性 | 分区表 | 分桶表 |
| - | - | - |
| 核心目的 | 水平划分数据集,基于分区键的离散值将数据物理分离到不同目录 | 垂直划分数据集,基于哈希函数将数据均匀分布到固定数量的文件(桶)中 |
| 物理存储 | 每个分区对应一个 HDFS 目录| 每个桶对应一个 HDFS 文件 |
| 划分依据 | 用户定义的 分区列的值 | 用户定义的 分桶列 + 哈希函数 + 桶数量 |
| 数据组织 | 数据按分区键的值分组存储,不同分区的数据不会混在一起 | 同一分区的数据(如果表也分区)被均匀散列到所有桶中 |
| 主要优势 | 分区剪裁：查询时跳过无关分区目录,极大减少 I/O | 桶裁剪：连接/采样时只需读取匹配桶,减少数据扫描量；高效连接(Map-Side Join)；高效采样 |
| 适用场景 | 过滤条件常包含分区键(如 WHERE dt='2023-10-01') | 频繁在分桶键上进行等值连接(JOIN)或需要高效随机采样 |
| 数据倾斜影响 | 可能严重：不同分区的数据量差异可能很大 | 较少：哈希函数通常能保证数据在桶间相对均匀分布 |
| 动态/静态 | 支持动态分区(根据插入数据自动创建)和静态分区 | 分桶规则在建表时固定,写入数据时自动应用哈希分桶 |
| 典型用例 | 按日期(dt)、国家(country)、类别(category)存储日志或交易数据 | 按用户ID(user_id)、商品ID(product_id)对大型表进行分桶以优化连接 |

#### 事务表

Hive在设计之初因为工作原理而不支持事务  
在Hive0.14版本中增加了对对事务的简单支持

```HQL
-- 设置Hive支持并发
set hive.support.concurrency = true;
-- 设置开启分桶功能,从Hive2.0开始不再需要
set hive.enforce.bucketing = true;
-- 设置动态分区模式
set hive.exec.dynamic.partition.mode = nonstrict;
set hive.txn.manager = org.apache.hadoop.hive.ql.lockmgr.DbTxnManager;
-- 在Metastore实例上运行启动压缩合并
set hive.compactor.initiator.on = true;
-- 在此metastore实例上运行多少个压缩程序工作线程
set hive.compactor.worker.threads = 1;

CREATE TABLE <table>(
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) CLUSTERED BY (<column>) INTO <N> BUCKETS  -- 事务表必须是分桶表
STROED AS ORC  -- 事务表必须以ORC格式存储
TBLPROPERTIES('transactional'='true');  -- 事务表必须设置transactional为true
```

##### 事务表操作

```HQL
-- 复制表
CREATE TABLE <table_target> AS
SELECT *
FROM <table_source>;

-- 复制表结构
CREATE TABLE <table_target>  LIKE
SELECT *
FROM <table_source>;
```

##### 事务表的局限性

- 仅支持ORC文件格式(STORED AS ORC)
- 表必须是分桶表(Bucketed)才可以使用事务功能
- 不支持ROLLBACK,所有语言操作都是自动提交的
- 只有内部表可以设定为事务表
- 所有操作都是通过向HDFS中写入文件进行的

### 视图

Hive中的视图只保存DQL语句,不实际存储数据,无法提高查询性能  
创建视图时将固定视图架构,如果基础表被更改或删除将导致视图失效  
无法向视图中插入数据

```HQL
-- 创建视图
CREATE VIEW <view> AS
SELECT
    <column_1>,
    <column_2>,
    ...
FROM [<table>|<view>]
[WHERE <experssion>]
[LIMIT <N_START>,<NUM_ROW>];

-- 使用视图
SELECT
    <column_1>,
    <column_2>,
    ...
FROM <view>;
```

## Hive DML

### 从文件系统加载数据文件 `LOAD`

```HQL
-- 从Linux系统中加载数据文件
LOAD DATA LOCAL INPATH '</file_path>' [OVERWRITE] INTO TABLE <table>;

-- 从HDFS中获取数据文件
LOAD DATA INPATH '</HDFS_path>' [OVERWRITE] INTO TABLE <table>;
```

`OVERWRITE`用于覆盖已有数据文件

### 向表中插入数据 `INSERT`

每次使用`INSERT`语句都会生成一个新的数据文件  
使用`INSERT`插入数据时不需要指定数据分隔符

```HQL
-- 手动插入数据
INSERT INTO <table> (<column_1>, <column_2>,...)
VALUES
  (<value_11>, <value_21>,...),
  (<value_21>, <value_22>,...),
  ...
;

-- 从已有表中选择数据插入
INSERT INTO <table_target>
SELECT *
FROM <table_source>;

-- 多重插入
FROM <table_source>
INSERT OVERWRITE TABLE <table_target_1>
SELECT <column_11>, <column_12>, ...
INSERT OVERWRITE TABLE <table_target_2>
SELECT <column_21>, <column_22>, ...
...;
```

### 分区表静态加载

用户在加载数据时手动指定分区名称及对应数据文件

```HQL
LOAD DATA [LOCAL] INPATH '</file_path>'
INTO TABLE <table> PARTITION (<partition> = '<value>');

INSERT INTO TABLE <table_target> PARTITION (<partition> = '<value>')
SELECT *
FROM <table_source>
WHERE <column>='<value>';
```

### 分区表动态加载

动态分区插入数据时,Hive会根据指定的字段内容自动指定分区名称

```HQL
-- 开启动态分区功能
set hive.exec.dynamic.partition=true;
-- 指定动态分区模式,strict要求至少一个分区为静态分区
set hive.exec.dynamic.partition.mode=[strict|nonstrict];

INSERT INTO TABLE <table_target> PARTITION (<partition>)
SELECT <table_source.>*, <partition>
FROM <table_source>;
```

**使用动态分区时只能使用`INSERT INTO`语法进行插入**  

### 分桶表数据加载

分桶表只能使用`INSERT INTO`语句向分桶表中添加数据

### 事务表`INSERT INTO`操作

```HQL
-- 使用`CASE WHEN`将表中目标字段值修改为更新值覆写进表中
INSERT OVERWRITE INTO <table>
SELECT
    <column_1>,
    <column_2>,
    ...,
    CASE WHEN <column_target> = <value> THEN <value_target> END
FROM <table>;

-- 将表中所有目标字段值不为删除值的行覆写进表中
INSERT OVERWRITE INTO <table>
SELECT
    <column_1>,
    <column_2>,
    ...
FROM <table>
WHERE <column_target> != <value_target>;

-- 合并小文件
INSERT OVERWRITE INTO <table>
SELECT *
FROM <table>;
```

### 导出数据

```HQL
INSERT OVERWRITE [LOCAL] DIRECTORY '</directory_path>'
[ROW FORMAT DELIMITED
[FIELDS TERMINATED BY '<separator>' [ESCAPED BY '<separator>']]
[COLLECTION ITEMS TERMINATED BY '<separator>']
[MAP KEYS TERMINATED BY '<separator>']
[LINES TERMINATED BY '<separator>']]
[STORED AS <file_format>]
SELECT <column_1>, <column_2>, ...
FROM <table>;

-- 多重导出
FROM <table>
INSERT OVERWRITE [LOCAL] DIRECTORY '</directory_path_1>'
SELECT <column_11>, <column_12>, ...
INSERT OVERWRITE [LOCAL] DIRECTORY '</directory_path_2>'
SELECT <column_21>, <column_22>, ...
...;
```

## Hive DQL

```HQL
[WITH <CTE> AS <CommonTableExpression>] 
SELECT [DISTINCT]
  <column_1>,
  <column_2>,
  ...
FROM <table>
[WHERE <expression>]
[GROUP BY <column_1>, <column_2>, ...]
[ORDER BY <column_1>, <column_2>, ... [ASC|DESC]]
[[CLUSTER BY <column_1>, <column_2>, ...]|
[DISTRIBUTE BY <column_1>, <column_2>, ...][SORT BY col_list]]
[LIMIT [offset,] rows];
```
