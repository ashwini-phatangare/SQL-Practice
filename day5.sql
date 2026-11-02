CREATE DATABASE day5_joins;
USE day5_joins;

CREATE TABLE departments (
dept_id INT PRIMARY KEY,
dept_name VARCHAR(50)
);

CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
salary INT,
dept_id INT,
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

INSERT INTO departments VALUES
(1,"HR"),
(2,"IT"),
(3,"Finance"),
(4,"Marketing"); -- no employees

INSERT INTO employees VALUES
(101,"Ankita",45000,1),
(102,"Rohit",55000,2),
(103,"Sana",40000,1),
(104,"Karan",60000,3),
(105,"Priya",48000,NULL); -- No dept

SELECT * FROM departments;
SELECT * FROM employees;

/* ====================================================================================================
 -- INNER JOIN – Shows only matching data from both tables.
-- LEFT JOIN – Shows all data from the left table.
-- RIGHT JOIN – Shows all data from the right table.
-- FULL OUTER JOIN – Shows all data from both tables.
-- CROSS JOIN – Combines every row of one table with every row of another table.
-- SELF JOIN – Joins a table with itself.
================================================================*/

 -- inner join
SELECT e.emp_name ,e.salary,d.dept_name
FROM employees as e
INNER JOIN departments as d
ON e.dept_id = d.dept_id;

-- left join
SELECT emp_name,salary,dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id;

-- right join
SELECT emp_name,salary,dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;

-- full join
SELECT emp_name,salary,dept_name
FROM employees
LEFT JOIN departments
ON employees.dept_id = departments.dept_id
UNION
SELECT emp_name,salary,dept_name
FROM employees
RIGHT JOIN departments
ON employees.dept_id = departments.dept_id;


-- CROSS JOIN
SELECT emp_name ,dept_name
FROM employees
CROSS JOIN departments;


-- Self join
SELECT e1.emp_name AS Employee,e2.emp_name AS Manager
FROM employees e1
INNER JOIN employees e2
ON e1.dept_id = e2.dept_id;


