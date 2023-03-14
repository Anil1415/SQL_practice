-- CTE ( common Table Expression) or with clause

select * from sales_order;
select * from customers;
select * from products;
--
with cte as
	(select query)
select * 
from cte;
--
/* Find the most profitable orders. Most profitable orders are those
whose sale price exceeded the average sale price for each city and
deal size was not small*/

--1) First find the "average sale price for each city".

with cte as 
		(select c.city, avg(s.sales) as avg_sale_per_city 
		from sales_order s
		join customers c on c.customer_id = s.customer
		group by c.city)
select so.order_number, so.sales, cust.city, cte.avg_sale_per_city
from sales_order so
join customers cust on cust.customer_id = so.customer
join cte on cte.city = cust.city
where so.sales> cte.avg_sale_per_city
and so.deal_size <> 'small';

-- Assignment
-- 1B) Rewrite the above query without using CTE
--
select so.order_number, so.sales, cust.city, cte.avg_sale_per_city
from sales_order so
join customers cust on cust.customer_id = so.customer
join (select c.city, avg(s.sales) as avg_sale_per_city 
		from sales_order s
		join customers c on c.customer_id = s.customer
		group by c.city) cte on cte.city = cust.city
where so.sales> cte.avg_sale_per_city
and so.deal_size <> 'small';
--
/* Find the most profitable orders. Most profitable orders are those
whose sale price exceeded the average sale price and
deal size was not small*/

select order_number, sales, deal_size
from sales_order
where sales > (select avg(sales) as avg_sales from sales_order)
and deal_size <> 'small';


-- 2) Find the difference in average sales for each month of 2003 and 2004.

select * from sales_order;
-- find the avg sales for each month of 2003, 2004

select * from sales_order
where year_id in (2003,2004);
--
with sales_2003 as
		(select month_id,to_char(order_date,'MON') as month, avg(sales) as avg_sale_per_month
		from sales_order
		where year_id = 2003
		group by month_id, to_char(order_date, 'MON')),
	
	sales_2004 as
		(select month_id, to_char(order_date,'MON') as month, avg(sales) as avg_sale_per_month
		from sales_order
		where year_id = 2004
		group by month_id, to_char(order_date, 'MON'))
	
select yr_03.month, abs(yr_04.avg_sale_per_month - yr_03.avg_sale_per_month) as diff
from sales_2003 yr_03
join sales_2004 yr_04 on yr_04.month = yr_03.month
order by yr_03.month_id;
--
with sales_data as
		(select year_id, month_id,to_char(order_date,'MON') as month, avg(sales) as avg_sale_per_month
		from sales_order
		where year_id in (2003,2004)
		group by year_id,month_id, to_char(order_date, 'MON'))

select yr_03.month, abs(yr_04.avg_sale_per_month - yr_03.avg_sale_per_month) as diff
from sales_data yr_03
join sales_data yr_04 on yr_04.month = yr_03.month
where yr_03.year_id = 2003
and yr_04.year_id = 2004
order by yr_03.month_id;
--
 "month"	"diff"
"JAN"	151.85736263736362
"FEB"	186.1283011911496
"MAR"	183.71860714285594
"APR"	254.96234913793023
"MAY"	373.1632059645867
"JUN"	281.33081329923243
"JUL"	159.64760000000206
"AUG"	59.429188488463296
"SEP"	97.00831578947282
"OCT"	119.26728484993237
"NOV"	138.9184172128953
"DEC"	351.9771948051962


-- Questions asked during class:
with cte as
	(. . .) 
select * 
from table1, cte; -- Non ANSI way of joining tables.


1c - i solved right ans ( 
	
SELECT ORDER_NUMBER,
	SALES,
	DEAL_SIZE
FROM SALES_ORDER
WHERE SALES >
	(SELECT AVG(SALES) AS AVG_SALES
		FROM SALES_ORDER)
AND DEAL_SIZE <> 'Small' ;
	
	
SELECT ORDER_NUMBER,
	SALES,
	DEAL_SIZE, AVG_SALES
FROM SALES_ORDER so
join (SELECT AVG(SALES) AS AVG_SALES FROM SALES_ORDER) tmp 
		on so.SALES > tmp.AVG_SALES -- Non Equi join
where DEAL_SIZE <> 'Small' ;
	
--> Equi Join : When we join 2 tables using = symbol
--> Non Equi Join : When we join 2 tables without using = symbol

BUT I HAVE DOUBT - HOW TO FETCH AVG SALES TO DISPLAY ?

