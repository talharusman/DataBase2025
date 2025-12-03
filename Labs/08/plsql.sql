set SERVEROUTPUT ON

DECLARE
    sec_name VARCHAR(20):='BAI-5a';
    cor_name varchar(20) := 'DBMS';
BEGIN
    DBMS_OUTPUT.PUT_LINE('wellcome sec:'||sec_name||'to the '||cor_name||' coures');
    
    
END;
/


DECLARE
    a INT := 10;
    b INT := 20;
    c INT;
    f real;
BEGIN

    c := a +b;
    DBMS_OUTPUT.PUT_LINE('value of c: '||c);
    f:= 70.0/20.0;
    DBMS_OUTPUT.PUT_LINE('value of f: '||f);

end;
/

-- global and local variables

DECLARE
 num1 int := 10;
 num2 int := 20;
 
BEGIN
    DBMS_OUTPUT.PUT_LINE('global Varibal:');
    DBMS_OUTPUT.PUT_LINE('num1: '||num1||'num2: '||num2);
    DECLARE
        n1 int :=2;
        n2 int :=3;
    BEGIN
        DBMS_OUTPUT.PUT_LINE('local Varibal:');
        DBMS_OUTPUT.PUT_LINE('n1: '||n1||'n1: '||n2);
    END;
END;
/


DECLARE 
    e_id EMPLOYEES.EMPLOYEE_ID%TYPE;
    f_name employees.first_name%TYPE;
    l_name employees.last_name%TYPE;
    d_name DEPARTMENTS.DEPARTMENT_NAME%type;
BEGIN
    SELECT employee_id,first_name,last_name,DEPARTMENT_NAME into e_id,f_name,l_name,d_name 
    from EMPLOYEES inner join DEPARTMENTS on EMPLOYEES.DEPARTMENT_ID = DEPARTMENTS.DEPARTMENT_ID
    and EMPLOYEES.EMPLOYEE_ID = 100;
    
    
    DBMS_OUTPUT.PUT_LINE('emp id: '||e_id||' emp_name: '||f_name||' '||l_name||' department name: '||d_name);
    
end;
/

--conditions
DECLARE
    marks number:=75;
BEGIN
    if marks >= 90 THEN
         DBMS_OUTPUT.PUT_LINE('Grade: A');
    elsif marks >= 80 then
         DBMS_OUTPUT.PUT_LINE('Grade: B');
    ELSIF marks >= 70 then
         DBMS_OUTPUT.PUT_LINE('Grade: c');
    ELSIF marks >= 60 then
         DBMS_OUTPUT.PUT_LINE('Grade: d');
    ELSE
         DBMS_OUTPUT.PUT_LINE('Grade: f');
         
    end if;
    
end;
/

-- swituc statments

DECLARE 
    e_id EMPLOYEES.EMPLOYEE_ID%TYPE:=100;
    e_sal employees.salary%TYPE;
    e_did employees.department_id%TYPE;
BEGIN
    select salary,department_id into e_sal,e_did from EMPLOYEES where employee_id = e_id;
    
    CASE e_did
        when 90 then
            UPDATE EMPLOYEES set salary = e_sal + 100 where employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('updated salary is: '||(e_sal + 100));
        when 50 then
            UPDATE EMPLOYEES set salary = e_sal + 200 where employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('updated salary is: '||(e_sal + 200));
        when 40 then
            UPDATE EMPLOYEES set salary = e_sal + 300 where employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('updated salary is: '||(e_sal + 300));
        else 
            DBMS_OUTPUT.PUT_LINE('no such dept found!:');
        end CASE;
        
end;
/


-- loop
declare 
begin
    for user_record in  (select first_name , salary , hire_date from employees where department_id = 80) loop
        dbms_output.put_line('user name is ' || user_record.first_name || ' salary is ' || user_record.salary
        || ' and hire date is ' || user_record.hire_date);
    end loop;
end;
/

select * from EMPLOYEES;


-- ---------------------  view -------------------------------------- 

CREATE VIEW simpel_view as (select * from EMPLOYEES);
--2
create VIEW emp_dept as (select e.first_name,e.salary,d.department_name from EMPLOYEES e join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID);
--3
-- How to Replace or Update a View

--CREATE OR REPLACE VIEW view_name AS
--SELECT ...

drop VIEW simpel_view;

---------------------------- functions ---------------------------

/*
Syntax
CREATE OR REPLACE FUNCTION function_name (parameters)
RETURN datatype
IS/AS
    -- local variables
BEGIN
    -- logic
    RETURN value;
END function_name;
*/

--simple function
CREATE OR REPLACE FUNCTION get_number
RETURN NUMBER
AS
BEGIN

    RETURN 10;
END;
/


-- calling the function
BEGIN 
    DBMS_OUTPUT.PUT_LINE(get_number);
end;
/

-- functino with paramiters
select * from EMPLOYEES;

CREATE OR REPLACE FUNCTION square_num (n NUMBER)
RETURN NUMBER
AS
BEGIN
    RETURN n * n;
END;
/

BEGIN
    DBMS_OUTPUT.PUT_LINE(square_num(3));
end;
/

CREATE or REPLACE FUNCTION GetSalary(e_id int)
RETURN number
as 
    sal NUMBER;
BEGIN 
    select salary into sal from EMPLOYEES where employee_id = e_id;
    return sal;
end;
/

select GetSalary(100) from dual;

select FIRST_NAME,GetSalary(employee_id) from EMPLOYEES;

CREATE OR REPLACE FUNCTION bonus_calc (salary NUMBER)
RETURN NUMBER
AS
    bonus NUMBER;
BEGIN
    IF salary > 5000 THEN
        bonus := salary * 0.20;
    ELSE
        bonus := salary * 0.10;
    END IF;

    RETURN bonus;
END;
/

DROP FUNCTION get_salary;

-- -------------------- trigers,procegers,curser -----------------------------

/*
----------------------------- Syntax of a Procedure ---------------------------------
CREATE OR REPLACE PROCEDURE procedure_name
(
    parameter1 [IN | OUT | IN OUT] datatype,
    parameter2 [IN | OUT | IN OUT] datatype
)
IS/AS
    -- variable declarations
BEGIN
    -- procedure logic
END procedure_name;
/

Calling a Procedure
BEGIN
    procedure_name(parameters);
END;
/

*/

-- Simple Procedure Example (No Parameters)
CREATE or REPLACE PROCEDURE greeting
as 
BEGIN 
    dbms_output.put_line('welcome to procedure');
end;
/

BEGIN
    GREETING;
end;
/

--Procedure With IN Parameter
CREATE or REPLACE PROCEDURE show_salary(e_id number)
as 
    e_salary number;
BEGIN
    select salary into e_salary from EMPLOYEES where employee_id = e_id;
    dbms_output.put_line('salary is: '||e_salary);
end;
/

BEGIN 
    SHOW_SALARY(100);
end;
/

--Procedure With OUT Parameter
CREATE or REPLACE PROCEDURE get_salary(e_id in NUMBER,e_sal out NUMBER)
as
BEGIN
    SELECT salary into e_sal from EMPLOYEES where employee_id = e_id;
end;
/
DECLARE
s NUMBER;
BEGIN 
    GET_SALARY(100,s);
    DBMS_OUTPUT.PUT_LINE('Salary is: '|| s);
end;
/

-- Procedure With IN OUT Parameter
CREATE or REPLACE PROCEDURE add_bonus(sal in out NUMBER)
as
BEGIN
    sal:= sal + 2000;
end;
/

DECLARE
 sala NUMBER:= 500;
BEGIN
    add_bonus(sala);
    DBMS_OUTPUT.PUT_LINE('after bonus salary is: '|| sala);
end;
/

-- Procedure Performing DML (INSERT, UPDATE, DELETE)
CREATE or REPLACE PROCEDURE update_salary(e_id NUMBER,amount NUMBER)
as
BEGIN
    UPDATE EMPLOYEES set salary = salary + amount WHERE employee_id = e_id;
end;
/
BEGIN    
    DBMS_OUTPUT.PUT_LINE('befor update:');
    SHOW_SALARY(100);

    update_salary(100, 200);
    DBMS_OUTPUT.PUT_LINE('after update:');
    SHOW_SALARY(100);
    
END;
/


--Error Handling in Procedures
CREATE or REPLACE PROCEDURE safe_salary(e_id NUMBER)
as
 e_sal NUMBER;
BEGIN
    SELECT salary into e_sal from EMPLOYEES WHERE employee_id = e_id;
    dbms_output.put_line('salary is: '|| e_sal);
EXCEPTION
    when no_data_found then
        DBMS_OUTPUT.PUT_LINE('no data found!');
    when OTHERS then
        DBMS_OUTPUT.PUT_LINE('unknown error accure!');

    
end;
/

BEGIN 
 SAFE_SALARY(1);
end;
/

--Dropping a Procedure
DROP PROCEDURE show_salary;

-- trigger example-----------
--Row-level BEFORE INSERT trigger example
CREATE or REPLACE TRIGGER check_sal
BEFORE INSERT on employees
for EACH ROW
    BEGIN
        if :new.salary <0 then
            raise_application_error(-20001,'salary can not be negitive!');
        end if;
end;
/

--Suppose we want to store old and new salaries in a log table.
--Step 1: Create log table
CREATE TABLE emp_salary_log(
    emp_id NUMBER,
    old_sal number,
    new_sal number,
    change_on date
);

--Step 2: Create Trigger
CREATE or REPLACE TRIGGER emp_salary_audit
after UPDATE of salary on employees
for EACH ROW    
    BEGIN
        INSERT into EMP_SALARY_LOG VALUES(
            :old.employee_id,
            :old.salary,
            :new.salary,
            sysdate
            );
end;
/

--Example: BEFORE DELETE Trigger (prevent deletion)
CREATE or REPLACE TRIGGER prevent_delete
BEFORE DELETE on employees
BEGIN 
    raise_application_error(-20002,'Deleting employees is not allowed!');
end;
/

--INSTEAD OF Trigger Example (For VIEW)
CREATE or REPLACE VIEW emp_view as
SELECT employee_id,first_name,salary from employees;

CREATE or REPLACE TRIGGER insert_view
INSTEAD of INSERT on emp_view
for EACH ROW
    BEGIN 
    INSERT into EMPLOYEES(employee_id,first_name,salary) VALUES(
        :new.employee_id,
        :new.first_name,
        :new.salary
    );
end;
/
            
            
CREATE OR REPLACE TRIGGER trg_first
AFTER UPDATE ON employees
FOR EACH ROW
BEGIN
    DBMS_OUTPUT.PUT_LINE('Trigger 1: Salary updated for employee ' || :NEW.employee_id);
END;
/

create or REPLACE TRIGGER trg_secend
after update on employees
for each row
FOLLOWS trg_first
    BEGIN 
    DBMS_OUTPUT.PUT_LINE('Trigger 2: New salary is ' || :NEW.salary);
end;
/

UPDATE employees
SET salary = salary + 100
WHERE employee_id = 100;

--

CREATE OR REPLACE TRIGGER superheroes_audit
BEFORE INSERT OR DELETE OR UPDATE ON superheroes
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR2(30);
    v_date VARCHAR2(30);
BEGIN
    -- USER is a reserved keyword, so we select USER FROM DUAL correctly
    SELECT USER, TO_CHAR(SYSDATE, 'DD/MON/YYYY HH24:MI:SS')
    INTO v_user, v_date
    FROM dual;

    IF INSERTING THEN
        INSERT INTO sh_audit (new_name, old_name, user_name, entry_date, operation)
        VALUES (:NEW.sh_name, NULL, v_user, v_date, 'Insert');

    ELSIF DELETING THEN
        INSERT INTO sh_audit (new_name, old_name, user_name, entry_date, operation)
        VALUES (NULL, :OLD.sh_name, v_user, v_date, 'Delete');

    ELSIF UPDATING THEN
        INSERT INTO sh_audit (new_name, old_name, user_name, entry_date, operation)
        VALUES (:NEW.sh_name, :OLD.sh_name, v_user, v_date, 'Update');
    END IF;
END;
/


--------------------------------
CREATE OR REPLACE TRIGGER hr_audit_tr
AFTER DDL ON SCHEMA
BEGIN
    INSERT INTO schema_audit
    VALUES (
        sysdate,
        sys_context('USERENV','CURRENT_USER'),
        ora_dict_obj_type,
        ora_dict_obj_name,
        ora_sysevent
    );
END;
/



------------- Transictions ------------------
START TRANSACTION;

-- Step 1: Insert Customer
INSERT INTO customer (customer_id, customer_name)
VALUES (101, 'Talha');

-- Create Savepoint
SAVEPOINT after_customer;

-- Step 2: Try Insert Order (ERROR: wrong column or duplicate primary key)
INSERT INTO orders (order_id, customer_id, amount)
VALUES (1, 101, 'ABC');   -- ? ERROR: amount should be a number

-- Because of error ? Rollback to Savepoint
ROLLBACK TO after_customer;

-- Continue Transaction Safely
-- Insert Correct Order
INSERT INTO orders (order_id, customer_id, amount)
VALUES (1, 101, 2500);

COMMIT;


