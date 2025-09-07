-- for create new user
CREATE USER Lab03 IDENTIFIED BY password;

------------ IN LAB TASKS ---------------

CREATE TABLE employees(
    emp_id int PRIMARY KEY,
    emp_name VARCHAR(10 ) not null,
    salary int ,
    dept_id INT,
    CONSTRAINT Check_salary CHECK(salary >20000)/*, 
    FOREIGN KEY (dept_id)REFERENCES departments(dept_id) 
    this line is in comment because we don't hove table "departments" so if we run this 
    without comment it it will show error
    */
);
-- 02
ALTER TABLE employees RENAME COLUMN emp_name to  full_name;
-- 03 
ALTER TABLE employees DROP CONSTRAINT Check_salary;
INSERT into EMPLOYEES VALUES(1,'Talha',5000,101);
-- 04
create TABLE departments(
    dept_id int PRIMARY KEY,
    dept_name VARCHAR(20) unique
);
INSERT INTO DEPARTMENTS columns (dept_id,dept_name) VALUES (101,'AI');
INSERT INTO DEPARTMENTS  (dept_id,dept_name) VALUES (102,'CS');
INSERT INTO DEPARTMENTS  (dept_id,dept_name) VALUES (103,'CY');

--05
ALTER TABLE employees add CONSTRAINT fk FOREIGN key (dept_id) REFERENCES departments(dept_id);
--06
ALTER TABLE employees add  (bonus NUMBER(6,2) default 1000); 
-- 07
ALTER TABLE employees add (city VARCHAR(15) DEFAULT 'Karachi',age int, CONSTRAINT check_age CHECK(age > 10));
--08
DELETE FROM EMPLOYEES where EMP_ID in (1,3);
--09
ALTER TABLE employees  MODIFY (city VARCHAR(20),full_name VARCHAR(20));
--10
ALTER TABLE employees add (email VARCHAR(30) UNIQUE);


----------------------- Post Lab --------------------------
SELECT * FROM DEPARTMENTS;
select * from EMPLOYEES;

--11
ALTER TABLE employees add CONSTRAINT unique_bonus UNIQUE(bonus);
INSERT INTO EMPLOYEES (emp_id,full_name,salary,dept_id,bonus,age,email) VALUES (1,'Talha',20000,101,2000,20,'talha@gmail.com');
INSERT INTO EMPLOYEES (emp_id,full_name,salary,dept_id,bonus,age,email) VALUES (2,'Fahad',15000,102,3000,20,'fahad@gmail.com');
--12
ALTER TABLE employees add (DOB DATE);
ALTER TABLE employees add CONSTRAINT check_dob check(DOB <= TO_DATE('01-01-2007', 'DD-MM-YYYY') );
--13
INSERT INTO EMPLOYEES (emp_id,full_name,salary,dept_id,bonus,age,email,DOB) VALUES (3,'Raghib',15000,103,4000,20,'raghib@gmail.com','02-01-2007');
--14
ALTER TABLE employees drop CONSTRAINT fk;
INSERT into EMPLOYEES columns(emp_id,FULL_NAME,salary,dept_id,bonus,age,email) VALUES(4,'umar',20000,105,1500,21,'umar@gmail.com');
SELECT * from EMPLOYEES;
ALTER TABLE employees add CONSTRAINT fk FOREIGN key (dept_id) REFERENCES departments(dept_id);
--15
ALTER TABLE employees drop  (city, age);
--16
SELECT dp.*,ep.* from DEPARTMENTS dp, EMPLOYEES ep WHERE dp.DEPT_ID = ep.DEPT_ID;
--17
ALTER TABLE employees RENAME COLUMN salary to  month_salary;
--18
select * from DEPARTMENTS dp where dp.DEPT_ID not IN (SELECT dept_id FROM employees ep where dp.dept_id = ep.dept_id);
--19
TRUNCATE TABLE students;
--20
select dept_id,emp_count from
(SELECT dept_id,count(*) as emp_count FROM employees group by (dept_id)order by emp_count desc)
where rownum = 1 ;
