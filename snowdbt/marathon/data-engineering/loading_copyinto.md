# LOADING - COPY INTO

### Validate

- Validate mode doesnt insert to table.
- Use VALIDATION_MODE + QUERY_ID + result_scan($qid) 







### Metadata Columns

- Use METADATA$START_SCAN_TIME as INSERTED_AT (audit column). -> CURRENT_TIMESTAMP is evaluated when the load operation is compiled in cloud services rather than when the record is inserted into the table (i.e. when the transaction for the load operation is committed). 