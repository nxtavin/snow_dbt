-- An USER needs to create a share & create listing previlage and also have ownership / grnat previlage on database/ schema.

-- Created in an UI

"""
Multiple listings can have the same title, but each listing must have a unique listing name or ULL

Listing Title       : Employee's Table ( Can be same in org )
Listing Name ( ull ): "PROVIDERS_ORGANIZATION_NAME$INTERNAL$MY_LISTING_NAME_123" ( will be different )  <-- Will be used in queries.

"""

SHOW AVAILABLE LISTINGS
  IS_ORGANIZATION = TRUE;

--


  SHOW ACCOUNTS;



SELECT * FROM snowflake.organization_usage.access_history
  WHERE provider_base_objects_accessed IS NOT NULL;



CREATE TABLE 