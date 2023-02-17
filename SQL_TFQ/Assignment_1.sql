









08) sort all avtive accounts based on highest balance and based on earliest opening date
select * from accounts
where account_status = 'Active'
order by balance desc, date_of_opening asc; --default is asc



----
09) Fetch oldest 5 transactins
insert into transactions values (2023-04-12 ,'C', 1100400906);
select * from transactions
order by transaction_date limit 5;

10) Find customers who are either from Bangalore/Chennai and their phone number is available 
OR those who were born 1990

select * from customers
where (address ='Bangalore' or address = 'Chennai' and phone is not null) or to_char(dob,'yyyy')<'1990';

select * from customers
where (address in ('Bangalore','Chennai') and phone is not null) or to_char(dob,'yyyy')<'1990';

select * from customers
where address in ('Bangalore','Chennai') and phone is not null or to_char(dob,'yyyy')<'1990';

--
11) Find total no of transactions in Feb 2023
select * from transactions

select count(1) from transactions
where to_char(transaction_date,'Mon')='Feb';




12) find the total number of products purchased by customers "satya Sharma"

select * from customers
where first_name||' '|| last_name = 'Satya Sharma'

select count(1)
from customers c
join customer_accounts ca on c.customer_id = ca.customer_id
where first_name||' '|| last_name = 'Satya Sharma';

-- not a good approach(filter before joining)
select count(1)
from customers c
join customer_accounts ca 
	on c.customer_id = ca.customer_id
	and first_name||' '|| last_name = 'Satya Sharma';

13) Display the full names of all employees and customers.

select * from customers
select * from employees
 -- can not join 2 tables

select first_name||' ' ||last_name from customers
union all
select emp_name from employees;

14) Categorise accounts based on their balance.
[Below 1k is Low balance, between 1k to 2k is average balance, above 2k is high balance]

-- order of execution is imporatant when using CASE;
select * 
, case when balance <1000 then 'Low balance'
	 when balance between 1000 and 2000 then 'Average balance'
	 else 'High balance'
end as category
from accounts;






