set SERVEROUTPUT on;

declare
sec_name VARCHAR(20) := 'SEC-5A';
course_name varchar(20) := 'DBS';

BEGIN
DBMS_OUTPUT.PUT_LINE('WELCOME'||sec_name||'to the ' || course_name);
end;
/

declare
a int := 10;
b int := 20;
c int;
f real;
BEGIN
c:=a+b;
DBMS_OUTPUT.PUT_LINE('value of c is '|| c);
f := 70.0/3.0;
DBMS_OUTPUT.PUT_LINE('value of f is '|| f);
end;
/

DECLARE
num1 number := 21;
num2 number := 22;

begin 
DBMS_OUTPUT.PUT_LINE('value of num1 is '|| num1);
DBMS_OUTPUT.PUT_LINE('value of num2 is '|| num2);
declare
n1 int := 45;
n2 int := 12;
begin
DBMS_OUTPUT.PUT_LINE('value of n1 and n2 is '|| n1||' '||n2);
end;
end;
/

DECLARE
e_name varchar(20);
begin
select first_name into e_name from EMPLOYEES where EMPLOYEE_ID = 100;
DBMS_OUTPUT.PUT_LINE('value of Name is '|| e_name);
EXCEPTION
WHEN
NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('no employee found ');
end;
/

BEGIN
  UPDATE employees 
  SET salary = salary * 1.10  
  WHERE department_id = (
    SELECT department_id 
    FROM departments 
    WHERE department_name = 'Administration'
  );

  DBMS_OUTPUT.PUT_LINE('Salary updated successfully');
END;
/

DECLARE
  e_id   EMPLOYEES.EMPLOYEE_ID%TYPE;
  e_name EMPLOYEES.FIRST_NAME%TYPE;
  d_name DEPARTMENTS.DEPARTMENT_NAME%TYPE;
BEGIN
  SELECT e.EMPLOYEE_ID, e.FIRST_NAME, d.DEPARTMENT_NAME
  INTO e_id, e_name, d_name
  FROM EMPLOYEES e
  INNER JOIN DEPARTMENTS d 
    ON e.DEPARTMENT_ID = d.DEPARTMENT_ID
  WHERE e.EMPLOYEE_ID = 100;

  DBMS_OUTPUT.PUT_LINE('Employee ID: ' || e_id);
  DBMS_OUTPUT.PUT_LINE('Employee Name: ' || e_name);
  DBMS_OUTPUT.PUT_LINE('Department Name: ' || d_name);
END;
/

DECLARE 
    e_id   EMPLOYEES.EMPLOYEE_ID%TYPE := 100;
    e_sal  EMPLOYEES.SALARY%TYPE;
    e_did  EMPLOYEES.DEPARTMENT_ID%TYPE;
BEGIN
    SELECT salary, department_id 
    INTO e_sal, e_did 
    FROM employees 
    WHERE employee_id = e_id;

    CASE e_did
        WHEN 90 THEN
            UPDATE employees 
            SET salary = e_sal + 100 
            WHERE employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('Salary updated to: ' || (e_sal + 100));

        WHEN 50 THEN
            UPDATE employees 
            SET salary = e_sal + 200 
            WHERE employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('Salary updated to: ' || (e_sal + 200));

        WHEN 40 THEN
            UPDATE employees 
            SET salary = e_sal + 300 
            WHERE employee_id = e_id;
            DBMS_OUTPUT.PUT_LINE('Salary updated to: ' || (e_sal + 300));

        ELSE
            DBMS_OUTPUT.PUT_LINE('No such department ID found');
    END CASE;
END;
/


