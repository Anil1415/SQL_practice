select *from information_schema.tables
where table_schema = 'public';

DB: Banking database

Tables:
Account --> Acount_no, Account_type, Balance, Acc_status, Date_of_opening
customers --> customer_id,first_name, last_name, phone, address, dob, Account_no
Transactions --> trns_id, trns_date, trns_amount,credit_debit_flag, Account_no
Employees --> emp_id, emp_name, salary, gender,date_of_joining
product --> product_id, product_name, 

create database banking;
drop table product;
create table product
(
	product_id int, 
	product_name varchar(40)
);
select * from product;


alter table product alter column
product_id type varchar(10)
;



create the remaining banking table with correct data types;