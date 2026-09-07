SELECT 
  c.customer_id,
  c.signup_date,  
  c.region,
  c.loyalty_tier,
  o.order_id,
  o.order_date,
  o.quantity,
  {# null if either is missing #}
  o.quantity * p.unit_price AS revenue, 
  p.product_id,
  p.product_category,
  o.order_status
FROM 
  {{ ref('silver_unique_customers') }} c
    LEFT JOIN
  {{ ref('silver_unique_orders') }} o
    ON c.customer_id = o.customer_id
    LEFT JOIN
  {{ ref('silver_unique_products') }} p
    ON o.product_id = p.product_id