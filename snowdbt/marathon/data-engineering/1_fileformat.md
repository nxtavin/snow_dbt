# Fileformats

| Group    | Attributes |Comments  |
| -------- | ------- | -------|
| FILE  | COMPRESSION, TYPE, ENCODING , PARSE_HEADER, SKIP_HEADER   |Invalid file format : "PARSE_HEADER" is only allowed for CSV INFER_SCHEMA and MATCH_BY_COLUMN_NAME|
| DATA | RECORD_DELIMITER/FIELD_DELIMITER  , MULTI_LINE,NULL_IF | |
| MISC | ERROR_ON_COLUMN_COUNT_MISMATCH = FALSE | Needed for Schema evolution +  When you load a CSV file with INCLUDE_METADATA  |
| MISC | EMPTY_FIELD_AS_NULL  | If set to FALSE, Snowflake attempts to cast an empty field to the corresponding column type. |

-- <https://docs.snowflake.com/en/sql-reference/sql/create-file-format#syntax>

- Snowflake stores all data internally in the UTF-8 character set. The data is converted into UTF-8 before it is loaded into Snowflake.
