
select * from Sales_order;
select * from Customers;
select * from Products;

-- ASSIGNMENTS:
1) Fetch all the small shipped orders from August 2003 till the end of year 2003.
2) Find all the orders which do not belong to customers from USA and are still in process.
3) Find all orders for Planes, Ships and Trains which are neither Shipped nor In Process nor Resolved.
4) Find customers whose phone number has either parenthesis "()" or a plus sign "+".
5) Find customers whose phone number does not have any space.
6) Fetch all the orders between Feb 2003 and May 2003 where the quantity ordered was an even number.
7) Find orders which sold the product for price higher than its original price.
8) Find the average sales order price
9) Count total no of orders.
10) Find the total quantity sold.
11) Fetch the first order date and the last order date.
-----------------------------------------------------------



1) Fetch all the small shipped ORDERS from August 2003 till end of year 2003

select * from sales_order
where deal_size ='Small'
and status = 'Shipped'
and year_id = 2003
and month_id >= 8;

















--select *
from sales_order
where deal_size = 'Small'
and status = 'Shipped'
and order_date between to_date('01-08-2003');


2) Find all the orders which do not belong to customers from USA and are still in process?


- fetch data from orders tables
- exclude USA customers
- fetch orders  which are in process

select s.* from sales_order s
join customers c on c.customer_id = s.customer
where c.country<>'USA'
and s.status = 'In Process';


3) Find all orders for Planes , ships and Trains which are neither shipped nor In Process nor resolved.

select * from sales_order s
join 
Products p on s.product = p.product_code 
where p.product_line in ('Plane', 'Ships', 'Trains') and s.status in ('In Process','Shipped');

select * from sales_order s 
join Products p on s.product = p.product_code 
where p.product_line in ('Planes','Ships','Trains')
and s.status not in ('Shipped', 'In Process', 'Resolved');



7) Find the orders which are sold thee product for price higher than its original price

- fetch orders
- where can i find the original price

select s.order_number, s.quantity_ordered, s.price_each  from sales_order s
join
products p on p.product_code = s.product
where s.price_each> p.price
