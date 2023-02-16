-- # joining across databases #
-- USE sql_store;
-- SELECT *
-- FROM order_items oi
-- JOIN sql_inventory.products p ON oi.product_id = p.product_id;
    
-- USE sql_inventory;
-- SELECT *
-- FROM sql_Store.order_items oi
-- JOIN products ON order_items.product_id = products.product_id;
-- 
-- self join
USE sql_hr;
SELECT *
FROM employees e
JOIN employees m 
		ON e.reports_to = m.employee_id;
--
-- Joining Multiple Tables
--


