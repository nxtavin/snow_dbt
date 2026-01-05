## Loading

- Default timeout is 24 hours for a loading operation

### Bulk Loading

- Bulk loading relies on user defined WAREHOUSE.

### Continuous Loading

- Snowpipe loading of small batches will be done using serverless warehouses - after receiving a notification.
- Snowpipe Streaming directly into tables without stages.

### Files <=> File Formats

- Can be 
    - encrypted, 
    - Compressed
    - delimited ( UTF-8 default encoding) / others - avro , parquet , ORC , XML , semi-structured.

- File formats can be specified in multiple locations, the load operation applies the options in the following order of precedence
    |  Priority (not cumulative)   | File format locations  |
    | -------- | ------- |
    | 1 | COPY INTO TABLE statement. |
    | 2 | Stage definition. |
    | 3 | Table definition. |
  - Copy OPTIONS ARE CUMULATIVE

-   A delimited file can be *loaded paralelly* if its in RFC4180 specification & on_error = continue & multiline is false.


#### Sizes - Files & Columns

- If files are smaller , consider combining them using Amazon Firehouse . 
- Else ensure they are around 128 MB. 
- If we do not specify length ,The max storage limit for VARIANT , VARCHAR , OBJECT applies which is 128 MB. For BINARY its 64 MB , and cannot be updated once defined in a table.
> Variant

- Speed selects: Snowflake extracts as much of the data as possible to a columnar form when we use variant if there is no null value / data-type mismatch in any row. ( 200 elements per partition )
- Slow selects: The rest of the data is stored as a single column. Snowflake needs to parse entire row leading to less performance.


#### Metadata

> Load metadata expires after 64 days.

- LAST_MODIFIED :
  - To prevent accidental reload, the command skips the file by default if metadata is expired.
  - LOAD_UNCERTAIN_FILES = true loads them.


### COPY 

- Copy options set in multiple locations are cumulative. Individual options set in one place override the same option set lower in the order of precedence.

#### History

|  Last   | Access  |
| -------- | ------- |
| 365 days  | COPY_HISTORY view in the ACCOUNT_USAGE schema
| 14 days for a specific table |  COPY_HISTORY table function    |

## Schema

### Infer Schema

- GENERATE_COLUMN_DESCRIPTION: Generates a list of columns from a set of staged files using the INFER_SCHEMA function output.

