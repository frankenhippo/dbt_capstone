{# revenue, order count, and most recent order per customer (completed orders only) #}

SELECT
  customer_id,
  COUNT(DISTINCT order_id) AS order_count,
  MAX(order_date) AS most_recent_order,
  SUM(revenue) AS revenue
FROM
    {{ ref('silver_customer_view') }} c
WHERE
  order_status = 'completed'
GROUP BY
  customer_id
ORDER BY
  revenue DESC
