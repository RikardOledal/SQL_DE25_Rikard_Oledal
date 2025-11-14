-- join data
CREATE TABLE
    IF NOT EXISTS join_table AS (
        SELECT
            orders.order_id,
            orders.order_date,
            orders.customer_id,
            orders.staff_id,
            orders.order_status,
            orders.required_date,
            customers.customer_id,
            customers.first_name as customer_first_name,
            customers.last_name as customer_last_name,
            customers.phone as customer_phone,
            customers.email as customer_email,
            customers.street as customer_street,
            customers.city as customer_city,
            customers.state as customer_state,
            customers.zip_code as customer_zip_code,
            order_items.product_id as product_id,
            order_items.quantity,
            order_items.list_price,
            order_items.discount,
            products.product_name,
            products.brand_id,
            products.category_id,
            products.model_year,
            categories.category_name,
            brands.brand_name,
            staffs.first_name as staff_first_name,
            staffs.last_name as staff_last_name,
            staffs.manager_id
        FROM
            bikes.main.orders AS orders
            LEFT JOIN bikes.main.customers customers ON orders.customer_id = customers.customer_id
            LEFT JOIN bikes.main.order_items order_items ON orders.order_id = order_items.order_id
            LEFT JOIN bikes.main.products products ON order_items.product_id = products.product_id
            LEFT JOIN bikes.main.categories categories ON products.category_id = categories.category_id
            LEFT JOIN bikes.main.brands brands ON products.brand_id = brands.brand_id
            LEFT JOIN bikes.main.staffs staffs ON orders.staff_id = staffs.staff_id
    );