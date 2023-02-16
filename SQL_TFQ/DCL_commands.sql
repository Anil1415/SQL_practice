-- DCL commands (GRANT & REVOKE)
select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
-- select * from Customer_Accounts; 
select * from information_schema.tables where table_schema='public';

select * from Customer_Accounts;

select * from customers;


-- view is database object formed over a sql query
-- view does not store data
drop view if exists vw_customers
create view vw_customers
as
select customer_id,(first_name||' '||last_name) as customer_name
from customers;

select * from vw_customers;

-- view is an object of customers 
-- executes the original table

drop user vendor;
create user accenture;

grant select on vw_customers to accenture;

revoke all on vw_customers from accenture;


-- Basic sql queries

-- select --> DQL commands: used to fetch data from database, 
	-- Key_Words: select * from  
			-- SELECT --> Mention all column_name or *
			-- FROM   --> Mention the table_name
			-- JOIN   --> Mention if there are more than 1(one) table
			-- WHERE  --> Filter the data
			-- GROUP BY --> Group the data based on specific columns
			-- HAVING --> Filter the grouped data
			-- ORDER BY --> SORT the data
			-- LIMIT/TOP --> to fetch limited records
			-- DISTINCT
			
			
			
-- Fetch tran_id , date and amount of all debit Transactions from Transactions table in Banking database

select transaction_id, transaction_date, account_no
from Transactions
where credit_debit_flag = 'D';

-- Fetch male employees who earn more than 5000 salary

select *
from employees
where salary>5000 and gender = 'Male';

-- Fetch employees whose name starts with R or whose salary is greater than or equal to 7000;

Select * 
from Employees
where emp_name like 'R%' or salary > 5000;



-- OPERATORS
logical --> AND, OR, NOT, IN, NOT IN
arithmetic --> +, -, %, *
comparison --> =, <>, !=, <, >, >=, <=

-- Fetch accounts with balance in between 1000 - 3000

select * 
from accounts
where  1000>balance>3000;

select * 
from accounts
where balance between 1000 and 3000;


-usind sql find out if a given number is even or odd? (Given numbers are 432, 77)
			
-- Operator CASE
select 432%2; --> 0

select 432%2 as col1, 432%5 as col2;

select case when 432%2 = 0
then 'even' else 'odd'
end even_odd_flag;


-- find customers who did not provide a phone num
select *
from customers;
-- ERROR:  cannot drop table customers because other objects depend on it
-- DETAIL:  view vw_customers depends on table customers
-- HINT:  Use DROP ... CASCADE to drop the dependent objects too.



-- find all the different products purchased by the customers
select * distinct prod_id
from customer_accounts;

select * 
from customer_accounts;

-- Assignments Queries
Basic SQL queries using banking datsets;

