-- Day 9
-- view is virtual table : A View is a virtual table created from a SQL query.

create database view_Demo;
use view_Demo;

-- --------------------------------------------------
-- 1 CREATE BASE TABLE
-- -------------------------------------------------
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
city VARCHAR(50)
);

-- 2 INSERT SAMPLE DATA
-- ----------------------------------------------------

INSERT INTO employees VALUES
(101,"Arjun","HR",  45000,"Mumbai"),
(102,"Rohit","IT",    55000,"Pune"),
(103,"Sana","HR",  40000,"Delhi"),
(104,"Karan","Finance",60000,"Mumbai"),
(105,"Priya","IT",48000,"Chennai"),
(106,"Amit","Marketing",50000,"Pune");

-- ---------------------------------
-- Creating a Simple view
-- ---------------------------------

CREATE VIEW emp_basic AS
SELECT emp_id ,emp_name,salary
FROM employees;

-- View Data

SELECT * FROM emp_basic;
-- -----------------------------------------
-- Creating View with condition
-- --------------------------------------
CREATE VIEW high_salary_emp AS
SELECT  emp_name,department,salary
FROM employees
WHERE salary > 50000;

-- View Data
SELECT * FROM high_salary_emp;

-- --------------------------------------------
-- Updating data through view
-- --------------------------------------------
UPDATE emp_basic
SET salary = 46000
WHERE emp_id = 101;

select * from emp_basic;

-- Verify update
SELECT * FROM employees WHERE emp_id = 101;
-- --------------------------------

-- --------------------------------------
-- DROPING A VIEW
-- -----------------------------
DROP VIEW emp_basic;
-- DROP VIEW high_salary_emp;

-- ---------------------------------
-- 7.CREATING INDEX
-- Index : An Index is used to make data searching faster in a table.
-- ------------------------------------
-- 7A: CREATE NON-CLUSTERED INDEX(MYSQL + SQL)
CREATE INDEX idx_emp_name
ON employees (emp_name);

-- 7B:CREATE INDEX ON SALARY
CREATE INDEX idx_salary
ON employees (salary);

-- -----------------------------------------------------------
-- 8. CREATING A CLUSTERED INDEX(SQL SERVER ONLY) : Clustered Index table मधील data 
-- rows च्या physical/logical ordering शी जोडलेला index असतो.
-- A Clustered Index determines the order in which table data is organized.
-- MYSQL automatically uses PRIMARY KEY as INDEX
-- -----------------------------------------------
-- SQL SERVER:
-- CREATE CLUSTERED INDEX idx_emp_id
-- ON employees (emp_id);

-- ----------------------------------

-- 9 DRROPPING INDEXES
-- -------------------------------------------

DROP INDEX idx_emp_name ON employees;
DROP INDEX idx_salary ON employees;

-- SQL SERVER:
-- DROP INDEX employees.idx_emp_name;
-- DROP INDEX employees.idx_salary;