-- user defined functions and stored procedure
-- Delimiter : simple jya thikani end with semicolon asel tithe query end hote ,
-- CREATE DATABASE
-- -------------------------------------------
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

-- --------------------------------------------------------
-- CREATE EMPLOYEE TABLE
-- ----------------------------------------------------------

CREATE TABLE Employee (
		EmployeeID INT PRIMARY KEY,
        EmployeeName VARCHAR(100),
        Department VARCHAR(30),
        Salary DECIMAL(10,2),
        Experience INT,
        JoiningDate DATE
        );
        
        INSERT INTO Employee
        (EmployeeID,EmployeeName,Department,Salary,Experience,JoiningDate)
        VALUES
        (101,"Amit","IT",55000,3,'2022-06-15'),
        (102,"Sneha","HR",4500,2,'2023-01-10'),
        (103,"Rahul","IT",70000,5,'2020-03-20'),
        (104,"Priya","Finance",60000,4,'2021-08-12'),
        (105,"Neha","HR",50000,3,'2022-11-05'),
        (106,"Vikas","Finance",75000,6,'2019-04-08'),
        (107,"Pooja","IT",48000,2,'2023-07-25'),
        (108,"Rohit","Sales",52000,3,'2022-12-01'),
        (109,"Kiran","Sales",65000,5,'2020-12-01'),
        (110,"Snehal","Finance",58000,3,'2022-02-28');
        
        SELECT * FROM Employee;
        -- --------------------------------------------------
        
        /* ==============================================================
        
        FUNCTION 1
        Calculate Annual Salary
        
        Input:Monthly Salary
        Output:Annual Salary
        =================================================*/
        
DELIMITER $$
        
CREATE FUNCTION CalculateAnnualSalary(monthly_salary DECIMAL(10,2))
RETURNS DECIMAL(12,2)
DETERMINISTIC
BEGIN
	  RETURN monthly_salary * 12;
END $$
DELIMITER ;   
-- ----------------------------------------------------
/* Test Function 1 */

SELECT 
      EmployeeName,
      Salary as MonthlySalary,
      CalculateAnnualSalary(Salary) AS AnnualSalary
FROM Employee;      


-- -----------------------------------------
/* Function 2
Calculate Bonus
Bonus = 10% of salary */

DELIMITER $$
CREATE FUNCTION CalculateBonus(salary DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
      RETURN salary *0.10;
END $$

DELIMITER ;

/* Test Function 2*/
SELECT
        EmployeeName,
        Salary,
        calculateBonus(Salary)AS Bonus
FROM Employee;
  -- -------------------------------------------------------
  
  /* FUNCTION 3
  Get Salary Grade
  Salary >= 70000 -> A
  Salary >= 50000 -> B
  Salary >= 50000 -> C
  ============================================*/
  
DELIMITER $$
CREATE FUNCTION GetSalaryGrade(salary DECIMAL(10,2))
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

/* Test Function 3 */
SELECT 
       EmployeeName ,
       Salary,
       
       
/* ========================================
FUNCTION 4
Get Experience Level
Experience >= 5 -> Senior
Experience 3-4 -> Mid-Level
Experience < 3 -> Junior
=========================================================*/


DELIMITER $$
CREATE FUNCTION GetExperienceLevel(exp_years INT)
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

/* Test Function */

SELECT
       EmployeeName,
       Experience,
       GetExperienceLevel(Experience) AS ExperienceLevel
FROM Employee;       


/* Function 5 */
 /* calculate Net Salary
 Input:
 Salary
 Bonus Percentage 
 
 Output:
 Salary + Bonus
  (salary + (salary * bonus_percentage/100)
 */
 
 DELIMITER $$
 CREATE FUNCTION NetSalary(salary DECIMAL(10,2))
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
      RETURN Salary + (Salary * bonus_percentage/100;)
 END
 DELIMITER $$;
 
 /* Test Function */
 SELECT
        EmployeeName,
        Salary,
        calculateNetSalary(Salary)AS bonus_percentage
FROM Employee;
      /* =====================================================
5.COMBINING MULTIPLE FUNCTIONS
===========================================================*/
SELECT
        EmployeeID,
        EmployeeName,
        Department,
        Salary AS MonthlySalary,
        
        CalculateAnnualSalary(Salary)
           AS AnnualSalary,
           
        CalculateBonus(Salary)
            AS Bonus,
            
         GetSalaryGrade(Salary)
             AS SalaryGrade,
             
          GetExperienceLevel(Experience)
               AS ExperienceLevel
               
FROM Employee;               

/* ===========================================================
6.EMPLOYEES WITH SALARY GRADE A
==============================================================*/

SELECT
        EmployeeID,
        EmployeeName,
        Salary,
        GetSalaryGrade(Salary) AS SalaryGrade
FROM Employee
WHERE GetSalaryGrade(Salary) = 'A';

/*================================================
7.SENIOR EMPLOYEES
===================================================*/

SELECT
      EmployeeID,
      EmployeeName,
      Experience,
      GetExperienceLevel(Experience) AS ExperienceLevel
FROM Employee
WHERE GetExperienceLevel(Experience) = 'Senior';
      
      
      
    /*===================================================================
    PART B
    STORED PROCEDURE : predefined set of sql statement
    ===============================================*/
   
   
   -- PROCEDURE 1
    -- Get All Employees
    
    DELIMITER $$
    CREATE PROCEDURE GetAllEmployees()
    BEGIN
         SELECT *
         FROM Employee;
    END $$
    DELIMITER ;
    /* Execute procedure*/
    CALL GetAllEmployees();

    -- --------------------------------------------------------------------
  -- GET EMPLOYEES BY DEPARTMENT
  
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
 FROM employee
 WHERE Department = dept_name;
 END $$
         
 /* Execute procedure*/
 CALL GetEmployeesByDepartment('IT');
 CALL GetEmployeesByDepartment('Finance');
 CALL GetEmployeesByDepartment('HR');
 
 /*==============================================================
 PROCEDURE 3
 Get Employees By Minimum Salary
 ================================================================*/
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

/* Execute Procedure*/
CALL GetEmployeesBySalary(60000);           
 
 /*==========================================
 PROCEDURE 5
 Get Employees By departement
 AND Minimum Salary
 =================================================*/
 
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

/* Execute Procedure*/
CALL GetDepartmentEmployees('IT',50000);
CALL GetDepartmentEmployees('Finance',60000);    

/*===========================================================
PROCEDURE 6
Update Employee Salary
=======================================================*/
CREATE PROCEDURE UpdateSalary(
       IN emp_id INT,
       IN increment_percentage DECIMAL(5,2)
)
BEGIN
     UPDATE Employee       
     SET Salary = 
     Salary + ()
     
     
     
     
    /* Check Before Update */
    SELECT *
    FROM Employee
    WHERE EmployeeID = 101;
    
    /* Execute */
    CALL UpdateSalary(101,10);
    
    /* Check After Update */
    SELECT * 
    FROM Employee
    WHERE EmployeeID = 101;
    