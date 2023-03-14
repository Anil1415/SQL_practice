-- Recursive SQL Queries
--
-- Syntax of writing a recursive sql query
with recursive cte as
		(base query -- this gets executed in the first iteration
		union/ union all
		recursive part of the query -- this gets executed for each iteration except first
		termination condition)	
main query;

-- print numbers 1 to 10 without using any inbuilt functions.
--
with recursive cte as
	(
		select 1 as n);
--				
with recursive numbers as
	(
		select 1 as n
		union
		select n+1
		from numbers
		where n<10
	)
select * 
from numbers;




CREATE TABLE emp_details ( id int PRIMARY KEY, name varchar(100), manager_id int, salary int, designation varchar(100) );


INSERT INTO emp_details VALUES (1, 'Shripadh', NULL, 10000, 'CEO'); INSERT INTO emp_details VALUES (2, 'Satya', 5, 1400, 'Software Engineer'); INSERT INTO emp_details VALUES (3, 'Jia', 5, 500, 'Data Analyst'); INSERT INTO emp_details VALUES (4, 'David', 5, 1800, 'Data Scientist'); INSERT INTO emp_details VALUES (5, 'Michael', 7, 3000, 'Manager'); INSERT INTO emp_details VALUES (6, 'Arvind', 7, 2400, 'Architect'); INSERT INTO emp_details VALUES (7, 'Asha', 1, 4200, 'CTO'); INSERT INTO emp_details VALUES (8, 'Maryam', 1, 3500, 'Manager'); INSERT INTO emp_details VALUES (9, 'Reshma', 8, 2000, 'Business Analyst'); INSERT INTO emp_details VALUES (10, 'Akshay', 8, 2500, 'Java Developer');

select * from emp_details;

-- Find the hierarchy of employees under a given manager 'Asha'
-- Asha --> Michaeel, Arvind
-- Michael --> Satya, Jia, David

with recursive cte as
		(
			select * , 1 as iteration
			from emp_details where name = 'Asha'
			union all 
			select e.*, (iteration+1) as iteration
			from cte
			join emp_details e on cte.id = e.manager_id
		)
select * 
from cte;
--
--1st iteration
--
select * , 1 as iteration from emp_details where name = 'Asha';
--
-- 2nd iteration
select e.*, (iteration+1) as iteration
			from (select * , 1 as iteration from emp_details where name = 'Asha')cte
			join emp_details e on cte.id = e.manager_id;
--
-- 3rd iteration



--
-- Rewrite this query to display only
--emp_id, emp_name, manager_name
with recursive cte as
		(
			select emp.id as emp_id, emp.name as emp_name, mng.name as manager_id , 1 as iteration
			from emp_details emp
			join emp_details mng on emp.manager_id= mng.id
			where emp.name = 'Asha'
			
			union all 
			
			select e.id as emp_id, e.name as emp_name, cte.name as manager_name, (iteration+1) as iteration
			from cte
			join emp_details e on cte.emp_id = e.manager_id
		)
select * 
from cte;
---


-- Find the hierarchy of managers for a given employee "David"
-- David manager > Michael> Asha> Shripad

 with recursive cte as
		(
			select * , 1 as iteration
			from emp_details where name = 'David'
			union all 
			select e.*, (iteration+1) as iteration
			from cte
			join emp_details e on cte.manager_id = e.id
		)
select * 
from cte;