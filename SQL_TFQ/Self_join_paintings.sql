select * from paintings;
select * from artists;
select * from collectors;
select * from sales;

1) Fetch name of alll the artists along with their painting name.
	If an artists does not have a painting yet, display as NA
--
select (a.first_name||' '||a.last_name) as artist_name
,coalesce (p.name,'NA') 		
	 as painting_name
from 
	paintings p right join artists a 
		on a.id = p.artist_id;
-- Assignment
Solve the above problems using left join

select (a.first_name||' '||a.last_name) as artist_name
,coalesce (p.name,'NA') 		
	 as painting_name
from artists a 
	left join paintings p
		on a.id = p.artist_id;
--
2) Find collectors who did not purchase any pantings?

select * 
from collectors c
where id not in 
(select collector_id from sales);
--

select * 
from collectors c
left join sales s on s.collector_id = c.id
where s.id is null;
--

3) Find how much each artist made from sales. And how many paintings did they sell.

select * from sales

select artist_id, sum(sales_price) as total_sales_amt, count(1) as no_of_paintings_sold
from sales
group by artist_id;

select a.first_name, sum(sales_price) as total_sales_amt, count(1) as no_of_paintings_sold
from sales s
join artists a on a.id = s.artist_id
group by a.first_name;
--

4) Display all the available paintings and all the artist. If a painting
was sold then mark them as 'sold' and if more than 1 painting of an artist was sold then display a "**" beside their name.

select p.name as painting_name, (a.first_name||' '||a.last_name) as artist_name 
, case when s.id is not null then 'sold' end as sold_or_not
from paintings p 
full outer join artists a on p.artist_id = a.id --outer is optional key word
left join sales s on s.painting_id = p.id
left join (select artist_id, count(*) as no_of_paintings
		  from sales
		  group by artist_id) x on x.artist_id = a.id
--
--

select p.name as painting_name, (a.first_name||' '||a.last_name) as artist_name 
		, case when x.no_of_paintings >1 
			then (a.first_name||' '||a.last_name||'**')
			else (a.first_name||' '||a.last_name)
			 end as artist_name,
		case when s.id is not null then 'sold' end as sold_or_not
			 
from paintings p 
full outer join artists a on p.artist_id = a.id --outer is optional key word
left join sales s on s.painting_id = p.id
left join (select artist_id, count(*) as no_of_paintings
		  from sales
		  group by artist_id) x on x.artist_id = a.id;
		  
		  
--
--CROSS JOIN
select p.name as painting_name
,(a.first_name||' '||a.last_name) as artist_name 
from paintings p
cross join artists a;


-- Display each painting name with the total no of artist in the database.

select name as painting_name, x.cnt
from paintings
cross join (select count(1) as cnt from artists) x;
--
-- the above are ANSI joins

-- Non ANSI join

select name as painting_name, x.cnt
from paintings
, (select count(1) as cnt from artists) x; -- used , instead of cross join







