create database de_dev;
create schema de_dev.raw ;
create database role de_developer;

create role de;
grant database role de_developer to role de;
grant role de to user soldier;

grant usage on database de_dev to database role de_developer;
grant usage on schema de_dev.raw to database role de_developer;



