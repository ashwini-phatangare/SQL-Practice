-- 11 sep 2026
-- SQL Chapter 7
-- Day 8
--  subquery : Query inside another query = Subquery
-- 7.Nested queries(subqueries)

create database subq;
use subq;

-- -----------------------------------------------------
# create tables
-- -----------------------------
CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(50),
salary INT,
dept_id INT,
bonus INT,
join_date DATE,
FOREIGN KEY(dept_id)REFERENCES departments(dept_id)
);

-- -------------------------
-- 2 .Insert data
-- ----------------------------------

INSERT INTO departments VALUES
(1,"HR"),
(2,"IT"),
(3,"Finance"),
(4,"Marketing");

INSERT INTO employees VALUES
(101,"Arjun","HR",45000,1,5000,'2021-01-10'),
(102,"Rohit","IT",55000,2,NULL,'2020-03-15'),
(103,"Sana","HR",40000,1,3000,'2022-05-20'),
(104,"karan","Finance",60000,3,NULL,'2019-11-05'),
(105,"Priya","IT",48000,2,4000,'2022-08-12'),
(106,"Amit","Marketing",50000,4,NULL,'2023-09-25'),
(107,"Neha","Finance",61000,3,6000,'2020-12-01');

select * from employees;
select * from departments;

-- ----------------------------------------
-- 3.Handling NULL VALUES
-- ------------------------------------------------
SELECT emp_name,bonus
FROM employees
WHERE bonus IS NULL;

-- Replace NULL bonus with 0 using COALESCE
SELECT emp_name,COALESCE(bonus,0) AS bonus_fixed
FROM employees;

-- -------------------------------------------------------

-- 4 SCALAR Subquery :Scalar Subquery → One value returns.

-- -----------------------------------------------------------------
-- Employees earning more than average salary
SELECT emp_name,salary
FROM employees
WHERE salary >(SELECT AVG(salary) FROM employees);

-- Employees with the highest salary
SELECT emp_name,salary
FROM employees
WHERE salary = (SELECT MAX(salary) FROM employees);

-- compare each salary to overall average
SELECT emp_name,salary,
			(SELECT AVG(salary) FROM employees) AS overall_avg
FROM employees;                      

-- ------------------------------------------------                
-- 5.MULTI - ROW SUBQUERIES(IN,ANY,ALL)
-- ------------------------------------------------- 

-- 5A : IN Operator
-- Employees working in IT or HR

SELECT emp_name , department
FROM employees
WHERE dept_id IN(SELECT dept_id FROM departments WHERE dept_name IN("IT","HR"));
             
 -- 5B : ANY Operator
 -- Employees whose salary is greater than ANY finance salary 
  SELECT emp_name,salary
  FROM employees
  WHERE salary > ANY (SELECT salary FROM employees WHERE department = 'Finance' );
  
  -- 5C : ALL Operator
  -- Employees whose salary is greater than ALL HR salaries
  SELECT emp_name,salary
  FROM employees
  WHERE salary > ALL (SELECT salary  FROM employees WHERE departments = 'HR');
 
 -- -------------------------------------------------------------------------------------------------------------------------
  -- Corelated Subqueries : Correlated Subquery = Main query च्या प्रत्येक row वर depend असलेली subquery.
  -- A subquery that depends on the current row of the outer query.
  -- ----------------------------------------------------------------------------------------------------------------------------
  -- Employees earning more than avg salary of their department
  SELECT e.emp_name,e.salary,e.department
  FROM employees e
  WHERE e.salary >
                   (SELECT AVG(salary)
					FROM employees
                   WHERE department = e.department);
                   
   -- Employee earning highest salary in each department
   SELECT e.emp_name,e.salary,e.department
   FROM employees e
   WHERE e.salary =
                    (SELECT MAX(salary)
                    FROM employees
                    WHERE department = e.department);
   
   -- ------------------------------------------------
   -- 7 SUBQUERY IN FROM CLAUSE
   -- ----------------------------------------------
   -- Department - wise average salary,filter average > 50000
   
   SELECT dept_name,avg_salary
   FROM (
   SELECT department AS dept_name,
                AVG(salary)AS avg_salary
                FROM employees
                GROUP BY department
                ) AS temp
                WHERE avg_salary > 50000;
                
                
 -- 8 .SUBQUERY IN SELECT CLAUSE 
 -- --------------------------------------
 
 -- Add overall average salary beside each row
 SELECT emp_name,salary,
                        (SELECT AVG(salary) FROM employees)AS overall_average
 FROM employees;      
 
 -- show department-wise employee count inside SELECT
 SELECT d.dept_name,
                    (SELECT COUNT(*) FROM employees e WHERE e.dept_id = d.dept_id)AS emp_count
                    FROM departments d;