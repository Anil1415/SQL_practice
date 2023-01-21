use Intro_Sql;
create table employees
(
emp_name varchar(40),
emp_id Int not null,
manager_name varchar(30),
division varchar(30),
primary key (emp_id)
);

drop table employees;

show tables;
select * from employees;
drop table employees;

create table employees(
first_name varchar(40),
last_name varchar(40),
title varchar(5),
age int,
salary int(10)

);


alter table employees add gender varchar(1);
select * from employees;

alter table employees add random varchar(1);
alter table employees drop column random ;



