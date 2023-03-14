subquery: A query within query

-- Types of subquery:

1) scalar subquery       --> If the subquery returns 1 row and 1 column
2) Multiple row subquery --> Either it returns multiple rows  and 1 column or vice-versa
3) Correlated subquery    --> Inner query is dependent on outer query.


1) Fetch paintings that are priced higher than the average painting price?

select * from paintings;

select avg(listed_price) as avg_price
from paintings

-- This is a scalar subquery example
select * -- outer query also referred as main query
from paintings
where listed_price > (select avg(listed_price) as avg_price
from paintings); -- subquery also refered as inner query

2) Fetch all the collectors who purchased paintings

select * 
from collectors c
where c.id  in (select distinct collector_id from sales)-- multiple row subquery

select * 
from collectors c
where exists (select 1 collector_id from sales s
						where s.collector_id = c.id) -- correlated subquery


3) fetch the total amount of sales for each artist who has sold at least one painting.
Display the artist name and total sales amount


select concat(a.first_name,' ',a.last_name) as artist_name, 
sum(sales_price) as total_sales_per_artist 
from sales s
join artists a on a.id = s.artist_id
group by concat(a.first_name,' ',a.last_name)

-- 2nd solution

select concat(a.first_name,' ',a.last_name) as artist_name,
s.total_sales
from artists a
join (select artist_id, sum(sales_price) as total_sales
		from sales
		group by artist_id) s on s.artist_id = a.id
--
-- Assignments
--
4) Fetch the total amount of sales for each artist who has sold either 1 or 2 paintings only.
 Display also the no of paintings sold.
 
5) Find the names of the artists who had zero sales.

6) Suppose you insert the below 2 records to the artists table. 
		Write a query to identify the duplicate artist 
		insert into artists values (5, 'Kate', 'Smith');
		insert into artists values (6, 'Natali', 'Wein');
		
7) How would you delete the duplicate records in artists table?

8) For each collector, calculate the number of paintings purchased
--

select avg(sales_price) from sales
having avg(sales_price) >100; -- HAVING clause without GROUP BY (Not recommended)



6) Suppose you insert the below 2 records to the artists table. 
		Write a query to identify the duplicate artist 
		insert into artists values (5, 'Kate', 'Smith');
		insert into artists values (6, 'Natali', 'Wein');
-- sol--
select count(*),concat(a.first_name,' ', a.last_name)
from artists a
group by concat(a.first_name,' ', a.last_name)
having count(*)>1; -- filtering group data with having 

7) How would you delete the duplicate records in artists table?

--
delete from artists a -- wrong approach
where(concat(a.first_name,' ', a.last_name)) in (
												select concat(a.first_name,' ', a.last_name)
												from artists a
												group by concat(a.first_name,' ', a.last_name)
												having count(*)>1);  
-- deletes all the values (4 records) from 6 records
--
insert into artists values (5, 'Kate', 'Smith');
insert into artists values (6, 'Natali', 'Wein');
select * from artists;

delete from artists a 
where id in (select max(id)
			from artists a
			group by concat(a.first_name,' ', a.last_name)
			having count(*)>1);  

select * from artists;
--
2-- delete a duplicate record using an existing unique identifier even when there are multiple duplicate entries.

insert into artists values (5, 'Kate', 'Smith');
insert into artists values (6, 'Natali', 'Wein');
insert into artists values (7, 'Kate', 'Smith');
insert into artists values (8, 'Natali', 'Wein');
insert into artists values (9, 'Kate', 'Smith');
insert into artists values (10, 'Natali', 'Wein');
insert into artists values (11, 'Kate', 'Smith');
insert into artists values (12, 'Natali', 'Wein');
insert into artists values (13, 'Kate', 'Smith');
insert into artists values (14, 'Natali', 'Wein');

select * 
from artists
order by first_name;
--
delete from artists a 
where(id) not in (select min(id)
			from artists a
			group by concat(a.first_name,' ', a.last_name)
			);  
--
3-- delete duplicate records using ctid(postgre) or rowid(oracle)
insert into artists values (5, 'Kate', 'Smith');
insert into artists values (6, 'Natali', 'Wein');

select *, ctid 
from artists 

delete from artists a 
where ctid in (select max(ctid)
			from artists a
			group by concat(a.first_name,' ', a.last_name)
			having count(*)>1);  

4-- delete duplicate records ---(for better performance)
-- By creating a backup/temp table
insert into artists values (5, 'Kate', 'Smith');
insert into artists values (6, 'Natali', 'Wein');

select * 
from artists
order by first_name;

drop table if exists artists_back_up;
create table artists_back_up
as
select *
from artists
where id in (select min(id)
			from artists
			group by first_name, last_name);
			
select * 
from artists_back_up
order by first_name;


-- sub method 1
-- not a recommended method , might crash running application using this data
drop table artists;
alter table artists_back_up rename to artists; 

-- sub method 2
truncate  table artists;
select * from artists;

insert into artists
select * from artists_back_up;

drop table artists_back_up;