### 3 Account Types

#### Organization account

- Special account type to perform tasks affecting entire org by using GLOBALORGADMIN role.

##### Premium aggregation views 

- Aggregation of all accounts in ORGANIZATION_USAGE schema are available in this account.
- Generating these views uses compute.
- These are accessible using `GRANT APPLICATION ROLE SNOWFLAKE.ORG_USAGE_ADMIN TO ROLE custom_role;`

##### Organization users

Organization admin creates Organization users & organization groups. Account admins will import these groups.

###### Creation

1. Create organization user
`
USE ROLE GLOBALORGADMIN;
CREATE ORGANIZATION USER asmith
   EMAIL = 'asmith@example.com'
   LOGIN_NAME = 'asmith@example.com';
`
2. Create organization group.
`
CREATE ORGANIZATION USER GROUP data_engineers_group
 IS_GRANTABLE = TRUE; --  the account administrator will be able to grant the role created from the organization user group to a local, account-specific role
`
3. Make the visibility to accounts 
`
ALTER ORGANIZATION USER GROUP data_engineers_group
   SET VISIBILITY = ACCOUNTS qa_env;
`

###### Availability in regular accounts :

`ALTER ACCOUNT
  ADD ORGANIZATION USER GROUP data_stewards_group;`



####  Snowflake account
- Can be renamed
- Can be 25 accounts, but can be extended to 100.

##### Drop account

    1. Define the grace period (min 3 days to 90 days)
    2. Drop listing,  shares before dropping the account.



####  Parameters

Snowflake provides three types of parameters that can be set for your account:

1. Account parameters that affect your entire account.

2. Session parameters that default to users and their sessions.

3. Object parameters that default to objects (warehouses, databases, schemas, and tables).



#### User management

###### Types

    - PERSON, NULL ( SAME AS PERSON) , SERVICE , SNOWFLAKE_SERVICE

###### Drop

If a dropped user’s worksheets do not have sharing enabled, an administrator can recover up to 500 worksheets owned by the user.