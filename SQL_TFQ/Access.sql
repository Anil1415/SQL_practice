
-- Role -- Accenture by giving a new connection
select * from vw_customers;

-- grant select on vw_customers to accenture;
-- revoke all on vw_customers from accenture;


select * from customers;
ERROR:  permission denied for table customers
