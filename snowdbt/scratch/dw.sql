SELECT CURRENT_WAREHOUSE();
SHOW WAREHOUSES WITH PRIVILEGES MODIFY, OPERATE;

SHOW WAREHOUSES
  ->> SELECT "name", "state", "type", "size" FROM $1;


create schema scratch;
create table large_orders as select * from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1000.ORDERS;

GRANT USAGE
ON WAREHOUSE CHECK
TO ROLE PUBLIC;


select current_warehouse();
select count(*) from SNOWFLAKE_SAMPLE_DATA.TPCH_SF10000.CUSTOMER;
