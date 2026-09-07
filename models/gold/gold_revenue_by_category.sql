{#  total revenue and order count per product category #}

SELECT
  product_category,
  COUNT(DISTINCT order_id) AS order_count,
  SUM(revenue) AS total_revenue
FROM
  {{ ref('silver_customer_view') }}
GROUP BY
  product_category
ORDER BY
  order_count DESC,
  total_revenue DESC