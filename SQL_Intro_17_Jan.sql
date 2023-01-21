create database Intro_Sql;
use Intro_sql;
# student--> id, name, age , gender, location
drop table students;
create table students(
student_id INT,
student_name Varchar(40),
age int,
gender varchar(40),
location varchar(40)
);


select * from students;

insert into students values(1,'anil', 23, 'M','hyd');
insert into students values(2,'Ravi', 23, 'M','delhi');

drop table students;

create table students(
student_id INT,
student_name Varchar(40) not null,
age int,
gender varchar(40),
location varchar(40)
);


select * from students;

insert into students values(1,'anil', 23, 'M','hyd');
insert into students values(2,null, 23, 'M','delhi');



create table dep
(
depid int ,
depname varchar(40),
depdd varchar(100),
primary key (depid)
);

insert into dep values(null, null, null);
select * from dep;

drop table dep;

create table dep
(
depid int not null,
depname varchar(40),
depdd varchar(100),
primary key (depid)
);

insert into dep values(123, null, null);
select * from dep;

create table emp
(
empid int ,
empname varchar(40),
depadd varchar(34),
depid int,
primary key (empid),
foreign key (depid) references dep(depid)

);