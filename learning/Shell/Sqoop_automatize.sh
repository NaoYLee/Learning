#!/bin/bash
# todo 假设某银行每天需要将客户信息、交易记录、账户信息、贷款信息和信用卡信息这五张表从Oracle数据库导入到HDFS，
# todo 并且每张表存储文件夹名字和表名保持一致，如果目标目录存在就提前删除，指定分隔符为逗号，存储格式为ORC。
# todo 为了自动化这个过程，使用shell脚本和Sqoop，并将执行过程所产生的日志文件进行记录。
# todo 程序执行成功后发送邮件进行通知。
# * 操作系统：Linux
# * 数据库：Oracle
# * Sqoop版本：1.4.9
# * Hadoop版本：3.3
# * Hive已安装并配置好
# * HDFS目标存储目录：/data/bank
# * 日志文件保存目录：/var/log/sqoop_import.log
# * 邮件通知邮箱：bigdata@example.com

# ~ 配置参数
ORACLE_CONNECT="jdbc:oracle:thin:@tcp://<host>:<port>:<SID>"
ORACLE_USER="<username>"
ORACLE_PASS="<password>"
HDFS_TARGET_DIR="/data/bank"
LOG_FILE="/var/log/sqoop_import.log"
EMAIL_ADD="bigdata@example.com"
TABLES=("customers" "transactions" "accounts" "loans" "credit_cards")

# ~ 初始化日志文件
rm -rf "$LOG_FILE"
mkdir -p "$(dirname "$LOG_FILE")"
touch "$LOG_FILE"
chmod 644 "$LOG_FILE"

# ~ 记录开始时间
echo "======================================================================" >> "$LOG_FILE"
echo "导出开始时间: $(date +'%Y-%m-%d %H:%M:%S')" >> "$LOG_FILE"

# ~ 定义导出函数
table_import () {
    local table="$1"
    local hdfs_dir="${HDFS_TARGET_DIR}/${table}"

    echo "开始导入表: $table" >> "$LOG_FILE"
    start_time=$(date +%s)
    echo "开始时间：$start_time" >> "$LOG_FILE"

    sqoop import \
    --connect "$ORACLE_CONNECT" \
    --username "$ORACLE_USER" \
    --password "$ORACLE_PASS" \
    --table "$table" \
    --target-dir "$hdfs_dir" \
    --fields-terminated-by ',' \
    --as-orcfile \
    -m 1 >> "$LOG_FILE" 2>&1

    return $?
}

# ~ 循环所有表
success=true

for table in "${TABLES[@]}"
do
    hdfs dfs -test -d "${HDFS_TARGET_DIR}/${table}"
    return_code=$?
    if [ $return_code -eq 0 ]
    then
        hdfs dfs -rm -r -f "${HDFS_TARGET_DIR}/${table}" >> "$LOG_FILE"
    fi

    table_import "$table"

    status=$?
    lasting=$(( $(date +%s) - start_time ))

    if [ $status -eq 0 ]; then
        echo "表$table 导出成功" >> "$LOG_FILE"
        echo "执行时长：$lasting" >> "$LOG_FILE"
    else
        echo "表$table 导出失败" >> "$LOG_FILE"
        echo "执行时长：$lasting" >> "$LOG_FILE"
        success=false
    fi
done

# ~ 发送邮件通知
if $success
then
    echo "所有表导出完毕" >> "$LOG_FILE"
    echo "======================================================================" >> "$LOG_FILE"
    mail -s "Sqoop执行通知" "$EMAIL_ADD"
    exit 0
else
    echo "部分表导出失败" >> "$LOG_FILE"
    echo "======================================================================" >> "$LOG_FILE"
    mail -s "Sqoop执行通知" "$EMAIL_ADD"
    exit 1
fi