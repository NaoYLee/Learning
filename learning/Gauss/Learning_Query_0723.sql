-- Active: 1752845857763@@192.168.10.130@5432@gaussdb_learning@public
-- IDE：Visual Studio Code EXTENSIONS: 1.cweijan.vscode-postgresql-client2 2.aaron-bond.better-comments
-- :一、范围分区（Range Partitioning）
/*
todo练习题 1：创建范围分区表
*需求：创建一个员工薪资表`employee_salary`，按薪资`salary`进行范围分区，规则如下：
*- 薪资低于 5000 的存放在`p_low`分区
*- 薪资 5000-10000（含 5000，不含 10000）的存放在`p_mid`分区
*- 薪资 10000 及以上的存放在`p_high`分区
*表结构：`emp_id INT PRIMARY KEY, name VARCHAR(50), dept VARCHAR(30), salary DECIMAL(10,2), hire_date DATE`
*/
DROP TABLE IF EXISTS employee_salary;
CREATE TABLE employee_salary (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(30),
    salary DECIMAL(10,2),
    hire_date DATE
) PARTITION BY RANGE (salary) (
    PARTITION p_low VALUES LESS THAN (5000),
    PARTITION p_mid VALUES LESS THAN (10000),
    PARTITION p_high VALUES LESS THAN (MAXVALUE)
);
/* 
todo练习题 2：插入数据到范围分区表
*需求：向`employee_salary`表插入以下数据，说明每条数据会存入哪个分区：
*1. `(1001, '张明', '研发部', 4500.00, '2020-03-15')`
*2. `(1002, '李华', '市场部', 8000.00, '2021-05-20')`
*3. `(1003, '王芳', '财务部', 12000.00, '2019-08-10')`
*4. `(1004, '赵强', '人事部', 5000.00, '2022-01-05')`
*5. `(1005, '陈静', '研发部', 9999.00, '2023-07-30')`
*/
INSERT INTO employee_salary
    VALUES
        (1001, '张明', '研发部', 4500.00, '2020-03-15'),  -- :保存在p_low分区
        (1002, '李华', '市场部', 8000.00, '2021-05-20'),  -- :保存在p_mid分区
        (1003, '王芳', '财务部', 12000.00, '2019-08-10'),  -- :保存在p_high分区
        (1004, '赵强', '人事部', 5000.00, '2022-01-05'),  -- :保存在p_mid分区
        (1005, '陈静', '研发部', 9999.00, '2023-07-30')  -- :保存在p_mid分区
;
-- :二、哈希分区（Hash Partitioning）
/*
todo练习题 3：创建哈希分区表
*需求：创建一个产品库存表`product_inventory`，按产品 ID`product_id`进行哈希分区，分为 3 个分区（`p_hash_a`、`p_hash_b`、`p_hash_c`）。
*表结构：`inventory_id INT PRIMARY KEY, product_id INT, warehouse_id INT, quantity INT, last_update DATETIME`
*/
DROP TABLE IF EXISTS product_inventory;
CREATE TABLE product_inventory (
    inventory_id INT PRIMARY KEY,
    product_id INT,
    warehouse_id INT,
    quantity INT,
    last_update DATE
) PARTITION BY HASH (product_id) (
    PARTITION p_hash_a,
    PARTITION p_hash_b,
    PARTITION p_hash_c
);
/* 
todo练习题 4：插入数据到哈希分区表
*需求：向`product_inventory`表插入以下数据，说明高斯数据库如何分配这些数据到不同分区：
*1. `(501, 10001, 1, 500, '2023-10-01 10:00:00')`
*2. `(502, 10002, 2, 300, '2023-10-01 11:30:00')`
*3. `(503, 10003, 1, 200, '2023-10-01 14:15:00')`
*4. `(504, 10004, 3, 800, '2023-10-01 16:40:00')`
*5. `(505, 10005, 2, 150, '2023-10-01 18:20:00')`
*/
INSERT INTO product_inventory
    VALUES  -- :数据库通过对product_id进行哈希运算并对3取模，根据模的值判断存入的分区
        (501, 10001, 1, 500, '2023-10-01 10:00:00'),
        (502, 10002, 2, 300, '2023-10-01 11:30:00'),
        (503, 10003, 1, 200, '2023-10-01 14:15:00'),
        (504, 10004, 3, 800, '2023-10-01 16:40:00'),
        (505, 10005, 2, 150, '2023-10-01 18:20:00')
;
-- :三、复合分区（Composite Partitioning）
/*
todo练习题 5：创建复合分区表
*需求：创建一个订单明细表`order_detail`，
*先按订单日期`order_date`进行范围分区（季度分区），
*再在每个季度分区内按产品类别`product_type`进行列表分区（' 数码产品 '、' 服装 '、' 其他 '）。
*分区规则：
*- 范围分区：2023Q1（≤2023-03-31）、2023Q2（≤2023-06-30）、2023Q3（≤2023-09-30）
*- 列表子分区：`p_digital`（数码产品）、`p_clothing`（服装）、`p_other`（其他）
*表结构：`detail_id INT PRIMARY KEY, order_id INT, product_id INT, product_type VARCHAR(30), order_date DATE, price DECIMAL(10,2), quantity INT`
*/
DROP TABLE IF EXISTS order_detail;
CREATE TABLE order_detail (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    product_type VARCHAR(30),
    order_date DATE,
    price DECIMAL(10,2),
    quantity INT
) PARTITION BY RANGE (order_date)
SUBPARTITION BY LIST (product_type) (
    PARTITION Y2023Q1 VALUES LESS THAN ('2023-04-01') (
        SUBPARTITION Y2023Q1_digital VALUES ('数码产品'),
        SUBPARTITION Y2023Q1_clothing VALUES ('服装'),
        SUBPARTITION Y2023Q1_other VALUES ('其他')
    ),
    PARTITION Y2023Q2 VALUES LESS THAN ('2023-07-01') (
        SUBPARTITION Y2023Q2_digital VALUES ('数码产品'),
        SUBPARTITION Y2023Q2_clothing VALUES ('服装'),
        SUBPARTITION Y2023Q2_other VALUES ('其他')
    ),
    PARTITION Y2023Q3 VALUES LESS THAN ('2023-10-01') (
        SUBPARTITION Y2023Q3_digital VALUES ('数码产品'),
        SUBPARTITION Y2023Q3_clothing VALUES ('服装'),
        SUBPARTITION Y2023Q3_other VALUES ('其他')
    ),
    PARTITION others VALUES LESS THAN (MAXVALUE) (
        SUBPARTITION others_digital VALUES ('数码产品'),
        SUBPARTITION others_clothing VALUES ('服装'),
        SUBPARTITION others_other VALUES ('其他')
    )
);
/*
todo练习题 6：插入数据到复合分区表
*需求：向`order_detail`表插入以下数据，说明每条数据对应的范围分区和列表子分区：
*1. `(601, 2001, 301, '数码产品', '2023-01-15', 3999.00, 1)`
*2. `(602, 2002, 302, '服装', '2023-04-20', 599.00, 2)`
*3. `(603, 2003, 303, '其他', '2023-07-05', 199.00, 5)`
*4. `(604, 2004, 304, '数码产品', '2023-06-30', 2499.00, 1)`
*5. `(605, 2005, 305, '服装', '2023-03-10', 899.00, 1)`
*/
INSERT INTO order_detail
    VALUES
        (601, 2001, 301, '数码产品', '2023-01-15', 3999.00, 1),  -- :保存在Y2023Q1分区下的Y2023Q1_digital分区
        (602, 2002, 302, '服装', '2023-04-20', 599.00, 2),  -- :保存在Y2023Q2分区下的Y2023Q2_clothing分区
        (603, 2003, 303, '其他', '2023-07-05', 199.00, 5),  -- :保存在Y2023Q3分区下的Y2023Q3_other分区
        (604, 2004, 304, '数码产品', '2023-06-30', 2499.00, 1),  -- :保存在Y2023Q2分区下的Y2023Q2_digital分区
        (605, 2005, 305, '服装', '2023-03-10', 899.00, 1)  -- :保存在Y2023Q1分区下的Y2023Q1_clothing分区
;
-- :四、列表分区（List Partitioning）
/*
todo练习题 7：创建列表分区表
*需求：创建一个订单状态表`order_status`，按订单状态`status`进行列表分区，规则如下：
*- 状态为 ' 待支付 '、' 支付中 ' 的存放在`p_paying`分区
*- 状态为 ' 已支付 '、' 已发货 ' 的存放在`p_processed`分区
*- 状态为 ' 已取消 '、' 已退款 ' 的存放在`p_canceled`分区
*表结构：`status_id INT PRIMARY KEY, order_id INT, status VARCHAR(20), update_time DATETIME, remark VARCHAR(100)`
*/
DROP TABLE IF EXISTS order_status;
CREATE TABLE order_status (
    status_id INT PRIMARY KEY,
    order_id INT,
    status VARCHAR(20),
    update_time DATE,
    remark VARCHAR(100)
) PARTITION BY LIST (status) (
    PARTITION p_paying VALUES ('待支付', '支付中'),
    PARTITION p_processed VALUES ('已支付', '已发货'),
    PARTITION p_canceled VALUES ('已取消', '已退款')
);
/*
todo练习题 8：插入数据到列表分区表
*需求：向`order_status`表插入以下数据，说明每条数据会存入哪个分区：
*1. `(701, 2001, '待支付', '2023-10-01 09:00:00', '新订单')`
*2. `(702, 2002, '已支付', '2023-10-01 10:15:00', '微信支付')`
*3. `(703, 2003, '已取消', '2023-10-01 11:30:00', '用户取消')`
*4. `(704, 2004, '已发货', '2023-10-01 14:20:00', '顺丰快递')`
*5. `(705, 2005, '已退款', '2023-10-01 16:45:00', '质量问题')`
*/
INSERT INTO order_status
    VALUES
        (701, 2001, '待支付', '2023-10-01 09:00:00', '新订单'),  -- :保存在p_paying分区中
        (702, 2002, '已支付', '2023-10-01 10:15:00', '微信支付'),  -- :保存在p_processed分区中
        (703, 2003, '已取消', '2023-10-01 11:30:00', '用户取消'),  -- :保存在p_canceled分区中
        (704, 2004, '已发货', '2023-10-01 14:20:00', '顺丰快递'),  -- :保存在p_processed分区中
        (705, 2005, '已退款', '2023-10-01 16:45:00', '质量问题')  -- :保存在p_canceled分区中
;
-- :五、综合练习
/*
todo练习题 9：创建自定义分区表
*需求：为 " 网站访问日志表`website_log`" 选择合适的分区类型并创建分区表，说明选择理由。
*表结构：`log_id BIGINT PRIMARY KEY, user_ip VARCHAR(20), page_url VARCHAR(255), visit_time DATE, stay_seconds INT`
*/
DROP TABLE IF EXISTS website_log;
CREATE TABLE website_log (
    log_id BIGINT PRIMARY KEY,
    user_ip VARCHAR(20),
    page_url VARCHAR(255),
    visit_time DATE,
    stay_seconds INT
) PARTITION BY RANGE (visit_time) (  -- :选择按照访问网站日期进行分组 
    PARTITION p_2025Q1 VALUES LESS THAN ('2025-04-01'),
    PARTITION p_2025Q2 VALUES LESS THAN ('2025-07-01'),
    PARTITION p_2025Q3 VALUES LESS THAN ('2025-10-01'),
    PARTITION p_2025Q4 VALUES LESS THAN ('2026-01-01')
);
/*
todo练习题 10：插入数据并验证分区
*需求：向练习题 9 创建的`website_log`表插入 5 条数据，然后编写 SQL 查询验证每条数据所在的分区。
*/
INSERT INTO website_log
    values
        (901, '186.125.25.10', 'https://guoke.com/', '2025-02-15 09:00:00', 163),
        (902, '192.25.125.130', 'https://www.qq.com/', '2025-06-05 10:15:00', 250),
        (903, '183.168.63.14', 'https://github.com/', '2025-04-06 11:30:00', 326),
        (904, '192.168.137.1', 'https://xiaoce.fun/daily', '2025-07-10 14:20:00', 65),
        (905, '192.168.10.130', 'https://liaoxuefeng.com/index.html?src=redirect', '2025-06-10 16:45:00', 157)
;
-- todo1. 查询需求：从按order_date范围分区的order_detail表中，查询2023年第二季度（4-6月）price与quantity的乘积大于1000的订单。
SELECT * 
FROM order_detail 
WHERE order_date BETWEEN '2023-04-01' AND '2023-06-30'  -- !未使用范围分区特性，仍旧从全表中搜索符合指定条件的数据
  AND (price * quantity) > 1000
;
SELECT *
FROM order_detail PARTITION (Y2023Q2)  -- :直接指定从order_detail表的(Y2023Q2)分区中查找
WHERE (price * quantity) > 1000;
-- todo2. 查询需求：从按product_id哈希分区的product_inventory表中，查询product_id为10003的所有记录。
-- ~题目出得有问题
SELECT * 
FROM product_inventory 
WHERE product_id = 10003;
-- todo3. 查询需求：从复合分区表order_detail（先按order_date范围分区，再按product_type列表分区）中，
-- todo查询2023年product_type为'数码产品'的销售记录，且quantity大于5。
-- ~题目出得有问题，2023年无法使用范围分区
SELECT * 
FROM order_detail 
WHERE to_char(order_date, 'yyyy') = '2023'  -- !无法使用范围分区特性
  AND product_type = '数码产品'
  AND quantity > 5
;
-- todo4. 查询需求：从按status列表分区的order_status表中，查询status为'已支付'且remark中包含'微信'的订单状态信息。
SELECT * 
FROM order_status PARTITION (p_processed)
WHERE remark LIKE '%微信%';
-- todo5. 查询需求：从范围分区表employee_salary（按salary分区）中，查询dept为研发部、hire_date在2021年且salary在8000-9000的员工。
SELECT *
FROM employee_salary PARTITION (p_mid)  -- :使用分区缩小进行查询的数据范围
WHERE dept = '研发部'
  AND to_char(hire_date, 'yyyy') = '2021'
  AND salary BETWEEN 8000 AND 9000  -- :p_mid范围为5000-10000，所以要额外设定过滤条件
;