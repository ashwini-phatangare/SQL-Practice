-- =========================================================
-- USER DEFINED FUNCTIONS AND STORED PROCEDURES
-- =========================================================

-- =========================================================
-- 1. CREATE DATABASE
-- =========================================================

CREATE DATABASE EmployeeManagement1;
USE EmployeeManagement1;


-- =========================================================
-- 2. CREATE EMPLOYEE TABLE
-- =========================================================

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(100),
    Department VARCHAR(30),
    Salary DECIMAL(10,2),
    Experience INT,
    JoiningDate DATE
);


-- =========================================================
-- 3. INSERT SAMPLE DATA
-- =========================================================

INSERT INTO Employee
(EmployeeID, EmployeeName, Department, Salary, Experience, JoiningDate)
VALUES
(101, "Amit",   "IT",       55000, 3, '2022-06-15'),
(102, "Sneha",  "HR",       45000, 2, '2023-01-10'),
(103, "Rahul",  "IT",       70000, 5, '2020-03-20'),
(104, "Priya",  "Finance",  60000, 4, '2021-08-12'),
(105, "Neha",   "HR",       50000, 3, '2022-11-05'),
(106, "Vikas",  "Finance",  75000, 6, '2019-04-08'),
(107, "Pooja",  "IT",       48000, 2, '2023-07-25'),
(108, "Rohit",  "Sales",    52000, 3, '2022-12-01'),
(109, "Kiran",  "Sales",    65000, 5, '2020-12-01'),
(110, "Snehal", "Finance",  58000, 3, '2022-02-28');


SELECT * FROM Employee;


-- =========================================================
-- FUNCTION 1 : Calculate Annual Salary
-- =========================================================

DELIMITER $$

CREATE FUNCTION CalculateAnnualSalary(
    monthly_salary DECIMAL(10,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
    RETURN monthly_salary * 12;
END $$

DELIMITER ;


-- Test Function 1

SELECT
    EmployeeName,
    Salary AS MonthlySalary,
    CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employee;


-- =========================================================
-- FUNCTION 2 : Calculate Bonus
-- Bonus = 10% of Salary
-- =========================================================

DELIMITER $$

CREATE FUNCTION CalculateBonus(
    salary DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN salary * 0.10;
END $$

DELIMITER ;


-- Test Function 2

SELECT
    EmployeeName,
    Salary,
    CalculateBonus(Salary) AS Bonus
FROM Employee;


-- =========================================================
-- FUNCTION 3 : Get Salary Grade
-- Salary >= 70000  -> A
-- Salary >= 50000  -> B
-- Salary < 50000   -> C
-- =========================================================

DELIMITER $$

CREATE FUNCTION GetSalaryGrade(
    salary DECIMAL(10,2)
)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN

    DECLARE grade VARCHAR(10);

    IF salary >= 70000 THEN
        SET grade = 'A';

    ELSEIF salary >= 50000 THEN
        SET grade = 'B';

    ELSE
        SET grade = 'C';

    END IF;

    RETURN grade;

END $$

DELIMITER ;


-- Test Function 3

SELECT
    EmployeeName,
    Salary,
    GetSalaryGrade(Salary) AS SalaryGrade
FROM Employee;


-- =========================================================
-- FUNCTION 4 : Get Experience Level
-- Experience >= 5  -> Senior
-- Experience >= 3  -> Mid-Level
-- Experience < 3   -> Junior
-- =========================================================

DELIMITER $$

CREATE FUNCTION GetExperienceLevel(
    exp_years INT
)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN

    DECLARE level_name VARCHAR(20);

    IF exp_years >= 5 THEN
        SET level_name = 'Senior';

    ELSEIF exp_years >= 3 THEN
        SET level_name = 'Mid-Level';

    ELSE
        SET level_name = 'Junior';

    END IF;

    RETURN level_name;

END $$

DELIMITER ;


-- Test Function 4

SELECT
    EmployeeName,
    Experience,
    GetExperienceLevel(Experience) AS ExperienceLevel
FROM Employee;


-- =========================================================
-- FUNCTION 5 : Calculate Net Salary
-- Net Salary = Salary + Bonus Percentage
-- =========================================================

DELIMITER $$

CREATE FUNCTION NetSalary(
    salary DECIMAL(10,2),
    bonus_percentage DECIMAL(5,2)
)
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN

    RETURN salary + (salary * bonus_percentage / 100);

END $$

DELIMITER ;


-- Test Function 5

SELECT
    EmployeeName,
    Salary,
    NetSalary(Salary, 10) AS NetSalary
FROM Employee;


-- =========================================================
-- 5. COMBINING MULTIPLE FUNCTIONS
-- =========================================================

SELECT
    EmployeeID,
    EmployeeName,
    Department,
    Salary AS MonthlySalary,

    CalculateAnnualSalary(Salary) AS AnnualSalary,

    CalculateBonus(Salary) AS Bonus,

    GetSalaryGrade(Salary) AS SalaryGrade,

    GetExperienceLevel(Experience) AS ExperienceLevel

FROM Employee;


-- =========================================================
-- 6. EMPLOYEES WITH SALARY GRADE A
-- =========================================================

SELECT
    EmployeeID,
    EmployeeName,
    Salary,
    GetSalaryGrade(Salary) AS SalaryGrade
FROM Employee
WHERE GetSalaryGrade(Salary) = 'A';


-- =========================================================
-- 7. SENIOR EMPLOYEES
-- =========================================================

SELECT
    EmployeeID,
    EmployeeName,
    Experience,
    GetExperienceLevel(Experience) AS ExperienceLevel
FROM Employee
WHERE GetExperienceLevel(Experience) = 'Senior';


-- =========================================================
-- PART B : STORED PROCEDURES
-- =========================================================


-- =========================================================
-- PROCEDURE 1 : Get All Employees
-- =========================================================

DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN

    SELECT *
    FROM Employee;

END $$

DELIMITER ;


-- Execute Procedure

CALL GetAllEmployees();


-- =========================================================
-- PROCEDURE 2 : Get Employees By Department
-- =========================================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(
    IN dept_name VARCHAR(30)
)
BEGIN

    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        Salary,
        Experience,
        JoiningDate

    FROM Employee

    WHERE Department = dept_name;

END $$

DELIMITER ;


-- Execute Procedure

CALL GetEmployeesByDepartment('IT');
CALL GetEmployeesByDepartment('Finance');
CALL GetEmployeesByDepartment('HR');


-- =========================================================
-- PROCEDURE 3 : Get Employees By Minimum Salary
-- =========================================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalary(
    IN min_salary DECIMAL(10,2)
)
BEGIN

    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        Salary

    FROM Employee

    WHERE Salary >= min_salary;

END $$

DELIMITER ;


-- Execute Procedure

CALL GetEmployeesBySalary(60000);


-- =========================================================
-- PROCEDURE 4 : Get Department Employees
-- With Minimum Salary
-- =========================================================

DELIMITER $$

CREATE PROCEDURE GetDepartmentEmployees(
    IN dept_name VARCHAR(30),
    IN min_salary DECIMAL(10,2)
)
BEGIN

    SELECT
        EmployeeID,
        EmployeeName,
        Department,
        Salary

    FROM Employee

    WHERE Department = dept_name
      AND Salary >= min_salary;

END $$

DELIMITER ;


-- Execute Procedure

CALL GetDepartmentEmployees('IT', 50000);
CALL GetDepartmentEmployees('Finance', 60000);


-- =========================================================
-- PROCEDURE 5 : Update Employee Salary
-- =========================================================

DELIMITER $$

CREATE PROCEDURE UpdateSalary(
    IN emp_id INT,
    IN increment_percentage DECIMAL(5,2)
)
BEGIN

    UPDATE Employee

    SET Salary =
        Salary + (Salary * increment_percentage / 100)

    WHERE EmployeeID = emp_id;

END $$

DELIMITER ;


-- =========================================================
-- CHECK BEFORE UPDATE
-- =========================================================

SELECT *
FROM Employee
WHERE EmployeeID = 101;


-- =========================================================
-- EXECUTE UPDATE PROCEDURE
-- =========================================================

CALL UpdateSalary(101, 10);


-- =========================================================
-- CHECK AFTER UPDATE
-- =========================================================

SELECT *
FROM Employee
WHERE EmployeeID = 101;