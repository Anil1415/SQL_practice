USE sql_store; 
-- select last_name, first_name, points, points+10 , points*10+100 as 'addition Multiply'
-- FROM customers
-- select Distinct state
-- from customers
--
-- SELECT name,unit_price, unit_price*1.1 as 'new price'
-- FROM products
--
SELECT *
-- FROM customers
-- WHERE points > 3000
--
-- WHERE state != 'VA'
-- WHERE birth_date >'1990-01-01'
FROM customers
Where order_date >= '1990-01-01' and points >1000