select * from product;
-- write a query to display the most expensive product under
-- each category (corresponding to each record)
--
-- FIRST_VALUE, LAST_VALUE, NTH_VALUE
--
select * 
, first_value(product_name) over(partition by product_category order by price desc) as most_exp_product  
from product;
--
/*
write a query to display the most and least expensive product under 
each category (corresponding to each record)
*/
--
select *
, first_value(product_name) over(partition by product_category order by price desc) as most_exp_product  
, last_value(product_name) over(partition by product_category order by price desc) as least_exp_prod
, last_value(product_name) over(partition by product_category order by price desc
							range between unbounded preceding and current row) as least_exp_prod_2
, last_value(product_name) over(partition by product_category order by price desc
							range between unbounded preceding and unbounded following) as least_exp_prod_3
, nth_value(product_name,2) over(partition by product_category order by price desc
													range between unbounded preceding and unbounded following) as second_exp_prod

from product;
--
select *
, first_value(product_name) over(partition by product_category order by price desc) as most_exp_product  
, last_value(product_name) over(partition by product_category) as least_exp_prod
from product;
--
-- Frame clause
--
-- 1) Result set (all the records from your query/table) -- All non window functions apply for the entire result set
-- 2) Window/partitions (window created using partition by clause) -- only window functions are applied for each window seperately)
-- 3) Frame: The records that are available for a window function to execute
-- 
-- Default Frame Clause (range between unbounded preceding and unbounded following
--
select *
,  last_value(product_name) over(partition by product_category order by price desc
							range between 2 preceding and 2 following) as least_exp_prod_3

from product
where product_category = 'Earphone';
--
select *
,  last_value(product_name) over(partition by product_category order by price desc
							range between unbounded preceding and current row) as least_exp_prod_1
,last_value(product_name) over(partition by product_category order by price desc
							rows between unbounded preceding and current row) as least_exp_prod_2

from product
where product_category = 'Phone';
--
--write a query to segregate all expensive phones, mid range phones and cheaper phones.
-- NTILE : creates buckets
select *
, case when buckets = 1 then 'Expensive phones'
		when buckets = 2 then 'mid phones'
		else 'chepaer phones'
	end as categories

from
(select *
, ntile(3) over(order by price desc) as buckets
from product
where product_category = 'Phone') d;
