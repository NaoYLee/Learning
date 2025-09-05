-- Active: 1752845857763@@192.168.10.130@5432@gaussdb_learning@public
DECLARE
v_name VARCHAR2(10);
v_mobile customer.mobile %type;
BEGIN
    SELECT
        customer.customer_name,
        customer.mobile
    INTO
        v_name,
        v_mobile
    FROM customer
    WHERE customer.customer_id = '330102200001011234';
    RAISE NOTICE '姓名: %, 联系方式: %', v_name, v_mobile;
END;
DECLARE
    v_customer customer %rowtype;
BEGIN
    SELECT *
    INTO v_customer
    FROM customer
    WHERE customer_id = '330102200001011234';
    RAISE NOTICE '客户姓名：%， 客户联系方式：%， 客户住址：%',
    v_customer.customer_name, v_customer.mobile, v_customer.address;
END;
DECLARE
    TYPE info_record IS record (
        customer_id customer.customer_id %type,
        customer_name customer.customer_name %type,
        mobile customer.mobile %type,
        application_id loan_application.application_id %type,
        apply_amount loan_application.apply_amount %type,
        apply_time loan_application.apply_time %type,
        status loan_application.status %type
    );
    v_info_record info_record;
BEGIN
    SELECT
        c.customer_id,
        c.customer_name,
        c.mobile,
        la.application_id,
        la.apply_amount,
        la.apply_time,
        la.status
    INTO v_info_record
    FROM customer c
    JOIN loan_application la ON c.customer_id = la.customer_id
    WHERE la.application_id = '2';
    RAISE NOTICE '客户编号：%', v_info_record.customer_id;
    RAISE NOTICE '客户姓名：%', v_info_record.customer_name;
    RAISE NOTICE '客户联系方式：%', v_info_record.mobile;
    RAISE NOTICE '申请编号：%', v_info_record.application_id;
    RAISE NOTICE '申请数额：%', v_info_record.apply_amount;
    RAISE NOTICE '申请时间：%', v_info_record.apply_time;
    RAISE NOTICE '审批状态：%', v_info_record.status;
END;
--// 数据准备
CREATE TABLE emp(
       empno INT,  -- 员工编号
       ename VARCHAR(22),  -- 员工姓名
       job VARCHAR(22),  -- 工作岗位
       mgr INT,  -- 上级领导编号
       hiredate DATE,  -- 入职日期
       sal DECIMAL(11,2),  -- 员工工资
       comm DECIMAL(11,2),  -- 佣金
       deptno INT  -- 对应部门编号
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
--// 创建表 dept
create table dept (
    deptno INT,
    dname varchar(22),
    loc varchar(22)
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
create table salgrade(
    grade INT,
    losal DECIMAL(11,2),
    hisal DECIMAL(11,2)
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
--* 随便输入一个年份，判断是否是闰年;使用 mod()函数
DECLARE
    v_year INT := 2025;
    v_tf VARCHAR2(6);
BEGIN
    IF MOD(v_year, 4) = 0
    THEN
        IF MOD(v_year, 100) = 0
        THEN
            IF MOD(v_year, 400) = 0
            THEN
                v_tf := '是';
            ELSE
                v_tf := '不是';
            END IF;
        ELSE
            v_tf := '是';
        END IF;
    ELSE
        v_tf := '不是';
    END IF;
    RAISE NOTICE '%年%闰年', v_year, v_tf;
END;
/*
*请用户输入一个星期，然后输出应该吃的菜名
*星期一，酸辣土豆丝
*星期二，水煮肉片
*星期三，麻婆豆腐
*星期四，辣子鸡丁
*星期五，小炒肉
*周末，喝汤todo
*/
DECLARE
    v_weekday INT := 2;
    v_food text;
BEGIN
    CASE 
        WHEN v_weekday = 1 THEN v_food := '吃酸辣土豆丝';
        WHEN v_weekday = 2 THEN v_food := '吃水煮肉片';
        WHEN v_weekday = 3 THEN v_food := '吃麻婆豆腐';
        WHEN v_weekday = 4 THEN v_food := '吃辣子鸡丁';
        WHEN v_weekday = 5 THEN v_food := '吃小炒肉';
        WHEN v_weekday = 6 OR v_weekday = 7 THEN v_food := '喝汤';
    END CASE;
    RAISE NOTICE '%', v_food;
END;
DECLARE
    v_a int := 1;
    v_b int;
    v_c int;
BEGIN
    WHILE v_a <= 9 LOOP
        v_b := 0;
        WHILE v_b <= 9 LOOP
            v_c := 0;
            WHILE v_c <= 9 LOOP
                IF
                    v_a*v_a*v_a+v_b*v_b*v_b+v_c*v_c*v_c=v_a*100+v_b*10+v_c
                THEN
                    RAISE NOTICE '水仙花数：%', v_a*100+v_b*10+v_c;
                END IF;
                v_c := v_c + 1;
            END LOOP;
            v_b := v_b + 1;
        END LOOP;
        v_a := v_a + 1;
    END LOOP;
END;