-- models/intermediate/int_orders_operational.sql

SELECT 
    om.orders_id,
    om.date_date,
    om.revenue,
    om.quantity,
    om.purchase_cost,
    om.margin,
    s.shipping_fee,
    s.log_cost,
    CAST(s.ship_cost AS FLOAT64) AS ship_cost,
    om.margin + s.shipping_fee - s.log_cost - CAST(s.ship_cost AS FLOAT64) AS operational_margin,
    om.margin + s.shipping_fee - s.log_cost - CAST(s.ship_cost AS FLOAT64) AS profit
FROM {{ ref('int_orders_margin') }} om
LEFT JOIN {{ ref('stg_raw__ship') }} s
    ON om.orders_id = s.orders_id