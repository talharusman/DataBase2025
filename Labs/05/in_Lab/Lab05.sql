----- in Lab Tasks -------------------------------


--1
select * from EMPLOYEES cross join DEPARTMENTS;
--2
select e.*, d.* from EMPLOYEES e left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;
--3
select e.EMPLOYEE_ID,e.EMPLOYEE_NAME, e.EMPLOYEE_NAME from EMPLOYEES e inner JOIN EMPLOYEES m on e.EMPLOYEE_ID = m.MANAGER_ID;
--4
SELECT * from EMPLOYEES where EMPLOYEE_ID not in (select EMPLOYEE_ID from Employee_Project_Assignment);

SELECT e.*
FROM Employees e
LEFT JOIN Employee_Project_Assignment pa ON e.employee_id = pa.employee_id
WHERE pa.employee_id IS NULL;

--5
select s.student_name ,c.course_name from  STUDENTS s INNER JOIN ENROLLMENTS e on s.student_id = e.STUDENT_ID INNER JOIN COURSES c on e.course_id = c.COURSE_ID;

--6
SELECT  c.customer_id,c.customer_name, o.order_id, o.order_date FROM customers c LEFT JOIN  orders o ON c.customer_id = o.customer_id ORDER BY c.customer_id;

-- 7
select e.*, d.* from EMPLOYEES e left join DEPARTMENTS d on e.DEPARTMENT_ID = d.DEPARTMENT_ID;

--8
SELECT t.teacher_id,t.teacher_name,s.subject_id,s.subject_name FROM  Teachers t CROSS JOIN Subjects s;

--9
SELECT d.DEPARTMENT_NAME, COUNT(*) AS total_students
FROM EMPLOYEES e
INNER JOIN DEPARTMENTS d ON d.DEPARTMENT_ID = e.DEPARTMENT_ID
GROUP BY d.DEPARTMENT_ID, d.DEPARTMENT_NAME;
 
-- 10


SELECT * FROM Departments;
SELECT * FROM Employees;
SELECT * FROM Projects;
SELECT * FROM Employee_Project_Assignment;
SELECT * FROM Customers;
SELECT * FROM Orders;


SELECT * FROM Subjects;
SELECT * FROM Teachers;
SELECT * FROM Students;
SELECT * FROM Enrollments;
SELECT * FROM Courses;

select s.student_name,su.subject_name,t.teacher_name from STUDENTS s
inner join ENROLLMENTS e on s.STUDENT_ID = e.STUDENT_ID inner join subjects su
on e.course_id = su.SUBJECT_ID inner join teachers t on t.TEACHER_ID = su.TEACHER_ID ;


