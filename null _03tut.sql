# create databases
# create database customery;

show databases;

use customery;
#create customer_info_table
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

# alter table customer_info add email varchar(25);


select * from customer_info;

# alter table customer_info add dob date;

## Alter table modify column

# alter table customer_info modify dob year;

select * from customer_info;

# alter table customer_info drop dob;

select * from customer_info;

#alter table customer_info add email varchar(25);

#alter table customer_info add dob date;
alter table customer_info modify dob year;


desc customer_info;
alter table customer_info drop dob
  select * from customer_info;


