select * from information_schema.tables where table_schema='public';

not null --
check --
unique
foreign key
primary key --
default
identity column


select * from products;
select * from Employees;
select * from Customers;
select * from Accounts;
select * from Transactions;
select * from Customer_Accounts; 

drop table if exists test;
create table test(val1 bigint, val2 bigint);
insert into test values(12345678346767940, 99999999999);
select * from test;

------NULL ROWS
drop table if exists products;
create table if not exists products
(
	prod_id		varchar(10) ,
	prod_name	varchar(100) 
);

insert into products (prod_id, prod_name) values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', '');
insert into products (prod_id, prod_name) values ('PRD0003', 'Home Loan');
insert into products (prod_id, prod_name) values ('PRD0004', '');

select * from products;
-----

---
------ NOT NULL CONSTRAINT-----
---
-- postgre treats '' and null differently
-- insert into products (prod_id, prod_name) values ('PRD0002', '');
-- insert into products (prod_id, prod_name) values ('PRD0002', null);
-- Cannot insert values if table already exists, Can do by Altering Table

drop table if exists products;
create table if not exists products
(
	prod_id		varchar(10) ,
	prod_name	varchar(100) not null
);

insert into products (prod_id, prod_name) values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', 'Current Account');
insert into products (prod_id, prod_name) values ('PRD0003', 'Home Loan');
insert into products (prod_id, prod_name) values ('PRD0004', 'Personal Account');

select * from products;

---
----PRIMARY KEY CONSTRAINT --
--
---Can not allow duplicate values and null value in the PRIMARY KEY Column.
-- can have only have one primary key
-- can be combination of multiple columns wwhich is composite Primary key
--
-- insert into products (prod_id, prod_name) values ('PRD0001', 'Savings Account');
--ERROR:  duplicate key value violates unique constraint "products_pkey"
---DETAIL:  Key (prod_id)=(PRD0001) already exists.
---
--insert into products (prod_id, prod_name) values (null, 'Personal Account');
--ERROR:  null value in column "prod_id" of relation "products" violates not-null constraint
--DETAIL:  Failing row contains (null, Personal Account).

drop table if exists products;
create table if not exists products
(
	prod_id		varchar(10) primary key ,
	prod_name	varchar(100) not null
);

insert into products (prod_id, prod_name) values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', 'Current Account');
insert into products (prod_id, prod_name) values ('PRD0003', 'Home Loan');
insert into products (prod_id, prod_name) values ('PRD0004', 'Personal Account');
insert into products (prod_id, prod_name) values ('PRD0005', 'Personal Account');


select * from products;

-----

--
-- Composite PRIMARY KEY CONSTRAINT --using type of constraint
-- constraint pk_prod primary key (prod_id, prod_name)
-- ERROR:  multiple primary keys for table "products" are not allowed
-- LINE 5:  prod_name varchar(100) Primary key
-- pk_prod is a constraint name
-- can make different columns as primary keys
-- can insert with  same id and diff prod_name

drop table if exists products;
create table if not exists products
(
	prod_id		varchar(10),
	prod_name	varchar(100) not null, 
	constraint pk_prod primary key (prod_id, prod_name)
	
);

insert into products (prod_id, prod_name) values ('PRD0001', 'Savings Account');
insert into products (prod_id, prod_name) values ('PRD0002', 'Current Account');
insert into products (prod_id, prod_name) values ('PRD0003', 'Home Loan');
insert into products (prod_id, prod_name) values ('PRD0004', 'Personal Account');
insert into products (prod_id, prod_name) values ('PRD0005', 'Personal Account');


select * from products;

--
--
-- CHECK CONSTRAINT --
--
-- ERROR:  new row for relation "employees" violates check constraint "employees_gender_check"
-- DETAIL:  Failing row contains (E2, David Smith, 5500, male).
-- CASE SENSITIVE

drop table if exists Employees;
create table Employees
(
	Emp_ID		varchar(10) primary key,
	Emp_Name	varchar(100) not null,
	Salary		int,
	gender		varchar(10) check (gender in ('Male','Female'))
);
insert into employees values ('E1', 'Mohan Kumar', 5000, 'Male');
insert into employees values ('E2', 'David Smith', 5500, 'Male');
insert into employees values ('E3', 'Eshal Maryam', 6000, 'Female');
insert into employees values ('E4', 'Pooja', 7000, 'Female');
insert into employees values ('E5', 'Robin Hood', 9000, 'Male');

select * from Employees;

--

--
-- select * from Customers; can use customers also
-- to_date is in built function

--
drop table if exists Customers;
create table Customers
(
	Customer_ID		varchar(10) primary key,
	First_Name		varchar(40) not null,
	Last_Name		varchar(40) not null,
	Phone			bigint  ,
	Address			varchar(200),
	dob				date 
);

insert into customers values
('C1', 'Aman', 'Verma', 9900887701, 'Bangalore', to_date('01-01-1990', 'dd-mm-yyyy')),
('C2', 'Suraj', 'Chopra', 9900887702, 'Mumbai', to_date('01-01-1995', 'dd-mm-yyyy')),
('C3', 'Gowri', 'Rathod', 9900887703, 'Pune', to_date('01-01-1980', 'dd-mm-yyyy'));

-- select * from Customers;
select * from customers;

---
--
drop table if exists Accounts;
create table Accounts
(
	Account_No			bigint primary key,
	Balance				int,
	Account_Status		varchar(10) check (Account_Status in ('Active', 'Inactive', 'Suspended', 'On hold')),
	Date_of_Opening		date
);

insert into Accounts values (1100400901, 500, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into Accounts values (1100400902, 1500, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into Accounts values (1100400903, 800, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into Accounts values (1100400904, 900, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into Accounts values (1100400905, 4500, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));
insert into Accounts values (1100400906, 8500, 'Active', to_date('10-02-2020', 'dd-mm-yyyy'));

select * from Accounts;

---
-- generated always as identity --Autogeneration of values
--
-- ERROR:  cannot insert a non-DEFAULT value into column "transaction_id"
-- DETAIL:  Column "transaction_id" is an identity column defined as GENERATED ALWAYS.
-- HINT:  Use OVERRIDING SYSTEM VALUE to override.
--
drop table if exists Transactions;
create table Transactions
(
	Transaction_ID		int generated always as identity ,
	Transaction_Date	date,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint
);

insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'D', 1100400902);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400903);

select * from Transactions;

--

---
-- generated by default as identity --Autogeneration of values
-- user can give default value
-- can insert same  if used 'generated by default as identity'can generate 2 identitcal transc_id if provided
-- Using UNIQUE Constraint can override
--ERROR:  duplicate key value violates unique constraint "transactions_transaction_id_key"
-- DETAIL:  Key (transaction_id)=(40) already exists.

-- allows null values but not primary key constraint does not allow

drop table if exists Transactions;
create table Transactions
(
	Transaction_ID		int unique generated by default as identity,
	Transaction_Date	date,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint
);

insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'D', 1100400902);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400903);
insert into Transactions (Transaction_ID, Transaction_Date, Credit_Debit_flag, Account_No)
	values ( 40, current_date, 'C', 1100400903);
insert into Transactions (Transaction_ID, Transaction_Date, Credit_Debit_flag, Account_No)
	values ( default, current_date, 'C', 1100400903);
	
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 999);
	
	
--- Foreign Key Constraint
--To create parent- Child relationship
--ERROR:  insert or update on table "transactions" violates foreign key constraint "fk_trans"
-- DETAIL:  Key (account_no)=(999) is not present in table "accounts".

select * from Transactions;

--
drop table if exists Transactions;
create table Transactions
(
	Transaction_ID		int unique generated by default as identity,
	Transaction_Date	date,
	Credit_Debit_flag	varchar(1),
	Account_No			bigint,
	constraint fk_trans foreign key(Account_No) references Accounts(Account_NO)
);

insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'D', 1100400902);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400903);


insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400904);
insert into Transactions (Transaction_ID, Transaction_Date, Credit_Debit_flag, Account_No)
	values ( default, current_date, 'C', 1100400905);
	

select * from Transactions;

--
-- NOTICE:  table "customer_accounts" does not exist, skipping
-- ERROR:  there is no unique constraint matching given keys for referenced table "products"
--  Can not be composite primary key, can be a primary or Unique key
drop table if exists Customer_Accounts;
create table Customer_Accounts
(
	Customer_ID		varchar(10) references customers(customer_id),
	Account_No		bigint references accounts(account_no),
	prod_id			varchar(10) references products(prod_id)
);

--> Syntax for alter table in PostgreSQL

-- Add new column
    ALTER TABLE table_name
	ADD COLUMN column_name datatype column_constraint;

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

