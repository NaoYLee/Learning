#!/bin/bash
# 查找所有收款账户为 'ACC_RISK_999' 并且交易类型为 'TRANSFER' 或者交易类型为 'TRANSFER' 并且交易金额>=1,000,000.00的交易
grep -E 'ACC_RISK_999\|TRANSFER|TRANSFER\|[1-9][0-9]{6,}\.([0-9]{2})?' transaction_log_20250405.log | 
# 第1行命令:将 'YYYY-MM-DD HH:MM:SS' 格式转换为 'YYYYMMDDHHMMSS' 格式
# 第2行命令:将 '付款账户' 和 '收款账户' 字段中的账户号码进行部分脱敏
    # 因为文本内容使用 '|' 分隔每个字段,可以用 '[^|]*\|' 来区分各字段, '付款账户' 和 '收款账户' 分别位于第3和第4字段
    # 将账户开头的 'ACC' 或 'ACC_' 以及末尾3位数字保留,用 '***' 替换中间部分
# 第3行命令:将使用空格替换最后一个字段,达到删除的效果
# 第4行命令:使用 ',' 替换 '|' 作为分隔
sed -E \
    -e 's/([0-9]{4})-([0-9]{2})-([0-9]{2}) ([0-9]{2}):([0-9]{2}):([0-9]{2})/\1\2\3\4\5\6/' \
    -e 's/([^|]*\|[^|]*\|ACC_?)([^|])*([^|]{3}\|ACC_?)([^|])*([^|]{3})\|/\1***\3***\5\|/' \
    -e 's/\|Region.{1}/ /' \
    -e 's/\|/,/g' |
# 统计结果
    # 使用 'total++' 统计总可疑交易笔数
    # 将 $8 赋值给变量 'risk_tag' ,使用 'risk_count[risk_tag]++' 统计各风险标签数量,使用 'risk_amount[risk_tag] += $6' 计算各风险标签总金额
    # 将 $6 赋值给变量 'currency' ,使用 'currency_count[currency]++' 统计各货币类型数量,使用 'currency_amount[currency] += $6' 计算各货币类型总金额
    # 使用if语句,当 'currency' 变量中的值为 'USD' 时,先给 'usd_idx' 加1记录该行,并将该行 $2, $3, $4, $6 的值以对应格式储存进 'usd_details' 变量中,
# 打印结果
    # 总可疑交易笔数
    # 使用for语句,将 'risk_count' 中的各值赋予变量 'tag' ,打印对应的 'tag', 'risk_count[tag]', 'risk_amount[tag]' 
    # 使用for语句,将 'currency_count' 中的各值赋予变量 'curr' ,打印对应的 'curr', 'currency_count[curr]', 'currency_amount[curr]' 
    # 使用for语句,利用变量 'i' 与 'usd_idx' 找到需打印的行数,并打印对应行数的 'usd_details' 变量
awk -F ',' '
BEGIN {
    print "反洗钱分析报告"
}
{
    # 总可疑交易笔数
    total++

    # 按风险标签聚合
    risk_tag = $8
    risk_count[risk_tag]++
    risk_amount[risk_tag] += $6

    # 按货币聚合
    currency = $7
    currency_count[currency]++
    currency_amount[currency] += $6

    # 筛选USD交易
    if (currency == "USD") {
        usd_details[++usd_idx] = sprintf("%s,%s,%s,%.2f", $2, $3, $4, $6)
    }
}
END {
    # 输出统计结果
    print "1. 总可疑交易笔数: " total "\n"

    print "2. 按风险标签聚合:"
    for (tag in risk_count) {
        printf "风险标签: %s: 交易笔数: %d 笔, 总金额: %.2f\n", tag, risk_count[tag], risk_amount[tag]
    }

    print "\n3. 按货币聚合:"
    for (curr in currency_count) {
        printf "货币类型: %s : 交易笔数: %d 笔, 总金额: %.2f\n", curr, currency_count[curr], currency_amount[curr]
    }

    print "\n4. USD交易详细:\n交易ID,付款方,收款方,金额"
    for (i = 1; i <= usd_idx; i++) {
        print usd_details[i]
    }
}'