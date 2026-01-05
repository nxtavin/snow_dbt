#### Shares

- Snowflake enables the sharing of databases ( read-only) across regions and cloud platforms through shares - created (share/ readonly database) only by an ACCOUNTADMIN.

##### Properties

- By default we must use secure views, secure materialized views and/or secure UDFs.
  - We can also create non secure views using `SECURE_OBJECTS_ONLY=FALSE`

- A new object created or recreated in a database granted to a share is not automatically available to consumers

- Cannot clone objects.

- If we reference data from another database, use `GRANT REFERENCE_USAGE ON DATABASE customer1_db TO SHARE share1;`

##### Provider

- Share a databases by granting database role  (usage .. database ,usage .. schema) to a share ( its a snowflake object ).
  - A database role with guture grants is not possible on a share.

##### Consumer 

    - We create database using `CREATE DATABASE <name> FROM SHARE <provider_account>.<share_name>`
###### Roles

1. Use database roles .

2. imported privileges
    - If Objects in a share not associated with a database role , use `grant imported privileges on database` , else use roles.
