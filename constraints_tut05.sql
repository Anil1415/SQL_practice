/* SQL constraints - SQL Constraints
SQL constraints are used to specify any rules for the records in a table.
Constraints can be used to limit the type of data that can go into a table.
It ensures the accuracy and reliability of the records in the table, and 
if there is any violation between the constraint and the record action, the action is aborted. 
Constraints can be column level or table level.
Column level constraints apply to a column, and table-level constraints apply to the whole table.
1. Not Null
2. Unique
3. Primary Key
4. Foreign Key
5. Check
6. Default
7. Index*/

use customery;

create table person2(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int
);
#
 desc person2;
 
# drop table person2;
 
 alter table person2
 add primary key(id);
  
  drop table person2 ;

 alter table person2
 add constraint pk_person2 primary key(id,age);
 
 alter table person2
 drop primary key;
 
 alter table person2 
 drop constraint pk_person2;
 
 -- foreign key
 
 
create table person2(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id)
);
 
 desc person2;
 
 create table department(
 id int not null,
 department_id int not null,
 department_name varchar(25) not null,
 primary key(department_id),
 constraint fk_persondepartment foreign key(id) references person2(id)
);

drop table department;

desc department;

create table department(
 id int not null,
 department_id int not null,
 department_name varchar(25) not null,
 primary key(department_id)
);

alter table department
add foreign key(id) references person2(id);
drop table department,person2;

-- check constraints

create table person2(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
age int,
salary int,
primary key(id),
check(salary<50000)
);
desc person2;
 insert into person2 values(1,'krsih','naik',31,40000);
 
 select * from person2;
 
 -- default constraint
 
 drop table person2;
 
 create table person2(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
city_name varchar(25) default 'Bangalore'
);

desc person2;