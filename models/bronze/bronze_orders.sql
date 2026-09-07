SELECT 
  UPPER(TRIM(order_id)) AS order_id, 
  UPPER(TRIM(customer_id)) AS customer_id, 
  UPPER(TRIM(product_id)) AS product_id,
  safe.PARSE_DATE('%m/%d/%Y', order_date) AS order_date, 
  SAFE_CAST(quantity AS INT64) AS quantity, 
  LOWER(TRIM(status)) AS order_status
FROM {{ source('shopglo_source', 'raw_orders') }} 