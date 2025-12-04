set SERVEROUTPUT ON


/*
Object Type Contains:

Attributes ? like class variables
Methods ? functions/procedures inside the object
*/
CREATE or REPLACE TYPE employee_type as OBJECT(
    e_id NUMBER,
    e_name VARCHAR(20),
    salary NUMBER,
    MEMBER FUNCTION yearly_salary return NUMBER
);
/

-- PART 2). Object Type Body
CREATE or REPLACE TYPE BODY employee_type as 
MEMBER FUNCTION yearly_salary return NUMBER is
BEGIN
    return salary*12;
    end;
end;
/

--PART 3) Creating Objects (Instances)
DECLARE
    emp employee_type;
begin
    emp:= employee_type(101, 'Talha', 5000);
    
    dbms_output.put_line(emp.e_name || ' has yearly salary: ' ||
                         emp.yearly_salary());
end;
/

--PART 4) Object Tables
CREATE TABLE employees_table OF employee_type (
    PRIMARY KEY (e_id)
);

--Insert objects:
INSERT INTO employees_table
VALUES (employee_type(1, 'Ali', 6000));
--Query:
SELECT e.e_name, e.yearly_salary() FROM employees_table e;

/
--PART 5 – Column Objects (Objects inside normal tables)
CREATE TYPE address_type AS OBJECT (
    city VARCHAR2(20),
    street VARCHAR2(30)
);
/

CREATE TABLE customers (
    cust_id NUMBER,
    cust_name VARCHAR2(30),
    address address_type
);
/

--Insert:
INSERT INTO customers VALUES (
    1, 'Ahmad', address_type('Lahore', 'Model Town')
);

--Query:
SELECT c.address.city,c.ADDRESS.street FROM customers c;


