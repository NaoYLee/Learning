-- Active: 1752845857763@@192.168.10.130@5432@gaussdb_learning@public
-- IDE：Visual Studio Code EXTENSIONS: 1.cweijan.vscode-postgresql-client2 2.aaron-bond.better-comments
-- todo自定义一个比较两数大小的函数
CREATE OR REPLACE FUNCTION func_greater(
    input_a number,
    input_b number
) RETURN number
IS
DECLARE
    equal EXCEPTION;  -- :声明一个异常equal
BEGIN
    IF input_a = input_b
    THEN
        RAISE equal;  -- :当两数相等时抛出异常equal
    ELSEIF input_a > input_b
    THEN
        RAISE NOTICE '较大的数是：';
        RETURN input_a;
    ELSE
        RAISE NOTICE '较大的数是：';
        RETURN input_b;
    END IF;
EXCEPTION
    WHEN equal THEN  -- :当检查到equal异常时执行如下代码
    RAISE NOTICE '两数相等，都为';
    RETURN input_a;
END;
-- todo测试函数功能
BEGIN
    RAISE NOTICE '%',greater(10.9, 10.11);
END;
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