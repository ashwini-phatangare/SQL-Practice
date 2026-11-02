-- assignment

-- create  a table name as EMP
-- having columns
-- ID with primary key and int data type
-- name having datatype varchar(100)
-- age having int datatype 
-- dept having varchar(50)
-- exp(yr) having int
-- salary numeric(10,2) 

create database emp;
use emp;
DROP TABLE IF EXISTS employee;
CREATE TABLE employee(
ID int primary key,
name varchar(100),
age int,
dept varchar(50),
exp_yrs int,
salary numeric(10,2)
);
insert into employee values
(1001,"Komal",26,"Finance",3,54000),
(1002,"Divya",23,"IT","34000"),
(1003,"Rahul",30,"HR",6,70000),
(1004,"Ram",28,"Finance",5,49000),
(1005,"Dipak",26,"IT",3,67000),
(1006,"Piyush",25,"HR",3,62000),
(1007,"Komal",24,"HR",2,40000);

select * from employee;

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

-- que1.
SELECT * From employee;
SELECT name ,dept and salary FROM emp;

-- que2
SELECT * FROM employee;
WHERE salary > 