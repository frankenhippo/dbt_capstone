SELECT 
    UPPER(TRIM(product_id)) AS product_id, 
    LOWER(TRIM(product_name)) AS product_name, 
    LOWER(TRIM(category)) AS product_category,
    SAFE_CAST(unit_price AS DECIMAL) AS unit_price
FROM 
    {{ source('shopglo_source', 'raw_products') }} 