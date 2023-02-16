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

create table student(
id int NOT NULL,
first_name varchar(25) NOT NULL,
last_name varchar(25) NOT NULL,
age int);

desc student;

alter table student modify age int not null;

create table person(
id int not null,
first_name varchar(25) not null,
last_name varchar(25) not null,
sge int not null,
unique(id)
);

insert into person values(1,'krish2','naik2',31);

select * from person;

alter table person 
add unique(first_name);

alter table person rename column sge to age;

alter table person
add constraint uc_person unique(age,first_name);

desc person;

alter table person
drop index uc_person;

create table person1(
id int not null,
first_name varchar(25) not null,
last_name varchar(25),
age int,
constraint pk_person primary key(id, last_name));

desc person1;

alter table person1 add primary key(id);
alter table person1 drop primary key;

