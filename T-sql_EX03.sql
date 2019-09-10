
.echo on
.headers on
--Name: T-sql_EX03.
--Author: Cherif Ouedraogo
--Date:July 22, 2019

--Using SQLite and the Northwind database, create a line item report that contains a line for each
--product in the order with the following columns: the order id, the product id, the unit price, the
--quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
--the order.
--1. Using SQLite and the Northwind database, create a line item report that contains a line for each
--product in the order with the following columns: the order id, the product id, the unit price, the
--quantity sold, the line item price, and the percent of that line item constitutes of the total amount of
--the order.
select orderid, productid, unitprice,quantity, (quantity*unitprice)as Linetotal, ((quantity*unitprice)/(count(orderid))*100) from order_details limit 5;
--2. I want to know the unique (distinct) cities, regions, and postal codes: (a) where we have both customers
--and employees, (b) where we have customers but no employees AND both customers ad employees,
--and (c) where we have employees but no customers AND both customers and employees. Write three
--queries, using inner and outer joins. Report the results of the queries. There is no need for any further
--reporting.
--(a) where we have both customers and employees
select distinct c.city, c.region, c.postalcode from orders o join customers c on o.customerid = c.customerid join employees e on o.employeeid = e.employeeid;
--(b) where we have customers but no employees AND both customers ad employees
select distinct c.city, c.region, c.postalcode from customers c left join employees on employeeid = null limit 15;
--(c) where we have employees but no customers AND both customers and employees
select distinct e.lastname || ' ' || e.firstname as Employeename, c.companyname, e.city, e.region, e.postalcode from  employees e left outer join customers c on customerid;
--3. Using subqueries, create a report that lists the ten most expensive products.
select productname, unitprice from products where unitprice in (select unitprice from products) order by unitprice desc limit 10 ;
--4. Using subqueries, create a report that shows the date of the last order by all employees.
select o1.employeeid, o1.orderdate from orders o1 where o1.orderdate = (
select max(o2.orderdate) from orders o2 where o2.employeeid = o1.employeeid);
