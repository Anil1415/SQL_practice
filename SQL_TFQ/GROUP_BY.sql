-- GROUP BY & HAVING clause
-- Aggregate functions

-- sum, max, min, avg, count

select * from Sales_order;
select * from Customers;
select * from Products;

select product_line
from products
group by product_line;

select product_line, price 
from products
group by product_line, price;


select * from Products where product_line = 'Trains' -- 3

select product_line, count(*)
from products
group by product_line;
--
-- ERROR:  column "products.price" must appear in the GROUP BY clause or be used in an aggregate function
-- LINE 1: select product_line,price, count(*)-- trows an error
--
select product_line,price, count(*)-- trows an error
from products
group by product_line;
--
select country, count(*)
from customers
group by country;

--- RULES for using GROUP BY

1) All the columns in select clause must be mentioned in GROUP BY clause as well
2) OR you can just mention aggregate functions in SELECT clause and then mention any no of columns in GROUP BY
3) Columns in Select and GROUP BY have to be same but additionally you can include aggregate functions in SELECT 

-- Display the total sales order price 
select * from Sales_order;

select sum(sales) from sales_order; --> 10032628.85000001
select count(sales) from sales_order; --> 2823 (no of records)
select avg(sales) from sales_order; --> 3553.88907190932 (avg)
select min(sales), max(sales) from sales_order; --> 482.13(min), 14082.8 (max)
-- can use agreegate functions without GROUP BY
--
--
--
select product_line, count(*)
from products
group by product_line;
--
--  Fetch products which are present more than 10 times
--
select * from(
	select product_line, count(*) as no_of_records
	from products
	group by product_line) x -- sub-query
where no_of_records > 10;
--
--
select product_line, count(*) as no_of_records
	from products
	group by product_line
having count(*)>10;
--
--
