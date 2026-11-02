-- Practical Assignment: Types of SQl Commands

-- Practical 1 :- DDL : Create
-- Create a database named companyDB and create an Employees table with the following columns.
CREATE DATABASE companyDB;
USE companyDB;

create table employees (
employee_ID INT PRIMARY KEY,
employee_name VARCHAR(100) NOT NULL,
department VARCHAR(100) NOT NULL,
salary DECIMAL(10,2),
joining_date DATE
);

SELECT * FROM employees;

-- Practical 2 - DDL :- ALTER
-- Using the Employees Table

-- 1. Add a column Email
ALTER TABLE employees ADD email VARCHAR(100);

-- 2.Add a column Phone
ALTER TABLE employees ADD phone INT;

-- 3. Modify the datatype of Salary
ALTER TABLE employees MODIFY salary DECIMAL(10,2);

-- 4.Rename the table to Employees_Details
ALTER TABLE employees RENAME employees_details;
SELECT * FROM employees_details;

-- Practical 3 : DDL :- TRUNCATE & DROP
-- Perform the Following Operations
-- 1. Create a table named Test_Employees

CREATE TABLE test_Employees (
emp_ID INT PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
emp_dept VARCHAR(100) NOT NULL
);

INSERT INTO test_Employees VALUES
(1,"Ashwini","IT"),
(2,"Sandip","Pharma"),
(3,"Vaishnavi","Finance");
SELECT * FROM test_Employees;

-- Use Truncate to remove all records
TRUNCATE TABLE test_Employees;
SELECT * FROM test_Employees;

-- Create another table named Test_Department
CREATE TABLE test_department (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(100) NOT NULL
);

-- Use DROP to remove the table
DROP TABLE test_department;


-- Practical 4: DML :- INSERT
-- Create an Employees table and insert at least 10 employee records using the INSERT Command
CREATE TABLE emp (
emp_Id INT PRIMARY KEY,
emp_name VARCHAR(100) NOT NULL,
emp_dept VARCHAR(100) NOT NULL,
emp_salary DECIMAL(10,2),
emp_city VARCHAR(100) ,
emp_joiningdate DATE 
);
SELECT * FROM emp;

INSERT INTO emp VALUES
(1,"ashwini","IT",50000,"Hyderabad",'2024-06-10'),
(2,"vaishnavi","HR",45000,"Nashik",'2023-08-15'),
(3,"Sita","Finance",30000,"Pune",'2022-04-20'),
(4,"Gita","Marketing",60000,"Mumbai",'2021-11-05'),
(5,"Ram","Pharma",73000,"Sambhajinagar",'2024-01-12'),
(6,"Kunal","Sales",47000,"Nashik",'2023-05-18'),
(7,"Nisha","HR",65000,"Pune",'2020-09-25'),
(8,"Sneha","IT",48000,"Nagpur",'2022-12-10'),
(9,"Rahul","HR",43000,"Nashik",'2021-06-30'),
(10,"Ajay","Marketing",52000,"Hyderabad",'2024-03-22');

SELECT * FROM emp;

-- practical 5 - DML : UPDATE
-- Using the employee table 

-- 1.Update the salary of one employee
UPDATE emp
SET emp_salary = 60000
WHERE emp_id = 1;
SELECT * FROM emp
WHERE emp_id = 1;

-- 2.change an employees department
UPDATE emp
SET emp_dept = "IT"
WHERE emp_id = 4;

SELECT * FROM emp
WHERE emp_id = 4;

-- 3. Change the city of an employee
UPDATE emp
SET emp_city = "Pune"
WHERE emp_id = 10;
SELECT * FROM emp
WHERE emp_id = 10;

-- Increae the salary of all employees by 10%
SET SQL_SAFE_UPDATES = 0;
UPDATE emp
SET emp_salary = emp_salary *1.10;

SELECT * FROM emp;

-- Update multiple records based on a condition 
-- AND condition
SELECT * FROM emp
WHERE  emp_salary > 40000 AND emp_city = "Nashik";

-- OR condition
SELECT * FROM emp
WHERE emp_city = 'Hyderabad' OR emp_dept = 'HR';

-- Practical 6 : DML : DELETE
-- Using the emp table

-- 1. Delete One employee
 DELETE FROM emp
WHERE emp_id = 2;
SELECT * FROM emp;

-- delete employees from a particular department
DELETE FROM emp
WHERE emp_dept = 'HR';
SELECT * FROM emp;

-- delete employees whose salary is below a specified amount
DELETE FROM emp
WHERE emp_salary < 70000;
SELECT * FROM emp;

-- delete employees from a particular city
DELETE FROM emp
WHERE emp_city = "Pune";
SELECT * FROM emp;

-- Practical 7 : DQL :- SELECT
-- using the emp table,write queries to

-- 1. Display all employees
SELECT * FROM emp;

-- 2. display only employees name and salary
SELECT emp_name ,emp_salary FROM emp;

-- 3.display employees from the IT department
SELECT * FROM emp
WHERE emp_dept = 'IT';

-- 4. display employees earning more than 50,000
SELECT * FROM emp
WHERE emp_salary > 50000;

-- 5.Display employees from Mumbai
SELECT * FROM emp
WHERE emp_city = 'Mumbai';

-- 6.display employees whose salry is between 40,000 and 80,000
SELECT * FROM emp
WHERE emp_salary BETWEEN 50000 AND 80000;

-- 7.display unique departments



-- Practical 8 : DQL : Filtering and Sorting

TRUNCATE TABLE emp;
INSERT INTO emp VALUES
(1,"ashwini","IT",50000,"Hyderabad",'2024-06-10'),
(2,"vaishnavi","HR",45000,"Nashik",'2023-08-15'),
(3,"Sita","Finance",30000,"Pune",'2022-04-20'),
(4,"Gita","Marketing",60000,"Mumbai",'2021-11-05'),
(5,"Ram","Pharma",73000,"Sambhajinagar",'2024-01-12'),
(6,"Kunal","Sales",47000,"Nashik",'2023-05-18'),
(7,"Nisha","HR",65000,"Pune",'2020-09-25'),
(8,"Sneha","IT",48000,"Nagpur",'2022-12-10'),
(9,"Rahul","HR",43000,"Nashik",'2021-06-30'),
(10,"Ajay","Marketing",52000,"Hyderabad",'2024-03-22');

SELECT * FROM emp;

-- 1.display employees in ascending order of salary
SELECT * FROM emp
ORDER BY emp_salary ASC;

-- 2.display employees in descending order of salary
SELECT * FROM emp
ORDER BY emp_salary DESC;

-- 3.display the highest paid employee
SELECT * FROM emp
ORDER BY emp_salary DESC
LIMIT 1;

-- 4.display the lowest paid employee
SELECT * FROM emp
ORDER BY emp_salary ASC
LIMIT 1;

-- 5.display employee whose name start with a
SELECT * FROM emp
WHERE emp_name LIKE 'a%';

-- 6.display employee whose name end with a
SELECT * FROM emp
WHERE emp_name LIKE '%a';

-- 7.display employee who joined after a specific date
 SELECT * FROM emp
WHERE emp_joiningdate = '2022-04-20';

-- Practical 9 : DCL :- GRANT

-- Create a database user and perform the following
USE companyDB;

-- GRANT SELECT permission on the emp table
create  user 'emp_user'@'localhost' identified by 'emp123';
SELECT User ,Host FROM mysql.user;

GRANT SELECT ON companyDB.emp TO 'emp_user'@'localhost';
SELECT * FROM companyDB.emp ;

-- 2. GRANT INSERT Permission
GRANT INSERT ON companyDB.emp TO 'emp_user'@'localhost';
INSERT INTO companyDB.emp VALUES 
(11,"Riya","IT",50000,"Pune",'2025-01-10');

-- 3.GRANT UPDATE Permission
GRANT UPDATE ON companyDB.emp TO 'emp_user'@'localhost';
UPDATE companyDB.emp 
SET emp_salary = 60000
WHERE emp_id = 11;

-- 4.GRANT SELECT INSERT And UPDATE Permissions toghether
	GRANT SELECT,INSERT,UPDATE
    ON companyDB.emp
    TO 'emp_user'@'localhost';
    
    -- 5.Grant all Permissions
    GRANT ALL PRIVILEGES
    ON companyDB.emp
     TO 'emp_user'@'localhost';
     
SHOW GRANTS FOR 'emp_user'@'localhost';

-- Practical  10 : DCL :- REVOKE
-- Using the permissions given in practical 9

-- 1.REVOKE INSERT permission
REVOKE INSERT ON  companyDB.emp FROM 'emp_user'@'localhost';

-- 2.REVOKE UPDATE permission
REVOKE UPDATE ON  companyDB.emp FROM 'emp_user'@'localhost';

-- 3 REVOKE SELECT Permission
REVOKE SELECT ON  companyDB.emp FROM 'emp_user'@'localhost';

-- 4.REVOKE all permissions from the user
REVOKE ALL PRIVILEGES
ON companyDB.emp
FROM 'emp_user'@'localhost';

SHOW GRANTS FOR 'emp_user'@'localhost';

-- Practical 11 :- TCL : COMMIT & ROLLBACK
-- create an accounts table with:
CREATE TABLE accounts (
acc_id INT PRIMARY KEY,
acc_holder VARCHAR(100),
acc_balance DECIMAL(10,2)
);

-- 1.Insert 5 records
INSERT INTO accounts VALUES
(101,"Ashwini",78000),
(102,"Vaishnavi",80000),
(103,"Sakshi",50000),
(104,"Riya",35000),
(105,"Amit",40000);

SELECT * FROM accounts;

-- 2.Update the balance of an account
UPDATE accounts
SET acc_balance = 75000;
SELECT * FROM accounts;

-- 3.USE COMMIT
COMMIT;

-- 4.Perform another update
UPDATE accounts
SET acc_balance = 45000
WHERE acc_id = 101;
SELECT * FROM accounts;

-- 5.USE ROLLBACK
ROLLBACK;
SELECT * FROM accounts;

-- Practical 12 - TCL : SAVEPOINT
-- Using the Accounts table:

-- 1.Perform an update
START TRANSACTION;

UPDATE accounts
SET acc_balance = 55000
WHERE acc_id = 1;

-- 2.Create a Savepoint
SAVEPOINT sp1;

-- 3.Perform another update
UPDATE accounts
SET acc_balance = 45000
WHERE acc_id = 2;

-- Rollback to the first savepoint
ROLLBACK TO sp1;

-- commit the transaction
COMMIT;


