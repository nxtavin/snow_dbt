# Fileformats

| Group    | Attributes |Comments  |
| -------- | ------- | -------|
| FILE  | COMPRESSION, TYPE, ENCODING , PARSE_HEADER, SKIP_HEADER   | |
| DATA | RECORD_DELIMITER/FIELD_DELIMITER  , MULTI_LINE,NULL_IF | |

-- https://docs.snowflake.com/en/sql-reference/sql/create-file-format#syntax

- Snowflake stores all data internally in the UTF-8 character set. The data is converted into UTF-8 before it is loaded into Snowflake.

Flow :

1. Do we need to use file headers [ PARSE_HEADER ] ( applicable only if we use INFER_SCHEMA & using MATCH_BY_COLUMN_NAME ) or not [ SKIP_HEADER ]?
2. 