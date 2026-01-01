""" 
The Query History page lets you explore self queries executed over the last 14 days.
Other users's query history : 
1. ACCOUNTADMIN
2. MONITOR / OPERATE ROLE ON A WAREHOUSE 
3. GOVERNACE_VIEWER (ONLY ALLOWS SELF QUERIES )
                +
    IMPORTED PREVILAGES ON SNOWFLAKE database lets us view other queries.
                OR
    MONITOR ON USERS & SPECIFIC WAREHOUSES.

"""
-- QUERY HASHING

"""
Repeated queries (including those with different parameter values) have the same query_parameterized_hash value.
So above two queries will have same values. 

Same queries with spaces will result in same query_hash

select * from employees where employee_id = '10000001';  -- qh = abc , pqh = aaa
select * from employees where employee_id = '10000002';  -- qh = bcd , pqh = aaa
select * from employees where employee_id = '10000002 '; -- qh = bcd , pqh = aaa

"""
select * from SNOWFLAKE.ACCOUNT_USAGE.ACCESS_HISTORY order by query_start_time desc