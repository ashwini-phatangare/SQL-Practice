-- windows functions - multiple rows vr kam krto  without collapse
create database windows_functions;
use windows_functions;
-- Create employee table
create table emp(
emp_id int,
emp_name varchar(100),
dept varchar(30),
salary int
);

-- insert data

insert into emp values
(1,"Amit","IT",60000),
(2,"Rahul","IT",75000),
(3,"Priya","IT",75000),
(4,"Sneha","HR",50000),
(5,"Neha","HR",65000),
(6,"Rohit","HR",55000),
(7,"Kiran","Sales",45000),
(8,"Pooja","Sales",60000),
(9,"Akash","Sales",70000);

select * from emp;

-- row_number() : give a unique number to employees according to sales.
select emp_name,dept,salary,row_number() over(order by salary desc) as row_num
from emp;

-- even if two employees have the same salary gives them different row number

-- row_number() with partition by
select emp_name,dept,salary,
row_number() over( partition by dept
                    order by salary desc
                    ) as dept_rank
 from emp;  
 
 -- partition by : create a separate window for every department
 
 -- rank()
 select emp_name,
           dept,
            salary,
			rank() over(order by salary desc) as salary_rank
 from emp;
 
-- for rahul and priya both have 75K salary,so both get same rnk 1 and next employee rank 3

-- dense rank()
select emp_name,
           dept,
            salary,
			dense_rank() over(order by salary desc) as salary_rank
 from emp;


-- find highest salary emp in each dept
with ranked_emp as
(
select
           emp_name,
           dept,
           salary,
           row_number() over(
           partition by dept
           order by salary desc
           ) as rn
         from emp
)
select * 
from ranked_emp
where rn = 1;

-- dept wise avg salary
select
        emp_name,
		dept ,
        salary,
        avg(salary) over(
        partition by dept)
        as avg_dept_salary
from emp;

-- difference from dept avg
-- how much and emp salary is above or below their dept avg

select emp_name,dept,salary,
     avg(salary) over(partition by dept)as avg_salary,
 salary - avg(salary) over(partition by dept) as salary_difference
 from emp;
        
-- running total

select emp_name,salary,
sum(salary) over(order by emp_id) as running_total
from emp;

-- the total keeps increasing row by row.


-- practice que
-- 1.find each emp salary and their dept max salary
-- 2.find diff btw each emp salary and the highest in their dept
-- 3.find the second highest salary emp in each dept
-- 4.assign a rank to emp based on salary within each dept

 -- 1.find each emp salary and their dept max salary
 select
         emp_name
        