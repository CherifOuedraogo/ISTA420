---Name: T-sql_EX02
---Author: Cherif Ouedraogo
---Date: July 15, 2019.
--------------------------------Ex02---------------------------------------------------------------------
 
---------------------------Part1-------------------------------------------------------------------------  
     --Printing Labels
	 --.seperator ""
 select contacttitle||'  '||contactname||''||'
    '||companyname||''||'
    '||address||''||'
    '||city||' '||region||' '||postalcode||' '||country||'
	'||'              '||'
	'||'               'from customers;          
-------------------------Part2---------------------------------------------------------------------------	 
	--Telephone Book--
--From the Northwind database we used in class and SQLite, create a telephone book for customer repre-
--sentatives. Each line in the telehone book should consist of the representative last name, representative
--first name, company name, and telephone number. Each row should look like this.
--Lastname, Firstname Middlename [tab] Company name [tab] phone number
	
	select contactname||'	'||companyname||'',phone from customers;
----------------------------Part3------------------------------------------------------------------------------------
--Shipping Lag
--From the Northwind database, create a report from Orders showing the shipping lag between order
--date and shipped date. The report should contain four columns: the order umber, the order date, the
--shipped date, and the difference in days between the order date and the shipped date.
.mode column
.width 5,5,12,12, 5
select count(orderid), orderdate, shippeddate, (cast((julianday('1996-07-16')-julianday('1996-07-04')) as integer)) from orders;
--------------------------------Part4----------------------------------------------------------------------
     --Your Age
--How old are you, in days, today? Use Sqlite to calculate this.

SELECT ((julianday('now') - julianday('1993-07-15')));


	
	
	
	
	
	
	
	
	
	
	
	