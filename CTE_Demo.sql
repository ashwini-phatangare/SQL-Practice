-- day 10
-- CTE stands for Common Table Expression. It is a temporary result set created using the WITH keyword.

-- Simple meaning:

-- CTE म्हणजे आपण एखादी temporary query/result तयार करतो आणि त्याला एक नाव देतो.

-- नंतर त्या नावाचा वापर main query मध्ये करू शकतो.
-- WITH keyword वापरतो	
-- Read करायला easy	
-- Complex queries साठी useful	
-- Temporary result ला name देतो	
-- Multiple CTEs वापरू शकतो


create database CTE_Demo;
use CTE_Demo;

-- create table
create table employees(
emp_id int primary key,
name varchar(50),
dept varchar(30),
salary numeric
);

insert into employees values
(1,"rahul","IT",50000),
(2,"priya","HR",45000),
(3,"Amit","IT",70000),
(4,"Sneha","Sales",60000),
(5,"Pooja","IT",80000);
select * from employees;
-- problem : find emp whose salary is greater than 60000 using CTE
with high_salary as
(
select *
from employees
where salary > 60000
)
select * from high_salary;

-- CTE with aggregation
-- que:find dept where the avg salary is greater than 60000

with dept_sal as
(
    select dept,avg(salary) as avg_salary
    from employees
    group by dept
)
select dept,avg_salary
from dept_sal
where avg_salary > 60000;


-- multiple CTEs
with
department_avg as
(
   select dept,avg(salary) as avg_Sal
   from employees
   group by dept 
),
high_paid as
(
   select *
   from employees
    where salary > 60000
)
select *
from high_paid;


-- diff between subquery and CTE
-- 1. CTE uses WITH whereas Subquery written inside query
-- 2.CTE is easier to read where as subquery can become difficult to read
-- 3. CTE is used for complex queries where as subqueries are good for smaller queries
-- 4.CTE can improve query organization where as useful for  simple intermediate result.


-- find emp whose salary is above the companys avg salary
with company_avg as 
(
   select avg(salary) as avg_sal
   from employees
)
select * 
from employees
where salary > (select avg_sal from company_avg);

-- find the high paid employee in each dept
with dept_max_sal as
(
   select dept,max(salary) as max_sal
   from employees
    group by dept
)
select e.name,e.dept,e.salary
from employees e
join dept_max_sal d
on e.dept = d.dept and e.salary = d.max_sal;