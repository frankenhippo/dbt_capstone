SELECT 
    product_id,
    ANY_VALUE(product_category) AS product_category,
    ANY_VALUE(unit_price) AS unit_price,
    COUNT(DISTINCT product_category) > 1 AS multiple_categories,
    COUNT(DISTINCT unit_price) > 1 AS multiple_prices
FROM
    {{ ref('bronze_products') }}
GROUP BY
    product_id