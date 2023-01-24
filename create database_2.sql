USE sql_store; 
select last_name, first_name, points, points+10 , points*10+100 as 'addition Multiply'
FROM customers
select Distinct state
from customers
SELECT name,unit_price, unit_price*1.1 as 'new price'
FROM products

SELECT *
FROM customers
WHERE points > 3000

WHERE state != 'VA'
WHERE birth_date >'1990-01-01'
FROM customers
Where order_date >= '1990-01-01' and points >1000


use customers1;
# Create tables in databases
/*create table customer_orders(id integer,first_name varchar(10),
last_name varchar(10), order_item varchar(10));*/
show tables;

select * from customer_info;

insert into customer_info(id,first_name,last_name) values(1, 'krish','naik');
insert into customer_info(id,first_name,last_name) values(1, 'deepak','sharma');
drop table customer_info;
show tables;
drop database customers1;
show databases;



# create databases
# create database customery;

show databases;

use customery;
create customer_info_table
/*create table customer_info(
id integer auto_increment,
first_name varchar(25),
last_name varchar(25),
salary integer,
primary key(id)
)*/

show tables;

select * from customer_info;
/*insert into customer_info(first_name,last_name,salary)
values
('john','daniel',500),
('anil','kunta',1202),
('krish', 'naik', 130),
('ankit','sharma',NULL);*/

select * from customer_info
where salary is not null;

# sql update statement to replace null values
update customer_info set salary=2324 where id=4;

select * from customer_info;

# sql delete statement

delete from customer_info where id in (6,7,8,9,10,11);

select * from Customer_info;

##sql alter table
## Add column in existing table

alter table customer_info add email varchar(25);


select * from customer_info;

alter table customer_info add dob date;

## Alter table modify column

alter table customer_info modify dob year;

select * from customer_info;

alter table customer_info drop dob;

select * from customer_info;

alter table customer_info add email varchar(25);

alter table customer_info add dob date;
alter table customer_info modify dob year;


desc customer_info;
alter table customer_info drop dob;
select * from customer_info;



