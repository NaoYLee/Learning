CREATE OR REPLACE PROCEDURE dynamic_employee_query (
    p_column_name IN varchar2,
    p_operator IN varchar2,
    p_value IN varchar2
)
IS
DECLARE
    column_name_not_exists EXCEPTION;
    TYPE ref_cur_emp IS REF CURSOR;
    cur_emp ref_cur_emp;
    v_sql varchar2;
    v_emp employees%rowtype;
BEGIN
    IF p_column_name NOT IN (
        'emp_id',
        'emp_name',
        'salary',
        'dept_id'
    ) THEN
        RAISE column_name_not_exists;
    END IF;
    
    v_sql := 'SELECT * FROM employees WHERE ' || p_column_name || ' ' || p_operator || ' :1';
    
    OPEN cur_emp FOR v_sql USING p_value;

    LOOP
        FETCH cur_emp INTO v_emp;
        EXIT WHEN cur_emp%NOTFOUND;
        RAISE NOTICE '员工ID%, 姓名%, 工资%, 部门ID%', v_emp.emp_id, v_emp.emp_name, v_emp.salary, v_emp.dept_id;
    END LOOP;

    CLOSE cur_emp;
EXCEPTION
    WHEN column_name_not_exists THEN
        RAISE NOTICE '错误：无效列名';
END;
CALL dynamic_employee_query('salary', '>', '7000');  -- :只有无输出的过程才能用`call`调用
BEGIN
    dynamic_employee_query('salary', '>', '7000');
END;