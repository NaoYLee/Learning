# Apache Sqoop

Sqoop是一款主要用于在Hadoop生态体系和RDBMS体系之间传送数据的一种工具,可以理解为："SQL到Hadoop"和"Hadoop到SQL"

> 导入(import)：指的数据从关系型数据库传输到Hadoop生态体系  
> 导出(export)：指的数据从Hadoop生态体系传输到关系型数据

Sqoop通过解析传递的参数,将这些参数传递给底层的MapReduce模板来运行  
所有Sqoop的MapReduce程序只有Map过程,没有Reduce过程,因为数据迁移过程通常不需要聚合操作

## 查看数据库

```shell
sqoop list-databases \
--connect <jdbc-url> \
--username <user_name> \
[--password <password>|-p]
```

`--connect` 数据库url格式链接  
`--username` 用户名  
`[--password|-p]` 密码|隐式输入

## 数据库导入HDFS

### 导入带主键的表

```shell
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
[--delete-target-dir \]
--target-dir <HDFS_path>[ \]
[--fields-terminated-by '<sep>' \]
[--verbose \]
```

`--table` 目标表  
`--delete-target-dir` 导入HDFS目标路径若存在提前删除  
`--target-dir` 导入HDFS目标路径  
`--fields-terminated-by` 制定分隔符  
`--verbose` 显示完整信息  

### 导入无主键的表

无主键的表需要指定--split-by参数或者是将maptask的数量设置为1

```shell
# 使用--split-by参数
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--target-dir <HDFS_path> \
--split-by <column>

# 设置MapTask数量为1
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--target-dir <HDFS_path> \
-m 1
```

`--split-by` 指定进行Map所依据的字段
`-m` 设置MapTask数量

### 导入表数据子集

```shell
# 导出指定字段数据
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--columns '<column_1>, <column_2>, ..' \
--table <table> \
--target-dir <HDFS_path>

# WHERE过滤数据
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--where '<expression>' \
--table <table> \
--target-dir <HDFS_path>

# QUERY查询
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--query '<select expression> where $CONDITIONS' \
--target-dir <HDFS_path>
```

`--columns` 选择要导入HDFS的字段  
`--where` 选择要导入HDFS的数据  
`--query` 选择要导入HDFS的数据,不能与`--table`一起使用,必须要用where指定 \$CONDITIONS,使用双引号时$需要用`\`转义

### 空值处理

```shell
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--null-string '\\N' \
--null-non-string '-1' \
--target-dir <HDFS_path>
```

`--null-string` 针对字符串类型的null值处理方式  
`--null-non-string` 针对非字符串类型的null值处理方式

## 数据库导入Hive

从数据库复制表结构

```shell
sqoop create-hive-table \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--hive-table <database>.<hive_table>
```

`--table` 为数据库中的表  
`--hive-table` 为Hive中表
`--hive-database` 指定Hive中表存放的数据库

### 全量数据导入

```shell
# 导入至Hive已有表
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--hive-import \
--hive-database <database> \
--hive-table <hive_table>

# 直接复制表结构及数据
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--hive-import \
--hive-database <database>
```

`--hive-import` 向Hive中导入数据

### 增量数据导入

#### Append模式

```shell
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--hive-import \
--hive-database <database> \
--hive-table <hive_table> \
--incremental append \
--check-column <column> \
--last-value <value>
```

`--incremental` 定义增量导入类型  
`--check-column` 检查指定列中的增量数据更改  
`--last-value` 增量检查列中最后导入的值

#### LastModified模式

```shell
sqoop import \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--target-dir <HDFS_path> \
--incremental lastmodified \
--check-column <column> \
--last-value <value> \
[--append|--merge-key <column>]
```

| 特性 | `--append` | `--merge-key` |
| - | - | - |
| 目的 | 简单追加新/变更记录 | 合并新变更记录到已有数据，更新旧版本 |
| 输出位置 | 同一 HDFS 目录 (新文件) | 新的 HDFS 目录 (默认) |
| 数据状态 | 存在重复记录 (同一记录多次修改) | 每个键只保留最新版本记录 |
| 适用场景 | 容忍重复；后续ETL处理重复 | 需要精确最新快照；避免重复 |
| 处理方式 | 直接文件追加 | 启动 MapReduce 作业合并 |
| 主键要求 | 不需要 | 必须使用`--merge-key`指定主键 |

## HDFS导出数据库

默认情况下,`sqoop export`将每行输入记录转换成一条INSERT语句添加到目标数据库表中  
如果数据库中的表具有约束条件并且已有数据存在，则必须注意避免插入违反这些约束条件的记录,如果INSERT语句失败，导出过程将失败  
此模式主要用于将记录导出到可以接收这些结果的空表中,通常用于全表数据导出,导出时可以是将Hive表中记录或者HDFS数据导出到目标表

```shell
sqoop export \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--input-fields-terminated-by '<sep>' \
--export-dir <HDFS_path>
```

`--input-fields-terminated-by` 指定字段之间的分隔符  
`--input-lines-terminated-by` 指定行之间的分隔符  
`--columns` 选择导出字段并设置顺序

> 当导出数据文件和目标表字段列顺序完全一致的时候可以不写,否则以逗号为间隔选择和排列各个列  
> 没有在columns中指定的字段,要么具备默认值要么允许插入空值,否则数据库会拒绝接受sqoop导出的数据

`--export-dir` 导出目录

> 在执行导出的时候必须指定，同时需要具备`--table`或`--call`参数两者之一  
> `--table` 是指的导出数据库当中对应的表  
> `--call` 是指的某个存储过程

`--input-null-string` 字符串类型数据空值处理方式  
`--input-null-non-string` 非字符串类型数据空值处理方式

### 更新导出

```shell
sqoop export \
--connect <jdbc-url> \
--username <user_name> \
--password <password> \
--table <table> \
--export-dir <HDFS_path> \
--update-key <column> \
--update-mode [updateonly|allowinsert]
```

`--update-key` 指定进行更新依据的字段  
`--updatemod` 指定更新模式

|  | `updateonly` | `allowinsert` |
| - | - | - |
|  | 仅更新已存在的数据记录，不会插入新纪录 | 更新已存在的数据记录，同时插入新纪录 |

![Static Badge](https://img.shields.io/badge/%E5%BE%85%E5%AE%8C%E5%96%84-red)

![Static Badge](https://img.shields.io/badge/TO_BE-COUTINUE-yellow)
