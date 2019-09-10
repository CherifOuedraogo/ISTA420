--Name: T-sql Exercise 05
--Author: Cherif Ouedraogo
--Date: July,30 2019

 --You may combine the following two steps.
-- Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is
--NOT NULL and UNIQUE.
 --Alter the presidents table by adding the column you created as a primary key column with a new
--constraint.
--5. Bring the data up to date by updating the last row. Use the output clause.
--6. Bring the data up to date by adding a new row. Use the output clause.
--7. How many presidents from each state belonged to the various political parties? Aggregate by party
--and state. Note that this will in eect be a pivot table.
--8. Create a report showing the number of days each president was in oce.
--9. Create a report showing the age (in years) of each present when he took oce.
--10. See if there is any correlation between a president's party and reported religion, or lack of reported
--religion.

Use TSQLV4;
--1. Create an appropriate table schema.

drop table if exists dbo.USPresidents; 
CREATE TABLE dbo.USPresidents
(
ID varchar (20), LastName varchar (80) ,FirstName varchar(80),MiddleName varchar(80), OrderofPresidency varchar (80),
 DateofBirth varchar (80),DateofDeath varchar(80),
TownorCountyofBirth varchar(80),StateofBirth varchar(80),HomeState varchar(30),PartyAffiliation varchar(80),DateTookOffice char(80),DateLeftOffice char(80),
AssassinationAttempt varchar(80),Assassinated varchar(80),ReligiousAffiliation varchar(80),ImagePath varchar(100)
);
--2. Insert the CSV data into the table you just created.

BULK INSERT dbo.USPresidents FROM 'C:\Users\CHERIF\Desktop\USPresidents_EX05.csv'
WITH
(
Firstrow = 2,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n');

select * from dbo.USPresidents;
--3. Delete the column that contains the path to the images.

ALTER TABLE dbo.USPresidents DROP COLUMN ImagePath;

--4. Delete the first record from your table using the output clause. This is the header.

DELETE TOP (0)
FROM dbo.USPresidents
OUTPUT
Deleted.ID ,
Deleted.LastName,
Deleted.FirstName, 
Deleted.MiddleName, 
Deleted.OrderofPresidency,
Deleted.DateofBirth,
Deleted.DateofDeath,
Deleted.TownorCountyofBirth,
Deleted.StateofBirth,
Deleted.HomeState,
Deleted.PartyAffiliation,
Deleted.DateTookOffice,
Deleted.DateLeftOffice,
Deleted.AssassinationAttempt,
Deleted.Assassinated,
Deleted.ReligiousAffiliation;
--Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is NOT NULL and UNIQUE.
--Alter the presidents table by adding the column you created as a primary key column with a new constraint.


ALTER TABLE dbo.USPresidents ADD column_b VARCHAR(20) NULL, column_c INT NULL ;

--5. Bring the data up to date by updating the last row. Use the output clause.
UPDATE dbo.USPresidents
SET DateLeftOffice ='1/20/2017'
OUTPUT
inserted.DateLeftOffice
Where ID = 44;
--6. Bring the data up to date by adding a new row. Use the output clause.



Select * from dbo.USPresidents
Dateleftoffice 
where ID=44;


select * from dbo.USPresidents;


------------------------------------------
INSERT INTO dbo.USPresidents (ID ,
LastName,
FirstName, 
MiddleName, 
OrderofPresidency,
DateofBirth,
DateofDeath,
TownorCountyofBirth,
StateofBirth,
HomeState,
PartyAffiliation,
DateTookOffice,
DateLeftOffice,
AssassinationAttempt,
Assassinated,
ReligiousAffiliation)
values ('45' , 'Trump','Donald','John', '45','6/14/1946','',' New York City',' New York',' New York ',' Republican','1/20/2017','','false','false',' Presbyterian')














 OUTPUT  
(inserted.ID, 
inserted.LastName,
inserted.FirstName, 
inserted.MiddleName, 
inserted.OrderofPresidency,
inserted.DateofBirth,
inserted.DateofDeath,
inserted.TownorCountyofBirth,
inserted.StateofBirth,
inserted.HomeState,
inserted.PartyAffiliation,
inserted.DateTookOffice,
inserted.DateLeftOffice,
inserted.AssassinationAttempt,
inserted.Assassinated,
inserted.ReligiousAffiliation);


UPDATE dbo.USPresidents;
SET ID='45' , LastName='Trump',FirstName='Donald',MiddleName='John',OrderofPresidency= '45',DateofBirth='6/14/1946',DateofDeath='',
TownorCuntryofBirth=' New York City',StateofBirth=' New York',HomeState=' New York ',PartyAffiliation=' Republican',DateTookOffice='1/20/2017',
DateLeftOffice='',AssassinationAttempt='false',Assassinated='false',Relgiousaffliliation=' Presbyterian'
OUTPUT
inserted.ID, 
inserted.LastName,
inserted.FirstName, 
inserted.MiddleName, 
inserted.OrderofPresidency,
inserted.DateofBirth,
inserted.DateofDeath,
inserted.TownorCountyofBirth,
inserted.StateofBirth,
inserted.HomeState,
inserted.PartyAffiliation,
inserted.DateTookOffice,
inserted.DateLeftOffice,
inserted.AssassinationAttempt,
inserted.Assassinated,
inserted.ReligiousAffiliation);
deleted.ID, 
deleted.LastName,
inserted.FirstName, 
inserted.MiddleName, 
inserted.OrderofPresidency,
inserted.DateofBirth,
inserted.DateofDeath,
inserted.TownorCountyofBirth,
inserted.StateofBirth,
inserted.HomeState,
inserted.PartyAffiliation,
inserted.DateTookOffice,
inserted.DateLeftOffice,
inserted.AssassinationAttempt,
inserted.Assassinated,
inserted.ReligiousAffiliation);
deleted.discount AS olddiscount,
inserted.discount AS newdiscount
WHERE productid = 51;