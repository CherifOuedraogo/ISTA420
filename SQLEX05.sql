--Name: TSQL Exercise 05	
--Author: Cherif Ouedraogo
--Date: July30,2019

--1. Create an appropriate table schema.
Use TSQLV4;
DROP TABLE IF EXISTS dbo.USPresidents
CREATE TABLE dbo.USPresidents
( ID int , 
  LastName VARCHAR(80),
  FirstName  VARCHAR(80),
  MiddleName VARCHAR (80),
  OrderofPresidency int,
  DateofBirth date,
  DateofDeath date,
  TownorCountyofBirth VARCHAR(80),
  StateofBirth VARCHAR (80),
  HomeState	VARCHAR (80),
  PartyAffiliation VARCHAR (80),
  DateTookOffice date,	
  DateLeftOffice date,
  AssassinationAttempt VARCHAR (80),
  Assassinated VARCHAR (80),
  ReligiousAffiliation VARCHAR (80),
  ImagePath VARCHAR (80),
  Constraint PK_USPresidents primary key (ID));

--2. Insert the CSV data into the table you just created.
Bulk insert dbo.USPresidents
from 'C:\Users\CHERIF\Desktop\USPresidents_EX05.csv'
with
(
DATAFILETYPE = 'char',
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n',
FIRSTROW = 2
);
--3. Delete the column that contains the path to the images.
ALTER TABLE dbo.USPresidents DROP COLUMN  ImagePath;
--4. Delete the first record from your table using the output clause. This is the header.
 --You may combine the following two steps.
-- Alter the presidents table by adding an integer column, beginning at 1 and ending at 44, that is
--NOT NULL and UNIQUE.
 --Alter the presidents table by adding the column you created as a primary key column with a new
--constraint.

Delete TOP (0) from dbo.USPresidents
output
 deleted.LastName ,
  deleted.FirstName  ,
  deleted.MiddleName ,
 deleted. OrderofPresidency ,
  deleted.DateofBirth ,
  deleted.DateofDeath ,
  deleted.TownorCountyofBirth ,
  deleted.StateofBirth ,
  deleted.HomeState	,
  deleted.PartyAffiliation ,
  deleted.DateTookOffice ,	
  deleted.DateLeftOffice ,
  deleted.AssassinationAttempt ,
  deleted.Assassinated ,
  deleted.ReligiousAffiliation ;
 
  --5. Bring the data up to date by updating the last row. Use the output clause.
  update dbo.USPresidents
  Set DateLeftOffice = '1/20/2017'
  output
  inserted.DateLeftOffice
  where ID = 44;

--6. Bring the data up to date by adding a new row. Use the output clause.
 INSERT INTO dbo.USPresidents 
  output
  inserted.LastName,
  inserted.FirstName , 
 inserted.MiddleName ,
 inserted.OrderofPresidency ,
 inserted.DateofBirth ,
 inserted.DateofDeath ,
 inserted.TownorCountyofBirth ,
 inserted.StateofBirth ,
 inserted.HomeState	,
 inserted.PartyAffiliation ,
 inserted.DateTookOffice ,	
 inserted.DateLeftOffice ,
 inserted.AssassinationAttempt ,
 inserted.Assassinated 
 Values(45,'Trump','Donald','John',45,'6/14/1947','','New York City','New York','New York','Republican','1/20/2017','', 'FALSE', 'FALSE','Presbitarian');
 
  --7. How many presidents from each state belonged to the various political parties? Aggregate by party
--and state. Note that this will in effect be a pivot table
select  HomeState,PartyAffiliation,count (ID) as NumPresidents 
from dbo.USPresidents
group by HomeState,PartyAffiliation;

--8. Create a report showing the number of days each president was in office.
select FirstName,LastName, MiddleName,sum(DATEDIFF ( year, DateTookOffice , DateLeftOffice )*365) as NumDaysInOffice
from dbo.USPresidents
Where DateLeftOffice > DateTookOffice
Group by ID, FirstName,LastName, MiddleName;

--9. Create a report showing the age (in years) of each present when he took office.
select FirstName,LastName, MiddleName,sum(DATEDIFF ( year, DateofBirth , DateTookOffice )) as Age
from dbo.USPresidents
Where  DateTookOffice  >  DateofBirth
Group by ID, FirstName,LastName, MiddleName;

--10. See if there is any correlation between a president's party and reported religion, or lack of reported religion.
select  ReligiousAffiliation,PartyAffiliation,count (ID) as NumPresidents 
from dbo.USPresidents
group by ReligiousAffiliation,PartyAffiliation;
select * from dbo.USPresidents;