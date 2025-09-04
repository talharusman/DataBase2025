create TABLE students(
ID int primary KEY,
std_name VARCHAR(30),
email VARCHAR(20),
age int,
check(age>=18)

);
select * from STUDENTS;

alter TABLE students add salary int;
ALTER TABLE students add (city VARCHAR(20) default 'Karachi' , dept_id int);
--add single constraint
ALTER TABLE students add CONSTRAINT unique_email unique(email);

-- modify multipel columns of  we also can add single columns
ALTER TABLE students MODIFY(std_name VARCHAR(20) not null,email VARCHAR(20) not null);

----------- to add multipal cunstraint --------------

--alter table students add ( CONSTRAINT
--check_age check(age between 18 and 30),
--CONSTRAINT unique_email unique(email)
--);

create table departments(
id int primary key,
dept_name VARCHAR(20) not null
);

select * from departments;

insert into DEPARTMENTS(id, dept_name) values(3,'CS');-- use to add single row values
-- to add multipal rows we have to use trigger

select * from DEPARTMENTS ORDER by(id) ASC;


alter table students drop COLUMN dept_id;

-- make the foreign key 
alter table students add (dept_id int , foreign key(dept_id) references departments(id));
-- add rows
insert into students(id, std_name, email, age, salary,dept_id) values(3,'Talha', 'talha@gmail.com',20,200000000,1);
insert into students(id, std_name, email, age, salary,city,dept_id) values(4,'Fahad', 'Fahad@gmail.com',20,2,'TDM',1);
insert into students(id, std_name, email, age, salary,city,dept_id) values(5,'Raghib', 'Raghib@gmail.com',20,1,'KHI',3);

select * from STUDENTS;

DELETE from STUDENTS where id in (3,4,5);
select * from STUDENTS;

