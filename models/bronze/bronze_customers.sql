SELECT  
  UPPER(TRIM(customer_id)) AS customer_id, 
  safe.PARSE_DATE('%m/%d/%Y', signup_date) AS signup_date, 
  LOWER(region) AS region, 
  LOWER(loyalty_tier) AS loyalty_tier
FROM {{ source('shopglo_source', 'raw_customer') }} 