-- Active: 1752845857763@@192.168.178.130@5432@credit_dw@dwd
CREATE DATABASE loan_project;
CREATE DATABASE GaussDB_DW;
SELECT *
FROM region
WHERE region.region_name = '陕西省';
CREATE TABLESPACE ts_credit 
OWNER gaussdb -- 表空间所有者
RELATIVE LOCATION 'tablespace/ts_credit';
create database credit_dw
encoding 'utf8'         -- 字符编码
dbcompatibility 'A'     -- 兼容Oracle数据库
tablespace  ts_credit;  -- 使用的表空间
CREATE TABLE dwd.DWD_DIM_REGION (
    REGION_ID           NUMBER          -- 区域的唯一标识
    ,REGION_NAME        VARCHAR2(50)    -- 区域名字
    ,PARENT_ID          NUMBER          -- 归属区域ID
    ,ETL_CREATE_TIME    DATE            -- 数据入库时间
    ,ETL_UPDATE_TIME    DATE            -- 数据更新时间
);
CREATE TABLE public.public_dim_region(
    REGION_ID           NUMBER          -- 区域的唯一标识
    ,REGION_NAME        VARCHAR2(50)    -- 区域名字
    ,PARENT_ID          NUMBER          -- 归属区域ID
    ,ETL_CREATE_TIME    DATE            -- 数据入库时间
    ,ETL_UPDATE_TIME    DATE            -- 数据更新时间
);
-- 客户事实表
CREATE TABLE DWD_FACT_CUSTOMERS (
    CUSTOMER_ID         NUMBER          -- 客户的唯一标识
    ,CUSTOMER_NAME      VARCHAR2(50)    -- 客户的姓名
    ,AGE                NUMBER         -- 客户的年龄
    ,GENDER             CHAR(1)         -- 客户的性别，M 表示男性，F 表示女性
    ,CONTACT_NUMBER     VARCHAR2(15)    -- 客户的联系电话
    ,REGION_ID           NUMBER           -- 区域id
    ,ADDRESS            VARCHAR2(100)   -- 客户的居住地址
    ,INCOME             NUMBER          -- 客户的收入
    ,CREDIT_SCORE       NUMBER          -- 客户的信用评分
    ,ETL_CREATE_TIME    DATE             -- 数据生成时间
    ,IS_DELETE           TINYINT          -- 逻辑删除[0:删除、1:正常]
)PARTITION BY HASH (CUSTOMER_NAME)(
    PARTITION p1,  -- 分区1
    PARTITION p2,  -- 分区2
    PARTITION p3,  -- 分区3
    PARTITION p4   -- 分区4
);
CREATE INDEX idx_customer_name ON 
DWD_FACT_CUSTOMERS (CUSTOMER_NAME) LOCAL;
CREATE TABLE dwd.DWD_FACT_RISK_EVALUATIONS (
    EVALUATION_ID       NUMBER          -- 风险评估的唯一标识
    ,CUSTOMER_ID        NUMBER          -- 被评估的客户标识
    ,EVALUATION_DATE    DATE            -- 风险评估的日期
    ,RISK_LEVEL         VARCHAR2(20)    -- 客户的风险等级，如 Low、Medium、High 等
    ,RISK_COMMENT       VARCHAR2(200)   -- 风险评估的意见
    ,ETL_CREATE_TIME    DATE            -- 数据入库时间
    ,IS_DELETE          TINYINT          -- 逻辑删除[0:删除、1:正常]
)PARTITION BY LIST (RISK_LEVEL) (
    partition p_low values ('Low'),
    partition p_medium values ('Medium'),
    partition p_high values ('High'),
    partition p_other values (default)
);
-- :创建DWS_CUSTOMER_PROFILE表
CREATE TABLE dws.DWS_CUSTOMER_PROFILE (
    CUSTOMER_ID         NUMBER         -- 客户唯一标识
    ,CUSTOMER_NAME      VARCHAR2(50)   -- 客户姓名
    ,AGE                NUMBER         -- 客户年龄
    ,GENDER             CHAR(3)        -- 性别（男/女）
    ,CREDIT_SCORE       NUMBER         -- 信用评分
    ,RISK_LEVEL         VARCHAR2(20)   -- 风险等级
    ,HIGH_POTENTIAL     VARCHAR2(20)   -- 高潜分类
    ,PROVINCE           VARCHAR(50)    -- 省份
    ,CITY               VARCHAR(50)    -- 城市
);
-- ?思考：以上数据表需要进行表分区吗？如果需要应该如何使用分区策略
CREATE TABLE dwd.dwd_customer_fact (
    customer_id DECIMAL PRIMARY KEY,
    customer_name VARCHAR(50) NOT NULL,
    customer_age INT CHECK (customer_age >=0 AND customer_age <= 120),
    customer_gender CHAR(1) CHECK (customer_gender IN ('M', 'F')),
    customer_income DECIMAL(15,2) CHECK (customer_income >= 0),
    customer_address VARCHAR(200),
    registration_date DATE
);
INSERT INTO dwd_customer_fact (
    customer_id,
    customer_name,
    customer_age,
    customer_gender,
    customer_income,
    customer_address,
    registration_date
) SELECT
    customer_id,
    initcap(trim(customer_name)) as customer_name,
    CASE WHEN age >=0 AND age <= 120 THEN age END as customer_age,
    CASE WHEN upper(gender) IN ('M','F') THEN upper(gender) END as customer_gender,
    CASE WHEN income >=0 THEN income END as customer_income,
    trim(address) as customer_address,
    to_char(etl_create_time, 'yyyy/mm/dd') as registration_date
FROM ods.ods_customers;