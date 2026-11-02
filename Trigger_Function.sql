-- Date 26 September 2026
-- SQL TRIGGER PRACTICAL
-- Topic : Triggers in SQL
-- database : MySQL
-- --------------------------------------------------------------------------------
-- Trigger is a database object that automatically execute
-- when a specified event is occur
-- ----------------------------------------------------------------------

-- -------------------------------------------------------------------
-- CREATE DATABASE
-- ---------------------------------------------------------------------


CREATE DATABASE Trigger_Practical;
USE Trigger_Practical;

-- ------------------------------------------------------------------------
-- 2.CREATE EMPLOYEE TABLE
-- ---------------------------------------------------

CREATE TABLE Employee(
EmpID INT PRIMARY KEY AUTO_INCREMENT,
EmpName VARCHAR(50) NOT NULL,
Department VARCHAR(50),
Salary DECIMAL(10,2),
JoiningDate DATE
);
-- 

-- INSERT SAMLE DATA

INSERT INTO Employee (EmpName,Department,Salary,JoiningDate)
VALUES
('Raj','IT',50000,'2025-01-10'),
('Rahul','HR',40000,'2025-02-15'),
('Priya','Finance',45000,'2025-03-20'),
('Amit','IT',55000,'2025-04-05');

SELECT * FROM Employee;

-- CREATE AUDIT TABLE

CREATE TABLE Employee_Audit (
AuditID INT PRIMARY KEY AUTO_INCREMENT,
EmpID INT,
ActionType VARCHAR(20),
OldSalary DECIMAL(10,2),
NewSalary DECIMAL(10,2),
ActionDate TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Employee_Audit;

-- -------------------------------------------
-- AFTER INSERT TRIGGER

DELIMITER $$
CREATE TRIGGER after_employee_insert
AFTER INSERT ON Employee
FOR EACH ROW
BEGIN
      INSERT INTO Employee_Audit
      (EmpId,ActionType,OldSalary,NewSalary)
      VALUES
      (NEW.EmpID,'INSERT',NULL,NEW.Salary);
END $$
DELIMITER ;

/* Test INSERT Trigger*/
INSERT INTO Employee      
(EmpName,Department,Salary,JoiningDate) 
VALUES('Sneha','IT',60000,'2025-05-10');

SELECT * FROM Employee;
SELECT * FROM Employee_Audit;

-- AFTER UPDATE TRIGGER
-- Purpose:
-- Store old and new Salary whenever salary is updated

DELIMITER $$
CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
      INSERT INTO Employee_Audit
       (EmpID,ActionType,OldSalary,NewSalary)
       VALUES
       (OLD.EmpID,'UPDATE',OLD.Salary,NEW.Salary);
END $$
DELIMITER ;

/* TEST UPDATE TRIGGER */

UPDATE Employee
SET Salary = 65000
WHERE EmpID = 5;

SELECT * FROM Employee;
SELECT * FROM Employee_Audit;

-- AFTER DELETE TRIGGER

DELIMITER $$
CREATE TRIGGER after_employee_delete
AFTER DELETE ON Employee
FOR EACH ROW
BEGIN
      INSERT INTO Employee_Audit
      (EmpID,ActionType,OldSalary,NewSalary)
      VALUES
      (OLD.EmpID,'DELETE',OLD.Salary,NULL);
END $$

DELIMITER ;

/* TEST DELETE TRIGGER*/

DELETE FROM Employee      
WHERE EmpID = 4;

SELECT * FROM Employee;
SELECT * FROM Employee_Audit;

-- -----------------------------------------------------------------------
-- BEFORE INSERT TRIGGER
-- PURPOSE :
-- Prevent employee from being inserted with negative salary.

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
       IF NEW.Salary < 0 THEN
       SIGNAL SQLSTATE '45000'
       SET MESSAGE_TEXT = 'Salary cannot be negative';
       END IF ;
       
END$$       
   
   
/* TEST BEFORE INSERT TRIGGER*/
-- This statement will generate a error

INSERT INTO Employee   
(EmpName,Department,Salary,JoiningDate)
VALUES
('Test','IT',-5000,'2025-06-01');

/* ==========================================================
9.TEST BEFORE UPDATE TRIGGER

=============================================================*/
-- This Statement will generate an error

UPDATE Employee
SET Salary = -10000
WHERE EmpID = 1;

UPDATE Employee
SET Salary = 75000
WHERE EmpID = 1;
select * from Employee_Audit;