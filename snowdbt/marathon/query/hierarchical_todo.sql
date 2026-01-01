"""
If the hierarchies are contiguous : 
TODO : https://docs.snowflake.com/en/user-guide/queries-cte
"""

CREATE OR REPLACE TABLE heirarchy_employees (title VARCHAR, employee_ID INTEGER, manager_ID INTEGER);

INSERT INTO heirarchy_employees (title, employee_ID, manager_ID) VALUES
    ('President', 1, NULL),  -- The President has no manager.
        ('Vice President Engineering', 10, 1),
            ('Programmer', 100, 10),
            ('QA Engineer', 101, 10),
        ('Vice President HR', 20, 1),
            ('Health Insurance Analyst', 200, 20);

select e.employee_id,e.title as employee_title,
m.employee_id as managerid , m.title as manager_title
 from heirarchy_employees e 
 left join heirarchy_employees m 
 on e.manager_id = m.employee_id;

"""
Recursive CTE -- 
"""
with t as (
    select employee_id,title,NULL as manager_id,NULL as manager_title from heirarchy_employees where manager_id is null 
    union all 
    select m.employee_id,m.title,t.employee_id as manager_id,t.title as manager_title from t join heirarchy_employees m on t.employee_id = m.manager_id 
)
select * from t ;

"""
CONNECT BY allows only self-joins
"""