show stages;

-- User stage :
list @~;

-- Table stage :
list @%table_name;

-- Create named stage
create or replace stage loading_scenarios ;

desc stage loading_scenarios;
PUT file://C:\Users\avinn\de\snowflake\snow_dbt\snowdbt\marathon\data-engineering\datasets\load_scenarios\*.csv  @loading_scenarios AUTO_COMPRESS = FALSE;

LIST @loading_scenarios;

CREATE OR ALTER FILE FORMAT csv_format_header
TYPE = CSV 
PARSE_HEADER = TRUE ;

desc file format csv_format_header;

-- 0. create table

create table emp (
    employee_id integer,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(20),
    salary float
);

-- 1. Base
COPY INTO emp from @loading_scenarios FILES = ('employee_base.csv')
