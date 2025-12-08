SELECT
    p.amount,
    p.payment_date,
    r.rental_date,
    r.return_date,
    c.customer_id,
    c.first_name || ' ' || c.last_name AS customer,
    s.store_id
FROM staging.payment p
    LEFT JOIN staging.rental r ON p.rental_id = r.rental_id
    LEFT JOIN staging.customer c ON p.customer_id = c.customer_id
    LEFT JOIN staging.store s ON c.store_id = s.store_id;