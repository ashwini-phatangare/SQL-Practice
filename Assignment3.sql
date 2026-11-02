-- SQL Practical Assignment - WHERE,GROUP BY & HAVING
CREATE DATABASE assignment3;
USE assignment3;

CREATE TABLE employees (
emp_id INT PRIMARY KEY, 
emp_name VARCHAR(50), 
department VARCHAR (30), 
city VARCHAR(30), 
salary DECIMAL (10,2), 
experience INT
);

INSERT INTO employees
(emp_id, emp_name, department, city, salary, experience) VALUES
(101, 'Amit', 'IT', 'Pune', 55000, 2),
(102, 'Priya', 'HR', 'Mumbai', 45000, 3),
(103, 'Rahul', 'IT', 'Pune', 65000, 4),
(104, 'Sneha', 'Sales', 'Mumbai', 50000, 2),
(105, 'Neha', 'IT', 'Mumbai', 70000, 5),
(106, 'Rohit', 'HR', 'Pune', 48000, 4),
(107, 'Pooja', 'Sales', 'Pune', 60000, 3),
(108, 'Akash', 'IT', 'Pune', 58000, 3),
(109, 'Kiran', 'Finance', 'Mumbai', 75000, 6),
(110, 'Tejas', 'Finance', 'Pune', 68000, 4),
(111, 'Riya', 'Sales', 'Mumbai', 52000, 2),
(112, 'Omkar', 'HR', 'Mumbai', 55000, 5),
(113, 'Sahil', 'IT', 'Mumbai', 62000, 4),
(114, 'Snehal', 'Finance', 'Pune', 72000, 5),
(115, 'Vishal', 'Sales', 'Pune', 57000, 3);

SELECT * FROM employees;


-- 20 Practical Questions

-- 1. Display all employees who are from Pune.
SELECT * FROM employees
WHERE city = 'Pune';

-- 2. Display employees whose salary is greater than 60,000.
SELECT * FROM employees
WHERE salary > 60000 ;

-- 3. Display employees who work in the IT department.
SELECT * FROM employees
WHERE department = 'IT';

-- 4. Display employees having more than 3 years of experience.
SELECT * FROM employees
WHERE experience > 3 ;

-- 5. Display employees from Pune whose salary is greater than 55,000.
SELECT * FROM employees
WHERE city = 'Pune'AND salary > 55000 ;

-- 6. Find the number of employees in each department.
SELECT department,COUNT(*) AS employee_count
FROM employees
GROUP BY department;

-- 7. Find the average salary of each department.
SELECT department ,AVG(salary) AS average_salary
FROM employees
GROUP BY department;

-- 8. Find the maximum salary in each department.
SELECT department,MAX(salary) AS max_salary
FROM employees
GROUP BY department;

-- 9. Find the minimum salary in each department.
SELECT department,MIN(salary) AS min_salary
FROM employees
GROUP BY department;

-- 10. Find the total salary paid by each department.
SELECT department,SUM(salary) AS total_salary
FROM employees
GROUP BY department;

-- 11. Find the number of employees in each city.
SELECT city,COUNT(*) AS employee_count
FROM employees
GROUP BY city;

-- 12. Find the average salary in each city.
SELECT city,AVG(salary) AS average_salary
FROM employees
GROUP BY city;

-- 13. Display departments having more than 2 employees.
SELECT department ,COUNT(*) AS employee_count
FROM employees
GROUP BY department
HAVING COUNT(*)>2;

-- 14. Display departments having an average salary greater than 55,000.
SELECT department,AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 55000;

-- 15. Display departments where the total salary is greater than 1,50,000.
SELECT department,SUM(salary) AS total_salary
FROM employees
GROUP BY department
HAVING SUM(salary) > 150000;

-- 16. Find the number of employees in each department from Pune.
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE city = 'Pune'
GROUP BY department;

-- 17.Find the average salary of each department for employees earning more than 50,000.
SELECT department, AVG(salary) AS total_salary
FROM employees
WHERE salary > 50000
GROUP BY department;

-- 18. Display departments having more than 2 employees whose salary is greater than 50,000.
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE salary > 50000
GROUP BY department
HAVING COUNT(*) > 2;

-- 19. Display cities having more than 3 employees and an average salary greater than 55,000.
SELECT city, COUNT(*) AS employee_count
FROM employees
GROUP BY city
HAVING COUNT(*) > 3
AND AVG(salary) > 55000;

-- 20. Find departments having at least 2 employees with more than 3 years of experience.
SELECT department, COUNT(*) AS employee_count
FROM employees
WHERE experience > 3
GROUP BY department
HAVING COUNT(*) >= 2;