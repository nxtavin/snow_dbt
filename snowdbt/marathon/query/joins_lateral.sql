""" 
JOINS
A join is a two-step process. First, the server pairs up two rows, which are usually in different tables,
 and which are almost always related in some way. Second, the server joins the columns of each row in the pair into a single row.
"""

CREATE TABLE projects (
  project_id INT,
  project_name VARCHAR);

INSERT INTO projects VALUES
  (1000, 'COVID-19 Vaccine'),
  (1001, 'Malaria Vaccine'),
  (1002, 'NewProject');

CREATE TABLE employees (
  employee_id INT,
  employee_name VARCHAR,
  project_id INT);

INSERT INTO employees VALUES
  (10000001, 'Terry Smith', 1000),
  (10000002, 'Maria Inverness', 1000),
  (10000003, 'Pat Wang', 1001),
  (10000004, 'NewEmployee', NULL);


"""
Conditions in where vs on yields different results . -- 4 vs 3 
Specifying the predicate in the ON subclause avoids the problem of accidentally filtering rows
with NULL values when using a WHERE clause to specify the join condition for an outer join.

"""

select count(*) as in_on
from projects p left join employees e on p.project_id = e.project_id
union all 
select count(*) as in_where
from projects p left join employees e where p.project_id = e.project_id

-- Natural join by default uses all matching columns and makes it an inner join.



"""
CROSS JOIN

for each row in left_hand_table LHT:
  for each row in right_hand_table RHT:
    concatenate the columns of the RHT to the columns of the LHT

"""


"""
LATERAL JOIN : Every row(all columns) in left table is sent to the right table , will be processed & then sent as output.

for each row in left_hand_table LHT:
  execute right_hand_subquery RHS 'using the values from the current row in the LHT'

The lateral join has only one loop, not two nested loops, which changes the output.

In a FROM clause, the LATERAL keyword allows an inline view ( SUBQUERY ) to reference columns from a table expression that precedes that inline view.
Unlike the output of a non-lateral join, the output from a lateral join includes only the rows generated from the inline view. 
The rows on the left-hand side do not need to be joined to the right hand side because the rows on the left-hand side have already been taken into account by being passed into the inline view.
"""
-- for each row in left_hand_table LHT:
--    execute right_hand_subquery RHS using the values from the current row in the LHT

CREATE or replace TABLE lateral_departments (department_id INTEGER, name VARCHAR);
CREATE or replace TABLE lateral_employees (employee_ID INTEGER, last_name VARCHAR,
  department_ID INTEGER,LATERAL_ONLY_COLUMN ARRAY);

INSERT INTO lateral_departments (department_ID, name) VALUES
  (1, 'Engineering'),
  (1, 'Duplicate-Engineering'),
  (2, 'Support');
INSERT INTO lateral_employees (employee_ID, last_name, department_ID) VALUES
  (101, 'Sravan', 1),
  (102, 'Ravan',  1),
  (103, 'Bhuwan',  2),
  (103, 'Suntun',  2);

update lateral_employees set LATERAL_ONLY_COLUMN = ARRAY_CONSTRUCT(1,2) where department_id = 1;
update lateral_employees set LATERAL_ONLY_COLUMN = ARRAY_CONSTRUCT(3,4) where department_id = 2;
select * from lateral_departments d, 
LATERAL  (select * from lateral_employees e where d.department_id=e.department_id);

-- Use LATERAL + EXPLODE TO FLATTEN / GET EXPLODE LIKE.

select e.*,value AS array_explode from lateral_employees e,
LATERAL FLATTEN(INPUT => e.lateral_only_column )  ;



"""
Correlated subquery vs lateral joins 
In a lateral join the subquery can generate more than one output row per input row, and each output row can contain multiple columns. 


Correlated subqueries return only one output row per input row, and each output row must contain only one column.

"""


"""
Snowflake does not enforce UNIQUE, PRIMARY KEY, and FOREIGN KEY constraints on standard tables. 

If we use ALTER TABLE table_name ADD CONSTRAINT constraint_name UNIQUE (column1, column2, ...) RELY; Snowflake will consider this and eliminate Eliminate Unnecessary Joins




"""