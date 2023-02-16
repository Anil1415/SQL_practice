-- select * from information_schema.tables where table_schema='public';
select * from information_schema.tables where table_schema = 'public';
drop table products_constraints, products1;
---------
phone int check (phone <= 9999999999)


--> How SQL looks at data:
 123 --> int
 '123' --> string
 '01-01-2020' --> string
 to_date('01-01-2020', 'dd-mm-yyyy') --> date

-------------



--> Syntax for alter table in PostgreSQL

-- Add new column
    ALTER TABLE table_name
	ADD COLUMN column_name datatype column_constraint;

alter table products
	drop column if exists branch_location;
alter table products 
	add column branch_location varchar(50) default 'Bangalore';
select * from products;
--
-- Add new column
	ALTER TABLE table_name
	DROP COLUMN column_name;

-- Add new column
	ALTER TABLE table_name
	RENAME COLUMN column_name
	TO new_column_name;

-- Add new column
	ALTER TABLE table_name
	ALTER COLUMN column_name
	[SET DEFAULT value | DROP DEFAULT];

-- Add new column
	ALTER TABLE table_name
	ADD CHECK expression;

-- Add new column
	ALTER TABLE table_name
	ADD CONSTRAINT constraint_name constraint_definition;

-- Add new column
	ALTER TABLE table_name
	RENAME TO new_table_name;

-- Add new column
	ALTER TABLE table_name
    ALTER COLUMN column_name TYPE data_type;

--
--------------
-- SCHEMA ----
--------------

create schema dev;

select * from public.customers;

select * from dev.customers;

create table dev.customers (customer_id int);

---
-- sql commands
-- UPDATE - DML- data -- in a table
-- Alter - DDL- structure of data(table)
select * from products;


alter table products
	drop column if exists branch_location;
	
alter table products 
	add column branch_location varchar(50) default 'Bangalore';
	
select * from products;

update products 
set branch_location = 'Mumbai'
where prod_name = 'Personal Account';

select * from products;

-- Delete

select * from Employees;

delete from employees
where salary > 6000;

-- TRUNCATE
-- deletes  all the delete
--- diff b/w truncate and delete

1--> truncate always removes all the table data whereas 
       -->    delete removes some or all the record using WHERE Condition.
2 --> Truncate is much faster than delete internally
3 --> Truncate(DDL) whereas Delete(DML

--
--- diff b/w truncate and delete and drop

1--> truncate and delete removes the data whereas drop removes the table structure.
truncate table employees;


-- MERGE--DML--
select * from Employees;
--
insert into employees values ('E1', 'Mohan Kumar', 5000, 'Male');
insert into employees values ('E2', 'David Smith', 5500, 'Male');
insert into employees values ('E3', 'Eshal Maryam', 6000, 'Female');
insert into employees values ('E4', 'Pooja', 7000, 'Female');
insert into employees values ('E5', 'Robin Hood', 9000, 'Male');
--
drop table if exists emp_history
create table emp_history 
as 
select * from employees where 1=2; -- filtering to get data structure
-- and also 1 never equal to 2 gives data structure not the value from the data
select * from emp_history;

drop table if exists emp_history
create table emp_history 
as 
select * from employees;

select * from emp_history;
-- 

-- create a process where we backup employees every 6 months into history table
-- merge into table_name

merge into emp_history h
using employees e on e.emp_id = h.emp_id
when matched then
	update set salary  = e.salary
when not matched then 
	insert (emp_id, emp_name, salary, gender)
	values(e.emp_id, e.emp_name, e.salary, e.gender);

select * from emp_history;
--
update employees 
set salary =100 where emp_id = "E1";

select * from employees;
--
merge into emp_history h
using employees e on e.emp_id = h.emp_id
when matched then
	update set salary  = e.salary
when not matched then 
	insert (emp_id, emp_name, salary, gender)
	values(e.emp_id, e.emp_name, e.salary, e.gender);
	
select * from emp_history;

--
update employees 
set salary =100 
where emp_id = 'E1';

select * from employees;













-- sort all avtive accounts based on highest balance and based on earliest opening date
select * from accounts
where account_status = 'Active'
order by balance desc, date_of_opening desc;



----
-- Fetch oldest 5 transactins
insert into transactions values (to_date('2023-04-12','yyyy-mm-dd'),'C', 1100400906);
select * from transactions
order by transaction_date 


--
11) Find total no of transactions in Feb 2023
select * from transactions
select count(1) from transactions


-- find the total number of products purchased by customers "satya Sharma"

select * from customers
where first_name||' '|| last_name = 'Satya Sharma'

select * from customer_accounts;--1100400908
insert into Customer_Accounts values ('C1', 1100444102, 'PRD0003');
insert into Customer_Accounts values ('C1', 1100444103, 'PRD0004');
insert into Customer_Accounts values ('C2', 1100444105, 'PRD0002');
insert into Customer_Accounts values ('C3', 1100444106, 'PRD0002');
insert into Customer_Accounts values ('C1', 1100444104, 'PRD0004');





