create database employee;
use employee;

CREATE TABLE emp(
ID int primary key,
name varchar(100),
age int,
dept varchar(50),
exp_yrs int,
salary numeric(10,2)
);
insert into emp values
(1001,"Komal",26,"Finance",3,54000),
(1002,"Divya",23,"IT",3,40000),
(1003,"Rahul",30,"HR",6,70000),
(1004,"Ram",28,"Finance",5,49000),
(1005,"Dipak",26,"IT",3,67000),
(1006,"Piyush",25,"HR",3,62000),
(1007,"Komal",24,"HR",2,40000);

select * from emp;
--  que 1.select only name ,dept and salary
-- que 2. select records whose salary greater than 50000
-- que 3 .select employees from HR dept
-- que 4. sort the table in descending order by salary
-- que 5. extract all employees whose exp is 3
-- que 6.fetch employees whose name start with "P"
-- que 7. first sort in asc order by dept and then desc order by salary
-- que 8. find employees whose age between 20to 25
-- que 9.find employee whose age is less than 25 and salary less than 40k
-- que 10.find employees whose age is greater than 25 or experience less than 2 years.
-- que 11.update age of employee ID 1003 by 2 years
-- que 12. update salary of employee ID 1005 by 4 years
-- que 13.update experience of emp 1001 by 1 year
-- que 14 .delete employee whose age is less than 25


--  que 1.select only name ,dept and salary
SELECT name,dept,salary FROM emp;

-- que 2. select records whose salary greater than 50000
SELECT * FROM emp
WHERE salary > 50000;

-- que 3 .select employees from HR dept
SELECT * FROM emp
WHERE dept = 'HR';

-- que 4. sort the table in descending order by salary
SELECT * FROM emp
ORDER BY salary DESC;

-- que 5. extract all employees whose exp is 3
SELECT * FROM emp
WHERE exp_yrs = 3;

-- que 6.fetch employees whose name start with "P"
SELECT * FROM emp
WHERE name LIKE 'p%';

-- que 7. first sort in asc order by dept and then desc order by salary
SELECT * FROM emp
ORDER BY dept ASC,salary DESC;

-- que 8. find employees whose age between 20to 25
SELECT * FROM emp
WHERE age BETWEEN 20 AND 25;

-- que 9.find employee whose age is less than 25 and salary less than 40k

SELECT * FROM emp
WHERE age < 25 AND salary < 40000;

-- que 10.find employees whose age is greater than 25 or experience less than 2 years.
SELECT * FROM emp
WHERE age > 25 OR exp_yrs < 2;

-- que 11.update age of employee ID 1003 by 2 years
UPDATE emp
SET age = age + 2
WHERE id = 1003;

SELECT * FROM emp;

-- que 12. update salary of employee ID 1005 by 4 years
UPDATE emp
SET salary = salary + 4
WHERE id = 1005;
 SELECT * FROM emp;
 
 -- que 13.update experience of emp 1001 by 1 year
 UPDATE emp
 SET exp_yrs = exp_yrs + 1
 WHERE id = 1001;
 
 SELECT * FROM emp;
 
 -- que 14 .delete employee whose age is less than 25
 SET SQL_SAFE_UPDATES = 0;
 DELETE FROM emp
 WHERE age < 25;
 
 SELECT * FROM emp;
 
 
 