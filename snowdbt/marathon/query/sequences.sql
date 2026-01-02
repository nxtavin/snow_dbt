create or replace  sequence seq_1 start = 1 increment = 1;

create or replace table seq_table (id int default seq_1.NEXTVAL ,c_name varchar(100)   );

"""
SEQUENCES -
Every seq.nextval increments the sequence.
Each generated sequence value additionally reserves values depending on the sequence interval, also called the “step”
When multiple inserts happen, use NOORDER property.
"""
select seq_1.NEXTVAL;


insert into seq_table(c_name) select c_name from SNOWFLAKE_SAMPLE_DATA.TPCH_SF1000.CUSTOMER;