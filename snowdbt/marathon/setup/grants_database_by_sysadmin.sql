-- Create an account role. 
-- DBT_DEVELOPER

-- Use any database on which we plan to create a database role.
USE DATABASE SNOWDBT_DEV;
-- Create a database role
create database ROLE SNOWDBT_DEV_DEVELOPER;
-- Grant usage so it can access the database
GRANT USAGE ON DATABASE SNOWDBT_DEV TO DATABASE ROLE SNOWDBT_DEV_DEVELOPER;

-- Grant the database role to acccount role.
GRANT DATABASE ROLE SNOWDBT_DEV_DEVELOPER to role dbt_dEVELOPER;


-- Schema creation

-- Grant usage so it can access the schema
create schema SNOWDBT_DEV.queries;
grant usage on schema SNOWDBT_DEV.queries TO DATABASE ROLE SNOWDBT_DEV_DEVELOPER;
grant create tables on schema SNOWDBT_DEV.queries TO DATABASE ROLE SNOWDBT_DEV_DEVELOPER;