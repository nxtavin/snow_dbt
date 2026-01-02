create schema listings;
grant ownership on schema listings to role dbt_developer;


-- A lising role needs to create a share & create listing previlage and also have ownership / grnat previlage on database/ schema.
create role internal_lister;

grant CREATE SHARE to role internal_lister;
grant CREATE ORGANIZATION LISTING to role internal_lister;


grant role internal_lister to role dbt_developer;


