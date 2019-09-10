.echo on
.headers on
-- -Name: Tsql-Lab03.sql
-- -Author: Cherif Ouedraogo
-- -Date: July 15, 2019
-- -Chapter03 In-class Lab Assignment------
-- -ISTA-420 T-SQL Fundamentals------------
-- -Lab_Joins------------------------------
-- -1--What is the order number and the date of each order sold by each employee?
Select e.employeeid, e.firstname, e.lastname, o.orderid, o.orderdate, o.employeeid from employees e join orders o on e.employeeid = o.employeeid;
-- -2--List each territory by region.
select T.territorydescription, R.regiondescription from territories T join region R on R.regionid= T.regionid order by R.regiondescription;
-- -3--What is the supplier name for each product alphabetically by supplier?
select s.companyname, p.productname from suppliers s left join products p on s.supplierid= p.supplierid order by s.companyname;
-- -4--For every order on May 5, 1998, how many of each item was ordered, and what was the price of the item?
select O.orderid, O.orderdate,p.productid, p.productname, od.unitprice, od.quantity from orders O join order_details od on o.orderid= od.orderid join products p on od.productid= p.productid where o.orderdate like"1998-05-05"; 
---5--For every order on May 5, 1998 how many of each item was ordered giving the name of the item, and what was the price of the item?
select O.orderid, O.orderdate,p.productid, p.productname, od.unitprice, od.quantity from orders O join order_details od on o.orderid= od.orderid join products p on od.productid= p.productid where o.orderdate like"1998-05-05";
-- -6--For every order in May, 1998, what was the customer's name and the shipper's name?
select o.orderdate,c.companyname, s.companyname from orders o join customers c on o.customerid=c.customerid join shippers s on o.shipperid=s.shipperid where o.orderdate like "1998-05-%";
-- -7--What is the customer's name and the employee's name for every order shipped to France?
select o.orderid, o.shipcountry,c.companyname, e.firstname || " "|| e.lastname as employeename from orders o join customers c on o.customerid=c.customerid join employees e on o.employeeid = e.employeeid where o.shipcountry like"France";
-- -8--List the products by name that were shipped to Germany.
select p.productname, o.shipcountry from orders o join order_details od on o.orderid=od.orderid join products p on p.productid = od.productid where o.shipcountry like"Germany";