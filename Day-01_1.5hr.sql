USE sql_store;
-- SELECT *
-- FROM customers
-- WHERE birth_date >' 1990-01-01' or
-- (points >1000 AND state = 'VA')
-- WHERE NOT (birth_date > '1990-01-01' or points >1000)
---
-- SELECT *
-- FROM order_items
-- WHERE order_id = 6  AND (quantity*unit_price) >30
-- 
-- SELECT *
-- FROM customers
-- WHERE state  NOT IN ('va', 'fl','ga')
-- 
-- SELECT *
-- FROM products
-- WHERE quantity_in_stock IN (49,38,72)
--
-- SELECT *
-- FROM customers
-- WHERE points>=1000 AND points<=3000
-- WHERE points BETWEEN 1000 and 3000
--
-- SELECT*
-- FROM customers
-- WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01'
--
-- FROM customers
-- WHERE last_name LIKE 'b____y'
--
-- FROM customers
-- WHERE address LIKE '%trail%' OR
	-- 	address LIKE '%avenue%' AND  phone LIKE '%9'
        
        -- and phone Like '%9'
 -- SELECT *
 -- FROM customers
 -- WHERE last_name REGEXP 'field$|mac|rose'
  -- WHERE last_name REGEXP '[a-c]e'
 -- WHERE first_name REGEXP "ELKA|AMBUR"
 --  WHERE last_name REGEXP 'ey$|on$'
-- WHERE last_name REGEXP '^my|se'
-- WHERE last_name REGEXP 'b[ru]'
--
-- Missing Value
--
-- WHERE phone IS  NULL
--
-- FROM orders
-- WHERE shipped_date IS NULL
-- 
-- 
-- FROM customers
-- ORDER BY state DESC, first_name DESC
-- 
-- SELECT first_name, last_name, birth_date
-- FROM customers
-- ORDER BY birth_date
--
-- SELECT *, quantity*unit_price AS total_price
-- FROM order_items
-- WHERE order_id IN (2) 
-- ORDER BY total_price 
--
-- # LIMIT CLAUSE #
--
-- SELECT *
-- FROM customers
-- LIMIT 6, 4
-- ORDER BY points DESC
-- LIMIT 3
--
-- # INNER JOINS #
--
-- SELECT order_id, first_name, last_name
-- FROM ORDERS
-- JOIN customers
	-- 	ON orders.customer_id = customers.customer_id
--
-- SELECT order_id, o.customer_id, first_name, last_name
-- FROM orders o
-- JOIN customers c
	--  ON o.customer_id = c.customer_id
SELECT *
FROM order_items
JOIN products ON order_items.product_id = products.product_id













