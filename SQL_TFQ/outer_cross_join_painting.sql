-- JOINS : OUTER JOINS and other type of joins
INNER      --> Fetches matching records only
LEFT       --> INNER JOIN + all records from Left table (which is not fetched from inner join)
RIGHT      --> INNER JOIN + all records from Right table (which is not fetched from inner join)
FULL JOIN/*--> Fetches all records (Inner join+left+right join)
			    Inner join		
					   + all records from Left table (which is not fetched from inner join)
					   + all records from Right table (which is not fetched from inner join)*/

CROSS      --> Returns Cartesian product. It matches every record from LEFT table with every record from right table
				-- Results always be no of records in leftt table* no of records in right table
SELF       --> Join table to itself.
NATURAL    --> Not recommended


-- Using new painting_sales datasets for JOINS
select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

drop table paintings;
drop table artists;
drop table collectors;
drop table sales;


create table paintings
(
    id              int,
    name            varchar(40),
    artist_id       int,
    listed_price    float
);

create table artists
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table collectors
(
    id              int,
    first_name      varchar(40),
    last_name       varchar(40)
);

create table sales
(
    id                  int,
    sale_date           date,
    painting_id         int,
    artist_id           int,
    collector_id        int,
    sales_price         float
);


insert into paintings values (11,'Miracle',1,300);
insert into paintings values (12,'Sunshine',1,700);
insert into paintings values (13,'Pretty woman',2,2800);
insert into paintings values (14,'Handsome man',2,2300);
insert into paintings values (15,'Barbie',3,250);
insert into paintings values (16,'Cool painting',3,5000);
insert into paintings values (17,'Black square #1000',3,50);
insert into paintings values (18,'Mountains',4,1300);
insert into paintings values (19,'Sunset',10,2300);
insert into paintings values (20,'Sea Front',11,1600);

insert into artists values (1,'Thomas','Black');
insert into artists values (2,'Kate','Smith');
insert into artists values (3,'Natali','Wein');
insert into artists values (4,'Francesco','Benelli');
insert into artists values (5,'Nicholas','Smith');
insert into artists values (6,'Perl','Hoon');

insert into collectors values (101,'Brandon','Cooper');
insert into collectors values (102,'Laura','Fisher');
insert into collectors values (103,'Christina','Buffet');
insert into collectors values (104,'Steve','Stevenson');

insert into sales values (1001,'2021-11-01',13,2,104,2500);
insert into sales values (1002,'2021-11-10',14,2,102,2300);
insert into sales values (1003,'2021-11-10',11,1,102,300);
insert into sales values (1004,'2021-11-15',16,3,103,4000);
insert into sales values (1005,'2021-11-22',15,3,103,200);
insert into sales values (1006,'2021-11-22',17,3,103,50);



1) Fetch name of alll the artists along with their painting name.
	If an artists does not have a painting yet, display as NA
	

---
select (a.first_name||' '||a.last_name) as artist_name
,case when p.name is null 
			then 'NA'
	  else p.name		
	end as painting_name
from 
	paintings p right join artists a 
		on a.id = p.artist_id;
--
select (a.first_name||' '||a.last_name) as artist_name
,coalesce (p.name,'NA') 		
	 as painting_name
from 
	paintings p right join artists a 
		on a.id = p.artist_id;
--

select 'Anil' as my_name

select coalesce('Anil', 'No_name') as my_name;
select coalesce(null, 'No_name') as my_name;


-- Assignment
Solve the above problems using left join






