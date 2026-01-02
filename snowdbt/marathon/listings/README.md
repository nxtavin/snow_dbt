# Listings

- Used by Snowflake users.
- List in Public via Marketplace & privately to selected accounts.

### Organisations Listings

- The Internal Marketplace is an organized way to discover data products 
-  Access can be managed by 
    1. account targeting and 
    2. Role-Based Access Control (RBAC)
- Organizational listings can be queried without mounting via <ull>.<schema>.<view>
    - ull : `ORGDATACLOUD${org_profile_name}${organizational_listing_name} `

#### HOW

##### Use profiles 

Organization profiles provide consumers with a reliable method to confirm that the organizational listings they use come from trusted sources within their organization . 

A GLOBALORGADMIN can grant 'CREATE ORGANIZATION PROFILE' to create this profile. No other role - SYSADMIN,ACCOUNTADMIN etc will have this role

Format :  The format of an organization profile is `ORGDATACLOUD${org_profile_name}${organizational_listing_name}`

##### Auto Fulfilment

Enable using : `CALL SYSTEM$ENABLE_GLOBAL_DATA_SHARING_FOR_ACCOUNT('<ORGACCOUNT>');`

Set the refresh cycles.

#### WHO

##### Provider

Listings are created on a share ,and a provider needs to have ownership/grant option on objects.

Required Previlages : 

1. CREATE SHARE
2. OWNERSHIP / 'USAGE with GRANTS' to make the DATABASE or SCHEMA are granted access to.
3. CREATE LISTING to create a listing !

##### Consumer

 organization user groups

- If you require mounting the listing,  we need to import the organizational listing & also be able to create a database and mount the listing objects.
    1. IMPORT ORGANIZATION LISTING
    2. CREATE database 


###### Access 

We need not mount the listing , and can directly access the datasets using 

`SELECT * FROM <ull>.<schema>.<view>`

#### MONITOR/GOVERNANCE

The usage metrics are stored in 'organization_usage' schema. So different previlages are required.

`SELECT * FROM snowflake.organization_usage.access_history
  WHERE provider_base_objects_accessed IS NOT NULL;`









### Snowflake Marketplace Listings

### HOW

#### WHO

#### MONITOR

### Data Exchange Listings

### HOW

#### WHO

#### MONITOR