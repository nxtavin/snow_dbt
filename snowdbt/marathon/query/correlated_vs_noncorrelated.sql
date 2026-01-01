"""
A correlated subquery can be thought of as a filter on the table that it refers to, as if the subquery were evaluated on each row of the table in the outer query.
"""

"""
-- Uncorrelated subquery:
SELECT c1, c2
  FROM table1 WHERE c1 = (SELECT MAX(x) FROM table2);

-- Correlated subquery:
SELECT c1, c2
  FROM table1 WHERE c1 = (SELECT x FROM table2 WHERE y = table1.c2);

Scalar vs. Non-scalar Subqueries

A scalar subquery returns a single value (one column of one row) . A non-scalar subquery returns 0, 1, or multiple rows, each of which may contain 1 or multiple columns

"""


select * from projects;
select * from employees;
-- Scalar
select * from employees e where project_id = (select min(project_id) from projects p where project_id = e.project_id) ;
-- Non-Scalar
select * from projects p where project_id in (select project_id from employees e where p.project_id = e.project_id) ;
