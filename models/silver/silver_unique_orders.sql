SELECT DISTINCT
  order_id,
  customer_id,
  order_date,
  product_id,
  quantity,
  order_status
FROM
  {{ ref('bronze_orders') }}