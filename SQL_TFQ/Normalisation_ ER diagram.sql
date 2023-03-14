-- order of Execution

SELECT   --> 6
FROM     --> 1
JOIN     --> 2
WHERE    --> 3
GROUP BY --> 4
HAVING   --> 5
ORDER BY --> 7
LIMIT    --> 8

-- Normalization:
/*Process to effectively design a databases such it reduces 
the data redundancies. Also avoids certain anomalies like insert, update and delete anomalies*/

select * from customers;
select * from products;
select * from sales_order;

1) Find the average sales order price based on deal size?

-- group by deal_size
select deal_size, avg(sales) as avg_sales
from sales_order
group by deal_size;

2) Find the total no of orders per each day. sort data on higher orders

select order_date, count(1) as no_of_orders
from sales_order
group by order_date
order by 2 desc -- here number 2 is column_name (not recommended)

select order_date, count(1) as no_of_orders
from sales_order
group by order_date
order by no_of_orders desc

3) Display the tota sales figure for each quater . Represent each quater with their respective period.

-- select * from sales_order
select qtr_id,
sum(sales) as total_sales,
case when qtr_id =1 then 'Jan, Feb, March'
	when qtr_id =2 then 'April May June'
	when qtr_id =3 then 'July, Aug, Sept '
	when qtr_id =4 then 'oct , Nov, Dec'
end as quater 
from sales_order
group by qtr_id;

select qtr_id,
case when qtr_id =1 then 'Jan - March'
	when qtr_id =2 then 'April - June'
	when qtr_id =3 then 'July - Sept '
	else 'oct-Dec'
	end quater,
sum(sales) as total_sales
from Sales_order group by qtr_id;

4) Identify how many cars, Motor cycles, trains and ships are available in the inventory
Treat all type of cars as just "Cars"

select  
	case when product_line in ('Classic Cars', 'Vintage Cars') 
			then 'Cars'
		else product_line
		end vehicles,
	count(*) as total_Number
from products
where product_line in ('Classic Cars','Vintage Cars','Motorcycles','Trains','Ships')
group by case when product_line in ('Classic Cars', 'Vintage Cars') 
			then 'Cars'
		else product_line
	end;
	
--
select product_line, count(1) as no_of_vehicles
from products
where product_line in ('Motorcycles','Trains','Ships')
group by product_line
union 
select 'Cars', count(1) as no_of_vehicles
from products
where product_line in ('Classic Cars','Vintage Cars')
--group by product_line


5) Identify the vehicles in the inventory which are short in number.
Shortage of vehicles is considered when there are less than 10
select * from products

select product_line, count(*) from products
group by product_line
having count(*) <10

6)

7) Find the orders where the sales amount is incorrect

select * from sales_order
where sales != (quantity_ordered*price_each);

select order_number,quantity_ordered,price_each,sales,
round((quantity_ordered*price_each)::decimal,2) as Cal_Amount
from sales_order
where round(sales::decimal,2) <> round((quantity_ordered*price_each)::decimal,2);

-- Assignments

6) Find the countries which have purchased more than 10 motorcycles
8) Fetch the total sales done after each day
9) Fetch the top 3 months which have been doing the lowest sales
10) Find the total number of orders per each day of the week (Mon - Sunday). 
    Sort the data based on highest orders
11) Find out the vehicle which was sold the most
    and which was sold the least.
	O/P should be a single record with 2 columns.
	1 for most sold
	2 for least sold

