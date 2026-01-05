# Stages

| Type    | Desc |Access @ |
| -------- | ------- |------- |
| User stages |Cannot be altered or dropped. They are tied to users.|@~|
| table stages | Cannot be altered or dropped. They are tied to tables.|@%tablename |
| Named stages |are database objects  created in a schema , and hance can be controlled using previlages.|@stage_name |

## Named stages

| Attributes    | Desc |Comments  |
| -------- | ------- | -------|
| TEMPORARY  | Created & dropped at end of session. | |
| FILE_FORMAT  | Optional format | Define options for different types. |
| ENCRYPTION | SNOWFLAKE_FULL / SNOWFLAKE_SSE |Default encryption is SNOWFLAKE_FULL(Client-side and server-side encryption). |
| DIRECTORY  | stores file-level metadata about the data files in the stage. | AUTO_REFRESH = True enables auto refresh of metadata. |

## PUT

- When we put a file to stage will be compressed because AUTO_COMPRESS is set to TRUE
- We can define SOURCE_COMPRESSION 

`PUT file:///tmp/data/orders_001.csv @%orderstiny_ext
  AUTO_COMPRESS = FALSE;`

## Directory Tables 

Let you see files on the stage, but require a warehouse and thus incur a cost. 