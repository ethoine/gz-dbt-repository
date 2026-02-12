-- models/intermediate/int_sales_margin.sql

SELECT 
    s.orders_id,
    s.date_date,
    s.products_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    s.quantity * p.purchase_price AS purchase_cost,
    s.revenue - (s.quantity * p.purchase_price) AS margin
FROM {{ ref('stg_raw__sales') }} s
LEFT JOIN {{ ref('stg_raw__product') }} p 
    ON s.products_id = p.products_id