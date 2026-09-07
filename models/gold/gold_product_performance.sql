{# units sold and revenue per product, with its category #}

SELECT
  product_id,
  product_category,
  SUM(quantity) AS units_sold,
  SUM(revenue) AS revenue
FROM
  {{ ref('silver_customer_view') }}
GROUP BY
  product_id,
  product_category
ORDER BY
  units_sold DESC,
  revenue DESC

