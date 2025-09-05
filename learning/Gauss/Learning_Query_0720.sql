-- Active: 1752845857763@@192.168.10.130@5432@gaussdb_learning@public
--* 产品表
CREATE TABLE loan_product (
    product_id INT PRIMARY KEY,  -- 产品ID
    product_name VARCHAR(50) NOT NULL,  -- 产品名称（如“个人消费贷”）
    min_amount NUMERIC(15,2),  -- 最低贷款金额
    max_amount NUMERIC(15,2),  -- 最高贷款金额
    interest_type VARCHAR(20) CHECK (interest_type IN('固定利率', '浮动利率')),  -- 利率类型
    base_rate NUMERIC(5,2),  -- 基准利率（如5.00表示5%）
    term_range VARCHAR(50),  -- 贷款期限范围（如“12-60个月”）
    description TEXT  -- 产品描述
);
INSERT INTO loan_product
        (product_id, product_name, min_amount, max_amount, interest_type, base_rate, term_range)
    VALUES
        (1, '个人消费贷', 10000.00, 500000.00, '固定利率', 4.35, '12-60个月'),
        (2, '企业经营贷', 500000.00, 5000000.00, '浮动利率', 5.50, '24-120个月'),
        (3, '车贷', 50000.00, 300000.00, '固定利率', 6.00, '12-36个月')
;
--* 客户表
CREATE TABLE customer (
    customer_id VARCHAR(20) PRIMARY KEY,  -- 客户ID（如身份证号）
    customer_name VARCHAR(50) NOT NULL,  -- 客户姓名
    mobile VARCHAR(15),  -- 手机号
    id_card VARCHAR(20) NOT NULL UNIQUE,  -- 身份证号（唯一约束）
    address VARCHAR(200),  -- 联系地址
    credit_score INT CHECK (credit_score BETWEEN 0 AND 100),  -- 信用评分
    create_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- 创建时间
);
INSERT INTO customer
        (customer_id, customer_name, mobile, id_card, address, credit_score)
    VALUES
        ('330102200001011234', '张三', '13800001111', '330102200001011234', '杭州市西湖区', 85),
        ('330103199002022345', '李四', '13900002222', '330103199002022345', '上海市浦东新区', 45),
        ('330104198503033456', '王五', '13700003333', '330104198503033456', '北京市海淀区', 92),
        ('330105197712044567', '赵六', '13600004444', '330105197712044567', '广州市天河区', 30)
;
--* 申请表
CREATE TABLE loan_application (
    application_id SERIAL PRIMARY KEY,  -- 申请编号（自增）
    customer_id VARCHAR(20) REFERENCES customer(customer_id),  -- 客户ID
    product_id INT REFERENCES loan_product(product_id),  -- 产品ID
    apply_amount NUMERIC(15,2) NOT NULL,  -- 申请金额
    apply_term INT NOT NULL,  -- 申请期限（月）
    apply_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 申请时间
    status VARCHAR(20) CHECK (status IN ('待审核', '已通过', '已拒绝')),  -- 申请状态
    remark TEXT  -- 审核备注
);
INSERT INTO loan_application  -- 张三申请个人消费贷（已通过）
        (customer_id, product_id, apply_amount, apply_term, status, remark)
    VALUES
        ('330102200001011234', 1, 200000.00, 24, '已通过', '客户信用评分高，收入稳定')
;
INSERT INTO loan_application  -- 李四申请企业经营贷（已拒绝）
        (customer_id, product_id, apply_amount, apply_term, status, remark)
    VALUES
        ('330103199002022345', 2, 1000000.00, 36, '已拒绝', '信用评分不足，无抵押物')
;
INSERT INTO loan_application  -- 王五申请车贷（待审核）
        (customer_id, product_id, apply_amount, apply_term, status)
    VALUES
        ('330104198503033456', 3, 150000.00, 24, '待审核')
;
INSERT INTO loan_application -- 赵六申请个人消费贷（已通过）
        (customer_id, product_id, apply_amount, apply_term, status, remark)
    VALUES
        ('330105197712044567', 1, 50000.00, 12, '已通过', '小额贷款，风险可控')
;
--* 放款表
CREATE TABLE loan_disbursement (
    loan_id SERIAL PRIMARY KEY,  -- 贷款编号（自增）
    application_id INT REFERENCES loan_application(application_id),  -- 申请编号
    disbursed_amount NUMERIC(15,2) NOT NULL,  -- 实际放款金额
    interest_rate NUMERIC(5,2) NOT NULL,  -- 实际执行利率
    start_date DATE NOT NULL,  -- 贷款起始日
    end_date DATE NOT NULL,  -- 贷款到期日
    repayment_method VARCHAR(20) CHECK (repayment_method IN ('等额本息', '等额本金', '一次性还本付息'))  -- 还款方式
);
INSERT INTO loan_disbursement  -- 张三的贷款放款（关联申请ID=1）
        (application_id, disbursed_amount, interest_rate, start_date, end_date, repayment_method)
    VALUES
        (1, 200000.00, 4.35, '2023-01-01', '2025-01-01', '等额本息')
;
INSERT INTO loan_disbursement  -- 赵六的贷款放款（关联申请ID=4）
        (application_id, disbursed_amount, interest_rate, start_date, end_date, repayment_method)
    VALUES
        (4, 50000.00, 4.35, '2023-03-15', '2024-03-15', '等额本金')
;
--* 还款表
CREATE TABLE repayment_schedule (
    schedule_id SERIAL PRIMARY KEY,  -- 还款计划ID（自增）
    loan_id INT REFERENCES loan_disbursement(loan_id),  -- 贷款编号
    due_date DATE NOT NULL,  -- 应还款日
    due_amount NUMERIC(15,2) NOT NULL,  -- 应还金额（本金+利息）
    paid_amount NUMERIC(15,2) DEFAULT 0,  -- 已还金额
    paid_date DATE,  -- 实际还款日
    status VARCHAR(20) CHECK (status IN ('未到期', '已结清', '逾期'))  -- 还款状态
);
--* 张三的还款计划（贷款ID=1，24期等额本息）
DO $$
DECLARE
    v_due_date DATE := '2023-02-01';  -- 首期还款日
    v_monthly_payment NUMERIC := 8774.32;  -- 等额本息月供（假设值）
BEGIN
    FOR i IN 1..24 LOOP
        INSERT INTO repayment_schedule (loan_id, due_date, due_amount, status)
        VALUES (1, v_due_date, v_monthly_payment, 
                CASE WHEN i <= 12 THEN '已结清' ELSE '未到期' END);
        v_due_date := v_due_date + INTERVAL '1 month';
    END LOOP;
END $$;
--* 赵六的还款计划（贷款ID=2，12期等额本金）
DO $$
DECLARE
    v_due_date DATE := '2023-04-15';  -- 首期还款日
    v_principal NUMERIC := 4166.67;   -- 每月本金（50000/12）
    v_interest NUMERIC := 50000 * 0.0435 / 12;  -- 首月利息
BEGIN
    FOR i IN 1..12 LOOP
        INSERT INTO repayment_schedule (loan_id, due_date, due_amount, status)
        VALUES (2, v_due_date, v_principal + v_interest, 
                CASE WHEN i <= 3 THEN '逾期' ELSE '未到期' END);
        v_due_date := v_due_date + INTERVAL '1 month';
        v_interest := (50000 - (i-1)*v_principal) * 0.0435 / 12;  -- 剩余本金计算利息
    END LOOP;
END $$;
--* 逾期记录表
CREATE TABLE overdue_record (
    record_id SERIAL PRIMARY KEY, -- 逾期记录ID
    loan_id INT REFERENCES loan_disbursement(loan_id),  -- 贷款编号
    overdue_days INT NOT NULL,  -- 逾期天数
    overdue_amount NUMERIC(15,2) NOT NULL,  -- 逾期金额（含罚息）
    penalty_rate NUMERIC(5,2),  -- 罚息利率
    resolved BOOLEAN DEFAULT FALSE  -- 是否已处理
);
INSERT INTO overdue_record  -- 赵六的逾期记录（贷款ID=2，前3期逾期）
        (loan_id, overdue_days, overdue_amount, penalty_rate, resolved)
    VALUES 
        (2, 15, 4500.00, 0.05, FALSE),  -- 第1期逾期
        (2, 30, 4300.00, 0.05, FALSE),  -- 第2期逾期
        (2, 45, 4100.00, 0.05, TRUE)   -- 第3期逾期（已处理）
;
--// 数据准备
CREATE TABLE emp(
       empno    INT,     -- 员工编号
       ename    VARCHAR(22),   -- 员工姓名
       job      VARCHAR(22),   -- 工作岗位
       mgr      INT,         -- 上级领导编号
       hiredate DATE,           -- 入职日期
       sal      DECIMAL(11,2),   -- 员工工资
       comm     DECIMAL(11,2),   -- 佣金
       deptno   INT         -- 对应部门编号
);
--// 添加数据
INSERT INTO emp 
    VALUES
        (7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20),
        (7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30),
        (7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30),
        (7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20),
        (7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30),
        (7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30),
        (7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10),
        (7788,'SCOTT','ANALYST',7566,to_date('19-4-1987','dd-mm-yyyy'),3000,NULL,20),
        (7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10),
        (7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30),
        (7876,'ADAMS','CLERK',7788,to_date('23-5-1987','dd-mm-yyyy'),1100,NULL,20),
        (7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30),
        (7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20),
        (7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10)
;
--// 创建表
create table dept (
      deptno INT,
    dname  varchar(22),
    loc    varchar(22)
);
--// 添加数据
INSERT INTO dept
        (deptno, dname, loc)
    VALUES
        (10, 'ACCOUNTING', 'NEW YORK'),
        (20, 'RESEARCE', 'DAKKAS'),
        (30, 'SALES', 'CHICAGO'),
        (40, 'OPERATIONS', 'BOSTON')
;
--// 添加数据
create table salgrade(
    grade  INT,
    losal  DECIMAL(11,2),
    hisal  DECIMAL(11,2)
);
--// 添加数据
INSERT INTO salgrade
        (grade, losal, hisal)
    VALUES
        (1, 700, 1200),
        (2, 1201, 1400),
        (3, 1401, 2000),
        (4, 2001, 3000),
        (5, 3001, 9999)
;