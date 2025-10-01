--IN Lab Taska
--1)
SELECT (SELECT d.dept_name FROM Department d WHERE d.dept_id = s.dept_id) AS department,COUNT(*) AS student_count FROM Student s GROUP BY (s.dept_id);

--2)
SELECT (SELECT d.dept_name FROM Department d WHERE d.dept_id = s.dept_id) AS department,AVG(s.GPA) as average_GPA FROM Student s GROUP BY s.dept_id HAVING AVG(s.GPA) >3.0;


--3)
select c.course_name, AVG(s.fee_paid) as average_fee from  Student s, Enrollment e, Course c
where s.student_id = e.student_id and e.course_id = c.course_id group by c.course_name;
--4)
select (select d.DEPT_NAME from Department d where d.DEPT_ID = f.DEPT_ID  ),count(*) from faculty f group by f.DEPT_ID;

--5)
SELECT Name, Salary FROM Faculty WHERE Salary > (SELECT AVG(Salary) FROM Faculty);

--6) 
SELECT * FROM Student WHERE GPA > ANY (
SELECT GPA FROM Student WHERE Dept_ID = (
select dept_id from department where department.DEPT_NAME like '%Computer Science%' )); 


--7)
select * from (select * from Student order by(GPA) desc) where  rownum <= 3 ;





--8)

SELECT s.student_id, s.NAME
FROM Student s WHERE NOT EXISTS ( SELECT c.course_id FROM Student a, Enrollment ea, Course c
WHERE a.NAME = 'Ali' AND a.student_id = ea.student_id AND ea.course_id = c.course_id
AND NOT EXISTS ( SELECT 1 FROM Enrollment e WHERE e.student_id = s.student_id AND e.course_id = c.course_id ));


--9)
select (select d.dept_name from DEPARTMENT d where d.DEPT_ID = s.dept_id) , sum(s.fee_paid) "Total Fee" from STUDENT s GROUP by s.DEPT_ID; 

--10
select c.COURSE_NAME from COURSE c where c.COURSE_ID in(select e.COURSE_ID from ENROLLMENT e WHERE e.STUDENT_ID in(SELECT s.STUDENT_ID from STUDENT s where GPA > 3.5))




-- ---------------------- Post Lab Tasks ------------------------------------
--11)
select (select d.dept_name from department d where d.DEPT_ID =  s.DEPT_ID) "Department", sum(s.fee_paid) "Fee  Sum" from student s group by (s.dept_id) having sum(s.fee_paid) > 1000000;

--12)
select f.dept_id from faculty f where f.salary>100000 group by f.dept_id having count(f.faculty_id) >5;
--13
delete from student where GPA < (select AVG(s.GPA) from student s);
--14)
select Student_ID, Student_Name, Dept_ID, GPA, Fee_Paid  from student where fee_paid >(select AVG(fee_paid) from student);

--15)
INSERT INTO HIGH_FEE_STUDENTS (SELECT * FROM STUDENTS WHERE FEE_PAID > (SELECT AVG(FEE_PAID) FROM STUDENTS));
--16)
INSERT INTO RETIRED_FACULTY (SELECT * FROM FACULTY WHERE JOINING_DATE < (SELECT MIN(JOINING_DATE) FROM FACULTY));
--17
SELECT * FROM (SELECT DEPT_ID, SUM(FEE_PAID) AS TOTAL_FEES_COLLECTED FROM STUDENTS GROUP BY DEPT_ID ORDER BY TOTAL_FEES_COLLECTED DESC) WHERE ROWNUM <= 1;

--18)
select course_id from (select count(*) as cnt ,e.course_id from  ENROLLMENT e group by e.COURSE_ID order by cnt desc) where rownum <4;


--19)
select s.student_id from student s inner join enrollment e on e.student_id = s.student_id where s.gpa > (select AVG(gpa) from student )
group by s.student_id having  count(course_id) > 3;
--20)
INSERT INTO UNASSIGNED_FACULTY (SELECT * FROM FACULTY WHERE FACULTY_ID NOT IN (SELECT FACULTY_ID FROM TEACHES));
