"""
For persisted query results of all sizes, the cache expires after 24 hours and will reset 
to another 24 hours if used till 31 days.


For bigger results, tokens expire after 6 hours unlike smaller results
"""


"""
Previous query processing can be done using result_scan & pipe.

"""
-- USING RESULT SCAN.

SELECT  *
    FROM table(RESULT_SCAN(LAST_QUERY_ID()))


-- USING PIPE TO PROCESS PREVIOUS COMMAND OUTPUT.

SHOW DATABASES
    ->> SELECT "kind" FROM $1;
