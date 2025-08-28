SELECT count(*) as total_employees FROM EMPLOYEES;

SELECT count(*) as total_employees, manager_id FROM EMPLOYEES GROUP BY(MANAGER_ID);-- to know which managr has many employees
SELECT DISTINCT manager_id from EMPLOYEES;
SELECT manager_id from EMPLOYEES;

select SUM(salary) as total_salary from EMPLOYEES;
select SUM(salary) as total_salary, MANAGER_ID from EMPLOYEES GROUP BY(MANAGER_ID);

select min(salary) as min_salary from EMPLOYEES;
select min(salary) as Max_salary, manager_id FROM EMPLOYEES GROUP BY(manager_id);
select min(salary) as Max_salary, DEPARTMENT_ID FROM EMPLOYEES GROUP BY(DEPARTMENT_ID);

select MAX(salary) as max_salary from EMPLOYEES;
select MAX(salary) as Max_salary, manager_id FROM EMPLOYEES GROUP BY(manager_id);

SELECT AVG(salary, 1) as Average_salary from EMPLOYEES;
select AVG(salary) as Max_salary, manager_id FROM EMPLOYEES GROUP BY(manager_id);


SELECT manager_id from EMPLOYEES where salary = (select max(salary) from Employees);
-- concatination
SELECT FIRST_NAME ||' '|| last_name as name from employees;

select salary FROM EMPLOYEES ORDER by(SALARY) asc;
select first_name, salary from EMPLOYEES ORDER BY(FIRST_name) asc;

--while card
SELECT first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE '%a%';
SELECT first_name FROM EMPLOYEES WHERE FIRST_NAME LIKE 'A__a%';


SELECT * FROM EMPLOYEES;

SELECT * FROM DUAL;
select ABS(-15) FROM DUAL;-- returns positive values
SELECT ceil(90.1) FROM DUAL; -- returns grater value
select ceil(-90.2) from dual;
select FLOOR(15.7) from dual;
select ROUND(15.193,1) from dual;-- ask question
select TRUNC(15.79,1) from dual;
SELECT greatest(90,87,89) from dual;

-- string functions
SELECT salary, lower(salary) from EMPLOYEES;
SELECT lower('Talha') FROM dual;
SELECT UPPER('talha') from dual;
select INITCAP('the soap') from dual;
select length('Talha') from dual;
SELECT ltrim(' Talha') from dual;
select SUBSTR('ABCDEFG',3,4) from dual;
SELECT lpad('good',7,'*') from dual;
select RPAD('tal',5, '*') from dual;

-- data funcitions
select add_months('16-sep-2024',2) from dual;
select MONTHS_BETWEEN ('02-DEC-2024','02-SEP-2024') from dual;
SELECT NEXT_DAY('15-OCT-2009','TUESDAY') "NEXT DAY" from dual;

-- conversion function
SELECT to_char(sysdate,'DD-MM-YY')  from dual;
select to_char(sysdate, 'Day') from dual;

select * from EMPLOYEES where to_char(HIRE_DATE,'Day') like '%Saturday%';

SELECT to_char(HIRE_DATE,'Day') FROM EMPLOYEES;



