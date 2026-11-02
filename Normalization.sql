-- date : 28 sep 2026

-- NORMALIZATION : 

-- STEP 0 : UNNORMALIZED TABLE(UNF)
-- Problem : Multiple values in single column
CREATE DATABASE Normalization_Demo;
USE Normalization_Demo;

CREATE TABLE Student_UNF (
    StudentID INT,
    StudentName VARCHAR(50),
    CourseID VARCHAR(50),
    CourseName VARCHAR(50),
    InstructorName VARCHAR(50),
    PhoneNumbers VARCHAR(100) 
    );
    DROP TABLE Student_UNF;
    CREATE TABLE Student_UNF (
    StudentID INT,
    StudentName VARCHAR(50),
    CourseID VARCHAR(50),
    CourseName VARCHAR(50),
    InstructorName VARCHAR(50),
    PhoneNumbers VARCHAR(100) 
    );
    INSERT INTO Student_UNF VALUES
    (101,'Amit','CSE101','DBMS','Dr.Sharma','9921760701,8796871260'),
    (102,'Neha','CSE102','DSA','Dr.Mehta','7822808229'),
    (103,'Rohit','CSE103','OS','Dr.Verma','9988776655,9123984567');
    
    select * from Student_UNF;
    
    /* ISSUES
    - Repeating groups(PhoneNumbers)
    */
    -- ---------------------------------------------------------
   --  STEP 1 :FIRST NORMAL FORM(1NF)
   -- Rule : Atomic values (no multiple values in a column)
   -- Solution : Split multiple phone numbers into rows
   
   -- --------------------------------------------------------------
   
   CREATE TABLE Student_1NF (
        StudentID INT,
        StudentName VARCHAR(50),
        CourseID VARCHAR(10),
        CourseName VARCHAR(50),
        InstructorName VARCHAR(50),
        PhoneNumber VARCHAR(15)
        );
        
INSERT INTO Student_1NF VALUES
(101,'Amit','CSE101','DBMS','Dr.Sharma','9921760701'),
(101,'Amit','CSE101','DBMS','Dr.Sharma','9876432569'),
(102,'Neha','CSE102','DSA','Dr.Mehta','7845126549'),
(103,'Rohit','CSE103','OS','Dr.Verma','7885463217'),
(103,'Rohit','CSE103','OS','Dr.Verma','6576543216');

SELECT * FROM Student_1NF;







/*==========================================================
STEP 2 : SECOND NORMAL FORM(2NF)
Rule :
- Must be in 1NF
- No partial 

================================================================*/

/* STUDENT TABLE */
CREATE TABLE Student (
   StudentId INT PRIMARY KEY,
   StudentName VARCHAR(50)
   );
   
INSERT INTO Student VALUES
(101,'Amit'),
(102,'Neha'),
(103,'Rohit') ;  
    
    
 /* Course table*/
 CREATE TABLE Course (
 CourseID VARCHAR(10) PRIMARY KEY,
 CourseName VARCHAR(50),
 InstructorName VARCHAR(50)
 );
 
 INSERT INTO Course VALUES
 ('CSE101','DBMS','Dr.Sharma'),
 ('CSE102','DSA','Dr.Mehta'),
 ('CSE103','OS','Dr.Verma');

/* ENROLLMENT TABLE (Bridge Table) */
CREATE TABLE Enrollment (
StudentID INT,
CourseID VARCHAR(10),
PhoneNumbers VARCHAR(15),
PRIMARY KEY (StudentID,CourseID,PhoneNumber),
FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);
INSERT INTO Enrollment VALUES
(101,'CSE101','9921760701'),
(101,'CSE101',9824356785),
(102,'CSE102','7865439280'),
(103,'CSE103',7654378920),
(103,'CSE103',912345643578);