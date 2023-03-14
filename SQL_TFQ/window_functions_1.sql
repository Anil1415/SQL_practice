-- window functions/ Analytical functions
-- These functions which is applied to each window/partion.
-- window/ partition can be created by using the OVER clause.
row_number -- give a unique row number to each record
rank-- give a rank for each record. If 2 records has same value then rank will be same but
dense_rank-- give a rank for each record. If 2 record has same value then ranl will be same but 
lag -- can be used to fetch data from previous record
lead -- can be used to fetch data from next record.
nth_value
ntile
first_value
last_value
cume_dist
percent_rank-- might not work in one of rdbms

avg, min, max, count, sum -- These are aggregate functions
--but can use as window functions too by modifying.


------------------------------------------------------------------
------------------------------------------------------------------
/* DATASET 1 - EMPLOYEE INFO */

drop table employee;
create table employee
( emp_ID int
, emp_NAME varchar(50)
, DEPT_NAME varchar(50)
, SALARY int);

insert into employee values(101, 'Mohan', 'Admin', 4000);
insert into employee values(102, 'Rajkumar', 'HR', 3000);
insert into employee values(103, 'Akbar', 'IT', 4000);
insert into employee values(104, 'Dorvin', 'Finance', 6500);
insert into employee values(105, 'Rohit', 'HR', 3000);
insert into employee values(106, 'Rajesh',  'Finance', 5000);
insert into employee values(107, 'Preet', 'HR', 7000);
insert into employee values(108, 'Maryam', 'Admin', 4000);
insert into employee values(109, 'Sanjay', 'IT', 6500);
insert into employee values(110, 'Vasudha', 'IT', 7000);
insert into employee values(111, 'Melinda', 'IT', 8000);
insert into employee values(112, 'Komal', 'IT', 10000);
insert into employee values(113, 'Gautham', 'Admin', 2000);
insert into employee values(114, 'Manisha', 'HR', 3000);
insert into employee values(115, 'Chandni', 'IT', 4500);
insert into employee values(116, 'Satya', 'Finance', 6500);
insert into employee values(117, 'Adarsh', 'HR', 3500);
insert into employee values(118, 'Tejaswi', 'Finance', 5500);
insert into employee values(119, 'Cory', 'HR', 8000);
insert into employee values(120, 'Monica', 'Admin', 5000);
insert into employee values(121, 'Rosalin', 'IT', 6000);
insert into employee values(122, 'Ibrahim', 'IT', 8000);
insert into employee values(123, 'Vikram', 'IT', 8000);
insert into employee values(124, 'Dheeraj', 'IT', 11000);
COMMIT;

select * from employee;

create table employee_sample as 
select emp_name, dept_name, salary from employee;

select * from employee_sample;

-- create a unique identifier column for the employee_sample table.
--
select *
, row_number() over() as row_num
from employee_sample;
--
select *
, row_number() over(order by dept_name) as sorted_dept
from employee_sample;
--
select *
, row_number() over(order by dept_name,salary) as sorted_dept
from employee_sample;
--
select *
, row_number() over(partition by dept_name) as partition_dept
from employee_sample;
--
1) fetch the first 2 employees from each department to join the company
--
select 
* from 
		(select * 
		, row_number() over(partition by dept_name order by emp_id) as dept_partition
		from employee) x
where dept_partition <3;
--







------------------------------------------------------------------
------------------------------------------------------------------




















------------------------------------------------------------------
------------------------------------------------------------------
/* DATASET 2 - STUDENT INFO */
drop table students;
create table students
    (
        id              int primary key,
        student_name    varchar(50) not null
    );
insert into students values
    (1, 'James'),
    (2, 'Michael'),
    (3, 'George'),
    (4, 'Stewart'),
    (5, 'Robin');

select * from students;

--4) From the student table, write a sql query to interchange the adjacent student names,
-- Note: If there are no adjacent student then the student name should stay the same.
--
select * 
, case when id%2 = 1 
			then lead(student_name, 1, 'No student found') over(order by id)
		else lag(student_name) over(order by id)
	end adjacent_student_name

from students;
--
select * 
, case when id%2 = 1 
			then lead(student_name, 1, student_name) over(order by id)
		else lag(student_name) over(order by id)
	end adjacent_student_name

from students;
--
select id 
, case when id%2 = 1 
			then lead(student_name, 1, student_name) over(order by id)
		else lag(student_name) over(order by id)
	end adjacent_student_name

from students;





------------------------------------------------------------------
------------------------------------------------------------------




------------------------------------------------------------------
------------------------------------------------------------------
/* DATASET 3 - PRODUCT INFO */

DROP TABLE product;
CREATE TABLE product
(
    product_category varchar(255),
    brand varchar(255),
    product_name varchar(255),
    price int
);

INSERT INTO product VALUES
('Phone', 'Apple', 'iPhone 12 Pro Max', 1300),
('Phone', 'Apple', 'iPhone 12 Pro', 1100),
('Phone', 'Apple', 'iPhone 12', 1000),
('Phone', 'Samsung', 'Galaxy Z Fold 3', 1800),
('Phone', 'Samsung', 'Galaxy Z Flip 3', 1000),
('Phone', 'Samsung', 'Galaxy Note 20', 1200),
('Phone', 'Samsung', 'Galaxy S21', 1000),
('Phone', 'OnePlus', 'OnePlus Nord', 300),
('Phone', 'OnePlus', 'OnePlus 9', 800),
('Phone', 'Google', 'Pixel 5', 600),
('Laptop', 'Apple', 'MacBook Pro 13', 2000),
('Laptop', 'Apple', 'MacBook Air', 1200),
('Laptop', 'Microsoft', 'Surface Laptop 4', 2100),
('Laptop', 'Dell', 'XPS 13', 2000),
('Laptop', 'Dell', 'XPS 15', 2300),
('Laptop', 'Dell', 'XPS 17', 2500),
('Earphone', 'Apple', 'AirPods Pro', 280),
('Earphone', 'Samsung', 'Galaxy Buds Pro', 220),
('Earphone', 'Samsung', 'Galaxy Buds Live', 170),
('Earphone', 'Sony', 'WF-1000XM4', 250),
('Headphone', 'Sony', 'WH-1000XM4', 400),
('Headphone', 'Apple', 'AirPods Max', 550),
('Headphone', 'Microsoft', 'Surface Headphones 2', 250),
('Smartwatch', 'Apple', 'Apple Watch Series 6', 1000),
('Smartwatch', 'Apple', 'Apple Watch SE', 400),
('Smartwatch', 'Samsung', 'Galaxy Watch 4', 600),
('Smartwatch', 'OnePlus', 'OnePlus Watch', 220);
COMMIT;

select * from product;
------------------------------------------------------------------
------------------------------------------------------------------



