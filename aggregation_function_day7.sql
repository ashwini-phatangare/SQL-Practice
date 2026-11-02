-- Day7 
-- CHAPTER 6 : FUNCTIONS IN SQL
-- Aggregation | String | Date | Mathematical Function

-- ------------------------------------------------------------

create database func_demo;
use func_demo;

-- -------------------------------------------------------------------

-- 1 .CREATE TABLE

-- ----------------------------------------------------------------------
CREATE TABLE employees (
emp_id INT PRIMARY KEY,
emp_name VARCHAR(50),
department VARCHAR(30),
salary INT,
join_date DATE
);

-- -----------------------------------------------------------------------------
 -- 2 INSERT SAMPLE DATA
 -- ---------------------------------
 INSERT INTO employees VALUES
 (101,"Arya", "HR",   45000,'2023-01-10'),
 (102,"Rohit", "IT",    55000,'2022-03-15'),
 (103,"Sana", "HR",     40000,'2023-05-20'),
 (104,"Karan", "Finance", 60000,'2021-11-05'),
 (105,"Priya", "IT",       48000,  '2022-08-12'),
 (106,"Amit", "Marketing"  ,50000,'2023-09-25');
 
 SELECT * FROM employees;
 -- ----------------------------------------------------------------
 -- 3 AGGREGATION FUNCTIONS.
 -- --------------------------------------------------------------------
 -- total salary
 SELECT SUM(salary) AS total_salary FROM employees;
 
 -- count of employees
 SELECT COUNT(*) AS total_employee FROM employees;
 
 -- Minimum salary
 SELECT MIN(salary) AS min_salary FROM employees;
 
 -- Maximum Salary
 SELECT MAX(salary) AS max_salary FROM employees;
 
 -- ------------------------------------------------
 -- 4 STRING FUNCTIONS
 -- ---------------------------------------------------
 
 -- Convert names to uppercase
 SELECT emp_name,UPPER(emp_name) AS upper_name FROM employees;
 
 
 -- convert names to lowercase
 SELECT emp_name ,LOWER(emp_name) AS lower_name FROM employees;
 
 
 -- length of employees names
 SELECT emp_name,LENGTH(emp_name) AS name_length FROM employees;
 
 -- Concatenate name + department
 SELECT CONCAT(emp_name, ' - ',department) AS employee_info FROM employees;
 
 -- Extract first 3 letters from name
 SELECT emp_name ,SUBSTRING(emp_name,1,3) AS short_name FROM employees;
 
 -- Trim spaces
 SELECT TRIM('  SQL Functions  ') AS trimmed_text;
 
 -- Reolace letters inside string
 SELECT REPLACE('Database Management','base','room') AS repaced_text;
 
 -- ------------------------------------------------------------
 -- 5 DATE FUNCTIONS
 -- ------------------------------------------------------------
 -- Current date & time
 SELECT NOW() AS current_datetime;
 
 -- Current date only
 SELECT CURDATE() AS today_date;
 
 -- Extract year,month,day
 SELECT emp_name,
 YEAR(join_date) AS join_year,
 MONTH(join_date) AS join_month,
 DAY(join_date) AS join_day
 FROM employees;
 
 -- Calculate work duration (days)
 SELECT emp_name,
 DATEDIFF(CURDATE(),join_date) AS days_worked
 FROM employees;
 
 -- Add 30 days to join date
 SELECT emp_name,DATE_ADD(join_date,INTERVAL 30 DAY) AS date_plus_30
 FROM employees;
 
 -- subtract 45 days
 SELECT emp_name,DATE_SUB(join_date,INTERVAL 45 DAY) AS date_minus_45
 FROM employees;
 
 -- ------------------------------------------------------
 -- 6 MATHENATICAL FUNCTIONS
 -- ----------------------------------------------------
 
 -- Absolute value
 SELECT ABS(-50) AS absolute_value;
 
 -- Round salary to nearest thousands
 SELECT emp_name,ROUND(salary,-3) AS rounded_salary FROM employees;
 
 -- Ceiling(always rounds up)
 SELECT CEIL(45.3) AS ceiling_value;
 
 -- floor(always rounds down)
 SELECT FLOOR(45.9) AS floor_value;
 
 -- Power(2^3)
 SELECT POWER(2,3) AS power_result;
 
 -- Square root
 SELECT SQRT(144) AS sqrt_value;
 
 -- Modulo(remainder)
 SELECT MOD(27,4) AS remainder_value;
 
