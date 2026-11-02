-- Create Database
CREATE DATABASE Join_Practice;

-- Select Database
USE Join_Practice;


-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);


-- Insert Employees Data
INSERT INTO employees VALUES
(1, 'Rahul', 10),
(2, 'Priya', 20),
(3, 'Amit', 10),
(4, 'Sneha', 30);


-- Create Departments Table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);


-- Insert Departments Data
INSERT INTO departments VALUES
(10, 'IT'),
(20, 'HR'),
(30, 'Sales'),
(40, 'Finance');


-- Check Tables
SELECT * FROM employees;

SELECT * FROM departments;

-- INNER JOIN
SELECT e.name,d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

-- LEFT JOIN
SELECT e.name,d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

-- RIGHT JOIN
SELECT e.name,d.dept_name
FROM employees e
RIGHT JOIN departments d
ON d.dept_id = e.dept_id;

-- CROSS JOIN
SELECT e.name,d.dept_name
FROM employees e
CROSS JOIN departments d;