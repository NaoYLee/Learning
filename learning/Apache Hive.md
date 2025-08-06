# Apache Hive

Apache Hive 是建立在Hadoop至上的开源数据仓库系统，可以将存储在Hadoop中的结构化、半结构化数据文件映射为数据库表，并提供类似`SQL`的查询模型，称为Hive查询语言`HQL`。  
Hive的核心是将`HQL`转换为`MapReduce`进程并提交到Hadoop集群执行。

## 功能实现关键

### 映射信息记录

Hive通过内置的Derby或外部数据库存储Hadoop集群中数据文件的元数据，使用`metaserver`进行管理  
HQL的DDL与DML本质上是修改元数据

## 数据类型

- Hive对于英文字母大小写不敏感
- 除SQL数据类型外，还支持Java数据类型，比如：string
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

**`ARRAY`** <type_1, type_2, ...>

**`MAP`** <key_type, value_type>

`STRUCT` <column, type>

`UNION` <type, type, ...>

## 完整建表语句

```HQL
CREATE [TEMPORARY] [EXTERNAL] TABLE [IF NOT EXISTS] [<database>.]table (
    <column_1> <type_1> [COMMENT <comment_1>],
    <column_2> <type_2> [COMMENT <comment_2>],
    ...
) [COMMENT <comment>]
[PARYTITION BY (<column type> [COMMENT <comment>], ...)]
[CLUSTERED BY (<column_1>, <column_2>, ...) [SORTED BY (<column>) [ASC|DESC], ...] INTO <num_buckets> BUCKETS]
[ROW FORMAT [DELIMITED
[FIELDS TERMINATED BY '<separator>']
[COLLECTION ITEMS TERMINATED BY '<separator>']
[MAP KEYS TERMINATED BY '<separator>']
[LINES TERMINATED BY '<separator>']
|SERDE <serde>
[WITH SERDEPROPERTIES (<property>=<value>, ...)]]]
```

### 分隔符

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

### 内部表 MANAGED TABLE

内部表是默认情况下创建的表，Hive拥有该表的结构和文件，完全管理该表元数据和数据的生命周期  
当删除内部表时，**会删除表的元数据及存储在HDFS中的数据**

### 外部表 EXTERNAL TABLE

使用`EXTERNAL`关键字创建外部表，Hive只管理外部表的元数据
删除外部表时，**只会删除Hive管理的元数据，不会删除数据**

### 分区表 Partitioned Table

Hive支持根据指定字段进行分区  
实质是建立一个新的字段，并在HDFS中将不同分区的数据文件分别存储，当使用分区查询时只查询对应路径下的数据文件

```HQL
CREATE TABLE <table> (
    <column_1> <type_1>,
    <column_2> <type_2>,
    ...
) PARTITION BY (<partition_1> <type_1>, <partition_2> <type_2>, ...);
```

**分区字段不能是表中存在的字段**  

#### 分区静态加载

用户在加载数据时手动指定分区名称及对应数据文件

```HQL
load data [local] inpath '/<file_path>'
into table <table> partition (<partition>='<value>');

INSERT INTO TABLE <table_target> PARTITION (<partition>='<value>')
SELECT *
FROM <table_source>
WHERE <column>='<value>';
```

#### 分区动态加载

动态分区插入数据时，Hive会根据指定的字段内容自动指定分区名称

```HQL
-- 开启动态分区功能
set hive.exec.dynamic.partition=true;
-- 指定动态分区模式,strict要求至少一个分区为静态分区
set hive.exec.dynamic.partition.mode=[strict|nonstrict];

INSERT INTO TABLE <table_target> PARTITION (<column>)
SELECT <table_source.>*, <partition_column>
FROM <table_source>;
```

**使用动态分区时只能使用`INSERT INTO`语法进行插入**  

#### 多重分区

多重分区时，分区之间是一种递进关系，在迁移分区基础上继续分区  
反映在HDFS中表现为分区文件夹中建立新的文件夹

**向多重分区表中插入数据时，必须按先静态再动态的顺序进行**  

### 分桶表 Bucketed Table

分桶表是一种用于优化查询而设计的表类型。  
分桶时需要指定分桶字段及分桶数，桶编号相同的数据会被分到同一个桶中  

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
只能使用`INSERT INTO`语句向分桶表中添加数据

- 在查询时使用`WHERE`子句指定分桶，避免全表扫描
- 使用`JOIN`子句时若两表都根据相同列值进行了分桶，将提高连接效率

| 特性 | 分区表 | 分桶表 |
| - | - | - |
| 核心目的 | 水平划分数据集，基于分区键的离散值将数据物理分离到不同目录 | 垂直划分数据集，基于哈希函数将数据均匀分布到固定数量的文件（桶）中 |
| 物理存储 | 每个分区对应一个 HDFS 目录| 每个桶对应一个 HDFS 文件 |
| 划分依据 | 用户定义的 分区列的值 | 用户定义的 分桶列 + 哈希函数 + 桶数量 |
| 数据组织 | 数据按分区键的值分组存储，不同分区的数据不会混在一起 | 同一分区的数据（如果表也分区）被均匀散列到所有桶中 |
| 主要优势 | 分区剪裁：查询时跳过无关分区目录，极大减少 I/O | 桶裁剪：连接/采样时只需读取匹配桶，减少数据扫描量；高效连接（Map-Side Join）；高效采样 |
| 适用场景 | 过滤条件常包含分区键（如 WHERE dt='2023-10-01'） | 频繁在分桶键上进行等值连接（JOIN）或需要高效随机采样 |
| 数据倾斜影响 | 可能严重：不同分区的数据量差异可能很大 | 较少：哈希函数通常能保证数据在桶间相对均匀分布 |
| 动态/静态 | 支持动态分区（根据插入数据自动创建）和静态分区 | 分桶规则在建表时固定，写入数据时自动应用哈希分桶 |
| 典型用例 | 按日期(dt)、国家(country)、类别(category)存储日志或交易数据 | 按用户ID(user_id)、商品ID(product_id)对大型表进行分桶以优化连接 |

### 事务表

Hive在设计之初因为工作原理而不支持事务  
在Hive0.14版本中增加了对对事务的简单支持

```HQL
-- 设置Hive支持并发
set hive.support.concurrency = true;
-- 设置开启分桶功能，从Hive2.0开始不再需要
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
TBLPROPERTIES('transactional'='true');
```

事务表操作:

```HQL
insert into trans_student (id, name, age)
values (1,"allen",18);

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

-- 复制表
CREATE TABLE <table_target> AS
SELECT *
FROM <table_source>;

-- 复制表结构
CREATE TABLE <table_target>  LIKE
SELECT *
FROM <table_source>
```

#### Hive事务表的局限性

- 仅支持ORC文件格式(STORED AS ORC)
- 表必须是分桶表（Bucketed）才可以使用事务功能
- 不支持BEGIN，COMMIT和ROLLBACK，所有语言操作都是自动提交的
- 外部表不能成为ACID表，不允许从非ACID会话读取/写入ACID表
- 所有操作都是通过向HDFS中写入文件进行的
