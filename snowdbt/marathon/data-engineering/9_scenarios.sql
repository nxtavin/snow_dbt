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

-- File Format + parse header | Invalid file format : "PARSE_HEADER" is only allowed for CSV INFER_SCHEMA and MATCH_BY_COLUMN_NAME
CREATE OR ALTER FILE FORMAT csv_format_header
TYPE = CSV 
PARSE_HEADER = TRUE ;

-- File Format + skip header
CREATE OR ALTER FILE FORMAT csv_format_noheader
TYPE = CSV 
SKIP_HEADER = 1 ;


desc file format csv_format_noheader;

-- 0. create table

create or replace table emp (
    employee_id integer,
    first_name varchar(20),
    last_name varchar(20),
    email varchar(50),
    salary float
);

-- 1. Base
COPY INTO emp from @loading_scenarios 
FILES = ('employee_base.csv')
-- INCLUDE_METADATA = (ingestdate = METADATA$START_SCAN_TIME)  -- This requires PARSE_HEADER = true so ingest_date can be mapped properly
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader')
RETURN_FAILED_ONLY = TRUE ;

-- 2. Colname mismatch employee_colname_mismatch.csv -- since headers are ignore, this doesnt cause any issue.
COPY INTO emp from @loading_scenarios FILES = ('employee_colname_mismatch.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader');

-- 3. Duplicates employee_duplicates.csv. Use later stages to dedup.  -- refer dedup.md
COPY INTO emp from @loading_scenarios FILES = ('employee_duplicates.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader');

delete from emp 
qualify row_number() over (partition by employee_id order by salary desc) > 1;

-- 4. large column size
COPY INTO emp from @loading_scenarios FILES = ('employee_large_column_size.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader')
ON_ERROR = SKIP_FILE 
TRUNCATECOLUMNS = TRUE  -- THIS OPTION WILL NOT RAISE ANY ERROR.
RETURN_FAILED_ONLY = TRUE ;



-- 5. New columns | employee_new_columns.csv

COPY INTO emp from @loading_scenarios FILES = ('employee_new_columns.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader')
RETURN_FAILED_ONLY = TRUE ;

-- enable schema evolution

alter table emp set ENABLE_SCHEMA_EVOLUTION = TRUE;

-- To evolve schema, we need to understand header , and also match respective column names.
COPY INTO emp from @loading_scenarios FILES = ('employee_new_columns.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_header' ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE -- ERROR_ON_COLUMN_COUNT_MISMATCH is required for schema evolution
)  -- Use header file format.
MATCH_BY_COLUMN_NAME = CASE_INSENSITIVE;

describe table emp
   ->> select "schema evolution record" from $1 ;



-- 6. Nulls | employee_nulls.csv

COPY INTO emp from @loading_scenarios FILES = ('employee_nulls.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader' ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE EMPTY_FIELD_AS_NULL = FALSE);

-- 7. Sepcial Chars | employee_special_chars.csv

COPY INTO emp from @loading_scenarios FILES = ('employee_special_chars.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader' ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE EMPTY_FIELD_AS_NULL = FALSE);


-- 8. Data type mismatch  | employee_units_mismatch.csv
COPY INTO emp from @loading_scenarios FILES = ('employee_units_mismatch.csv')
FILE_FORMAT = (FORMAT_NAME = 'csv_format_noheader' ERROR_ON_COLUMN_COUNT_MISMATCH=FALSE EMPTY_FIELD_AS_NULL = FALSE)
ON_ERROR = CONTINUE            -- Skip errors & continue. 
;

select *
from table(INFORMATION_SCHEMA.COPY_HISTORY(TABLE_NAME=>'EMP', START_TIME=> DATEADD(hours, -1, CURRENT_TIMESTAMP())));

select * from emp;




