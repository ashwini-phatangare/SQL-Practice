CREATE DATABASE day3;
USE day3;

-- ---------------------------------------------------------
-- DDL (Table Creation)
-- ----------------------------------------------------

CREATE TABLE department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
age INT CHECK(age >= 18),
salary DECIMAL(10,2),
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES department (dept_id)
);

SELECT * FROM department;
SELECT * FROM employees;

-- ALTER examples

ALTER TABLE employees ADD email VARCHAR(50);
ALTER TABLE employees MODIFY salary DECIMAL(10,2);

SELECT * FROM employees;

-- -------------------------------
-- DML (Data Insertion)
-- ----------------------------------

INSERT INTO department VALUES (1,'HR'),
(2,'Finance'),(3,'IT');
INSERT INTO employees VALUES 
(101,'Ankita',25,45000.00,1,"ankita@gmail.com"),
(102,'Rohit',28,52000.00,3,"rohit@gmail.com"),
(103,'Sana',22,38000.00,2,"sana@gmail.com");

SELECT * FROM department;
SELECT * FROM employees;

-- Update
UPDATE employees SET salary = 60000 WHERE emp_id = 102;
SELECT * FROM employees;

-- Delete
DELETE FROM employees WHERE emp_id = 103;
SELECT * FROM employees;

-- ------------------------------
-- DQL (Query Data)
-- -----------------------
SELECT * FROM employees;
SELECT emp_name,salary FROM employees;
SELECT * FROM employees WHERE salary > 45000;

-- ---------------------------------------
-- TCL (Transactions)
-- ----------------------------------------
-- commit - data stored permentatly in db
-- rollback - undo
-- savepoint - used to add check point

START TRANSACTION;
UPDATE employees SET salary = salary + 5000 WHERE dept_id = 1;
SAVEPOINT sp1;
 
update employees SET salary = 70000 WHERE emp_id = 102;
select * from employees;
ROLLBACK TO sp1; 

COMMIT;

-- ------------------------------------------
-- DCL (PERMISSION Control)
-- ----------------------------------------
create user 'user1'@'localhost' identified by 'pass123';
GRANT SELECT ,INSERT ON employees TO 'user1'@'localhost';
REVOKE INSERT ON employees FROM 'user1'@'localhost';

