select * from sales; --id(1001,1002)
select * from artists; --id(1,2,3)
-- Natural joins
-Display the artist name and painting name
--
select a.first_name, s.painting_id
from sales s
inner join artists a on a.id =s.artist_id;
--
select a.first_name, s.painting_id
from sales s
join artists a on a.id =s.artist_id;
--
select a.first_name, s.painting_id
from sales s
natural join artists a; -- Not recommended-- no data fetched
--
alter table artists rename column id to artist_id;
select a.first_name, s.painting_id
from sales s
natural join artists a;
alter table artists rename column artist_id to id;
-- Natural joins working:
1) When both tables has common column names then join (inner) happens to that column
2) When both tables do have any common column name then it results in cross join
3) If multiple common column names exists in both tables then join happens based on all these common columns. 
--

--SELF JOINS
----