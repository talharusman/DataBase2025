-- Post lan Tasks

-- 11

SELECT s.STUDENT_NAME from students s join TEACHERS T on s.CITY = T.CITY;

--12)
SELECT e.emp_id,
       e.emp_name AS employee,
       m.emp_name AS manager
FROM EMPLOYEES e
LEFT JOIN EMPLOYEES m
    ON e.manager_id = m.emp_id;

--13)
select e.emp_name from EMPLOYEES e where e.DEPT_ID is null;
--14)
select d.dept_name,avg(e.salary) from EMPLOYEES e inner join DEPARTMENTS d on e.dept_id = d.DEPT_ID 
GROUP by (e.DEPT_ID,d.DEPT_NAME) HAVING AVG(e.salary) >50000;
--15)
select e.emp_name, e.salary, d.dept_name
from Employees e join Departments d ON e.dept_id = d.dept_id
where e.salary > ( select AVG(salary) from Employees
where dept_id = e.dept_id);

--16)
select d.dept_name,d.dept_id from DEPARTMENTS d join EMPLOYEES e on d.DEPT_ID = e.DEPT_ID GROUP by d.DEPT_ID,d.DEPT_NAME HAVING 
min(e.salary)  > 30000;
--17)

select s.student_name ,c.course_name from STUDENTS s JOIN STUDENTCOURSES sc on s.STUDENT_ID = sc.STUDENT_ID
join COURSES c on sc.COURSE_ID = c.COURSE_ID  where s.CITY like '%Lahore%';


--18)

SELECT 
    e.emp_id,
    e.emp_name AS employee_name,
    m.emp_name AS manager_name,
    d.dept_name AS department_name,
    e.hire_date
FROM Employees e
LEFT JOIN Employees m ON e.manager_id = m.emp_id       -- Self join for manager
LEFT JOIN Departments d ON e.dept_id = d.dept_id       -- Join with departments
WHERE e.hire_date BETWEEN DATE '2020-01-01' AND DATE '2023-01-01';

--19)
select s.student_name from students s inner join courses c on
s.course_id = c.course_id inner join TEACHERS t on c.course_id = t.course_id
where t.TEACHER_NAME  like '%Sir Ali%';

--20)
SELECT 
    e.emp_id,
    e.emp_name AS employee_name,
    m.emp_name AS manager_name,
    d.dept_name AS department_name
FROM Employees e
JOIN Employees m ON e.manager_id = m.emp_id   -- Self join to get manager
JOIN Departments d ON e.dept_id = d.dept_id   -- Department join
WHERE e.dept_id = m.dept_id;


