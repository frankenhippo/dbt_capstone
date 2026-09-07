{#
Get all customer IDs that are present in either the customers or the 
orders table. Flag any that are missing a customer record.
#}

SELECT 
  COALESCE(c.customer_id, o.customer_id) AS customer_id,
  ANY_VALUE(c.signup_date) AS signup_date,
  ANY_VALUE(c.region) AS region,
  ANY_VALUE(c.loyalty_tier) AS loyalty_tier,
  LOGICAL_AND(c.customer_id IS NULL) AS customer_details_missing
FROM
  {{ ref('bronze_customers') }} c
    FULL JOIN
  {{ ref('bronze_orders') }} o
    ON c.customer_id = o.customer_id  
GROUP BY
  COALESCE(c.customer_id, o.customer_id)