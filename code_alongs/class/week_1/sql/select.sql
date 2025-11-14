SELECT
    *
FROM
    staging.orders;

SELECT
    *
FROM
    staging.orders o
    LEFT JOIN staging.order_items oi ON o.order_id = oi.order_id;