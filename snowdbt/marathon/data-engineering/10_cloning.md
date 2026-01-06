# Clone
|  Object   | Cloned  |Previlages  | Comments|
| -------- | ------- |-------|-------|
| File Formats | YES | SAME ||
| Tables | YES | SAME ||
| Named Stages | NO | NO |1. Cloning is supported only at the database or schema level.For stages without a directory table enabled, Snowflake creates empty clones (doesn’t make copies of files on the source stage).|



- CREATE OR REPLACE <object> statements are atomic. That is, when an object is replaced, the old object is deleted and the new object is created in a single transaction.