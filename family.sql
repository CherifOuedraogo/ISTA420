.echo on
.headers on

-- Name: family.sql
-- Author: Cherif Ouedraogo
-- Date: July ,1 2019
-- Purpose: SQL Test
drop table if exists family;

create table family (
    id integer,
    name text,
    sex integer,
    role text
);

insert into family values (1, 'Cherif', 1, 'parent');
insert into family values (2, 'Mellie', 0, 'parent');
insert into family values (3, 'Wafo', 0, 'child');
insert into family values (4, 'Oleas', 1, 'child');
insert into family values (4, 'Dayoundou', 1, 'child');
insert into family values (4, 'Inda, 0, 'child'); 
