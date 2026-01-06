create database de_dev;
create schema de_dev.raw ;
create database role de_developer;

create role de;
grant database role de_developer to role de;
grant role de to user soldier;


-- Job required grants
-- warehouse 
grant usage on warehouse dwh to role de;
-- database 
grant usage on database de_dev to database role de_developer;
-- raw schema 
grant usage on schema de_dev.raw to database role de_developer;
-- create stage 
grant create stage on schema de_dev.raw to database role de_developer;
-- create file format 
grant create file format on schema de_dev.raw to database role de_developer;
-- create table
grant create table on schema de_dev.raw to database role de_developer;




show grants to database role de_developer;



-- Maintain heirarchy.
grant role  de to role accountadmin;