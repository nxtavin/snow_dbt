-- Create share

-- create share zeroshare; -- ACCOUNTADMIN.
grant usage on database snowdbt_dev to share zeroshare;
-- GRANT MANAGE SHARE TARGET ON ACCOUNT TO ROLE DBT_DEVELOPER;
-- create database role zero_share_role;
-- grant usage on database snowdbt_dev to database role ZERO_SHARE_ROLE;
-- grant usage on schema snowdbt_dev.share_schema to database role zero_share_role;
-- grant select on table snowdbt_dev.share_schema.customer to  database role zero_share_role;

create table customer as select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1.CUSTOMER;

select * from customer;
-- grant access on object to share 

create view customer_view as select * from customer;


grant database role zero_share_role to share zeroshare;
