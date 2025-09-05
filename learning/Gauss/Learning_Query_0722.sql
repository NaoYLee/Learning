-- Active: 1752845857763@@192.168.10.130@5432
-- IDE：Visual Studio Code,EXTENSIONS: 1.cweijan.vscode-postgresql-client2 2.aaron-bond.better-comments
DO $$
BEGIN
    UPDATE users
    SET user_age = user_age + 10;
    RAISE NOTICE '共有%条数据', sql%ROWCOUNT;
END $$;
DO $$
DECLARE
    CURSOR cur_customer IS SELECT * FROM customer;  -- :定义游标 cur_customers ，内容为 SELECT * FROM customer 。
    v_customer customer %rowtype;  -- :声明变量 v_customer 为 customer 表中字段类型。
BEGIN
    OPEN cur_customer;  -- :开启游标
    FETCH cur_customer INTO v_customer;  -- :抓取数据注入游标
    RAISE NOTICE '%', v_customer.customer_name;  -- :输出游标
    FETCH cur_customer INTO v_customer;  -- :抓取下一条数据注入游标
    RAISE NOTICE '%', v_customer.customer_name;  -- :输出游标
    CLOSE cur_customer;  -- :关闭游标
END $$;
DO $$
DECLARE
    CURSOR cur_customer IS SELECT * FROM customer;  -- :定义游标 cur_customer，内容为 SELECT * FROM customer 。
    v_customer customer %rowtype;  -- !使用游标时记得定义 %rowtype 类型
BEGIN
    OPEN cur_customer;  -- :开启游标
    LOOP  -- :循环
        FETCH cur_customer INTO v_customer;  -- :抓取数据注入游标
        EXIT WHEN cur_customer%NOTFOUND;  -- :游标为最后一行时退出循环
        RAISE NOTICE '1.%的信用积分为%', v_customer.customer_name, v_customer.credit_score;  -- :输出游标
    END LOOP;  -- :循环结束
    CLOSE cur_customer;  -- :关闭游标
-- :以下为使用FOR循环，不需要手动开启游标
    FOR v_customer IN cur_customer
    LOOP
        RAISE NOTICE '2.%的信用积分为%', v_customer.customer_name, v_customer.credit_score;  -- :输出游标
    END LOOP;
-- :FOR循环示例结束
END $$;
DO $$
DECLARE  -- :不显式定义游标时的写法
    v_customer customer %rowtype;
BEGIN
    FOR v_customer IN (SELECT * FROM customer)  -- :使用 FOR 语句时游标会自动开启
    LOOP
        RAISE NOTICE '%的信用积分为%', v_customer.customer_name, v_customer.credit_score;  -- :输出游标
    END LOOP;
END $$;
DO $$
DECLARE
    v_ename emp.ename %type;
BEGIN
    RAISE NOTICE '执行前 ROWCOUNT 的值为%', sql%rowcount;
    RAISE NOTICE '执行前 FOUND 的值为%', sql%found;
    SELECT emp.ename
    INTO v_ename
    FROM emp
    WHERE empno = 7788;
    RAISE NOTICE '执行后 ROWCOUNT 的值为%', sql%rowcount;
    RAISE NOTICE '执行后 FOUND 的值为%', sql%found;
END $$;
DO $$  -- :动态游标使用示例
DECLARE
    TYPE ref_cur_type IS REF CURSOR;  -- :声明动态游标类型
    cur_type ref_cur_type;  -- :声明动态游标
    v_dept dept %rowtype;  -- :游标搭配 %rowtype 数据类型使用，下同
    v_emp emp %rowtype;  -- :同上
BEGIN
    OPEN cur_type FOR  -- :开启游标
        SELECT * FROM dept;  -- :声明游标SQL语句
    LOOP
        FETCH cur_type INTO v_dept;
        EXIT WHEN cur_type%NOTFOUND;
        RAISE NOTICE '%', v_dept;
    END LOOP;
    CLOSE cur_type;
    OPEN cur_type FOR
        SELECT * FROM emp WHERE deptno = 30;
    FETCH cur_type INTO v_emp;  -- !使用WHILE循环时必须先FETCH游标，否则无法满足循环条件
    WHILE cur_type%FOUND  -- :使用WHILE循环
    LOOP
        RAISE NOTICE '%', v_emp;
        FETCH cur_type INTO v_emp; 
    END LOOP;
    CLOSE cur_type;
END $$;
CREATE OR REPLACE PROCEDURE proc_emp  -- !DDL不能写进DO$$..$$块中!
AS
DECLARE
    v_ename emp.ename %TYPE;
    v_sal emp.sal %TYPE;
BEGIN
    SELECT ename, sal
    INTO   v_ename, v_sal
    FROM   emp
    WHERE  empno = 7788;
    RAISE NOTICE '%,%',v_ename, v_sal;
EXCEPTION
    WHEN others THEN
    RAISE NOTICE '出现异常';
    RAISE NOTICE '%',SQLCODE;
    RAISE NOTICE '%',SQLERRM;
END;
DO $$
BEGIN
  proc_emp;
END $$;