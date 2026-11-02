-- Day6
create database join_assignment;
use join_assignment;

-- employees table
CREATE TABLE EMP(
	emp_id int primary key,
    emp_name varchar(90),
    dept_id int,
    salary int
);

-- insert 10 employees 
insert into emp values
(1,"rahul",101,45000),
(2,"Priya",102,50000),
(3,"Amit",101,40000),
(4,"sneha",103,55000),
(5,"Rohit",104,48000),
(6,"Neha",102,52000),
(7,"Karan",105,60000),
(8,"Pooja",103,47000),
(9,"Vinay",NULL,42000),
(10,"Anjali",106,58000);

-- department table
create table dept(
dept_id int primary key,
dept_name varchar(50),
location varchar(50));

insert into dept values
(101,"IT","Pune"),
(102,"HR","Mumbai"),
(103,"Finance","Pune"),
(104,"Sales","Delhi"),
(105,"Marketing","Bangalore"),
(107,"Operations","Chennai");

-- 
-- que1 : show employee name and dept name only when the dept exist
SELECT e.emp_name,d.dept_name
from emp e
inner join dept d
on e.emp_name = d.dept_id;

-- que2: The company want a list of all employee,including employee who 
-- do not have a dept assigned
select e.emp_name ,d.dept_name
from emp e
left join dept d
on e.dept_id = d.dept_id;

-- que 3: The data quality team wants to find employees 
-- whose dept id does not exist in the dept table
-- (find unmatched records)

select e.emp_name,d.dept_id
from emp e
left join dept d
on e.dept_id = d.dept_id 
where d.dept_id is null;

-- que 4:mangement wants to see All dept,
-- including depts that currently have zero emp

select d.dept_name,e.emp_name
from dept d
left join emp e
on d.dept_id = e.dept_id;

-- or

select d.dept_name,e.emp_name
from emp e
right join dept d
on d.dept_id = e.dept_id;

-- que 5 : The company wants a list of employee who work in pune
-- and show there emp name and dept name
select e.emp_name,d.dept_name,d.location
from emp e
inner join dept d
on e.dept_id = d.dept_id
where d.location = "Pune";

-- que 6: HR wants to identify department 
-- that currently have zero employee
select d.dept_id,d.dept_name
from dept d
left join emp e
on d.dept_id = e.dept_id
where e.emp_id is null;

-- que 7: management wants to know how many emp are working
-- in each departments,including dept with zero emp
-- (JOIN + GROUP BY)
-- Left Join
-- aggregation function COUNT

USE join_assignment;
SELECT d.dept_name,COUNT(e.emp_id) AS employee_count
FROM dept d
LEFT JOIN emp e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

