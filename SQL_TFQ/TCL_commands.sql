--TCL command
-- commit --> save the transaction permanently to the database
-- rollback --> undo the transactions
-- savepoint --> Undo transaction upto a certain point
--
select * from transactions;
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
	
delete from transactions where transaction_id >2;


rollback;
select * from transactions;

commit ;
select * from transactions; -- only 2 records available after commit




-- savepoint 
select * from transactions;
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
savepoint after_2_insert;
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
savepoint after_3_insert;

rollback; -- lost last 3 open transactions(which are not commited) 
select * from transactions;
rollback to after_2_insert;


rollback;
select * from transactions;

insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
savepoint after_2nd_insert;
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
savepoint after_3rd_insert;
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);
insert into Transactions (Transaction_Date, Credit_Debit_flag, Account_No)
	values ( current_date, 'C', 1100400901);


rollback to after_3rd_insert; -- deletes last 3 open transactions

commit; -- saved permanently
select * from transactions;
rollback; -- cannot rollback once commited
select * from transactions;



