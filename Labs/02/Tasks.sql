--1
SELECT SUM(salary) as Total from EMPLOYEES;
--2
SELECT AVG(salary)  "Average_salary" from EMPLOYEES;
--3
SELECT count(*)as "total Employees", MANAGER_ID from EMPLOYEES GROUP by (MANAGER_ID);
--4
SELECT * FROM Employees where salary = (select min(salary) from employees);
--5
SELECT to_char(sysdate,'DD-MM-YY') "Current Date"  from dual;
--6
SELECT to_char(sysdate,'DayMonthYYYY') "Current Date"  from dual;
--7
SELECT * FROM EMPLOYEES WHERE to_char(HIRE_DATE,'Day') like '%Wednesday%';
--8
SELECT MONTHS_BETWEEN('01-JAN-2025','01-OCT-2024') "Month Between" from dual;
--9
SELECT EMPLOYEE_ID, round(MONTHS_BETWEEN('01-JAN-2025',HIRE_DATE),2) "Total month" from EMPLOYEES;
--10
select  SUBSTR(last_name, 1, 5) "1st 5 characters" from EMPLOYEES;

-- post lab tasks-------
--11
SELECT LPAD(first_name,15,'*') from EMPLOYEES; 
--12
SELECT LTRIM(' Oracle') AS result FROM dual;
--13
select INITCAP(FIRST_NAME ||' '|| LAST_NAME) as Name from EMPLOYEES;
--14
SELECT ADD_MONTHS(TO_DATE('20-AUG-2022', 'DD-MON-YYYY'), 1) "next month" FROM dual;
--15
SELECT TO_CHAR(TO_DATE('25-DEC-2023', 'DD-MON-YYYY'), 'DD-MM-YYYY') AS month_year FROM dual;
--16
SELECT DISTINCT(salary) as Salary FROM EMPLOYEES ORDER BY(salary) asc; 
--17
SELECT ROUND(salary, -2) AS rounded_salary FROM employees;
--18
SELECT * FROM (SELECT DEPARTMENT_ID, COUNT(*) AS TOTAL_EMPLOYEES FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY TOTAL_EMPLOYEES DESC) WHERE ROWNUM <= 1;
--19
SELECT department_id FROM employees GROUP BY department_id HAVING COUNT(*) = ( SELECT MAX(emp_count) FROM ( SELECT COUNT(*) AS emp_count FROM employees GROUP BY department_id) sub);

SELECT * FROM (SELECT DEPARTMENT_ID, COUNT(*) AS TOTAL_EMPLOYEES FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY TOTAL_EMPLOYEES DESC) WHERE ROWNUM <= 1;


