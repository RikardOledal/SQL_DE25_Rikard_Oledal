/*  ==============
    Query the data
    ============== */

-- overview of data
DESC;

DESC staging.bikes;

-- select all or some columns
SELECT
    *
FROM
    staging.bikes;

SELECT
    order_date,
    customer_first_name,
    customer_last_name,
    product_name
FROM
    staging.bikes;

-- filter rows
SELECT
    order_date,
    customer_first_name,
    customer_last_name,
    product_name
FROM
    staging.bikes
WHERE customer_first_name = "Marvin";

-- create a new table for order status description
CREATE TABLE IF NOT EXISTS staging.status (
    order_status INTEGER,
    order_status_desc VARCHAR,
)

INSERT INTO
    staging.status
VALUES
    (1,'Pending')
    (2,'Processing')
    (3,'Rejected')
    (4,'Completed');

-- join two tables
SELECT
    b.order_id,
    b.order_status,
    s.order_status_desc
FROM staging.bikes b
JOIN staging.status s ON b.order_status = s.order_status;

-- sort the rows by order_status ASC or DESC
SELECT
    b.order_id,
    b.order_status,
    s.order_status_desc
FROM staging.bikes b
JOIN staging.status s ON b.order_status = s.order_status
ORDER BY b.order_status ASC;

SELECT
    b.order_id,
    b.order_status,
    s.order_status_desc
FROM staging.bikes b
JOIN staging.status s ON b.order_status = s.order_status
ORDER BY b.order_status DESC;

/*  ===================
    Investigate unicqe
    customer
    =================== */

-- DISTINCT
SELECT
    order_id
FROM staging.bikes;

SELECT DISTINCT
    order_id
FROM staging.bikes;

-- find unique value of customer_id
SELECT DISTINCT
    customer_id
FROM
    staging.bikes
ORDER BY customer_id DESC;

-- find unique value of customer full names
SELECT DISTINCT
    customer_first_name,
    customer_last_name
FROM
    staging.bikes
ORDER BY
    customer_first_name,
    customer_last_name;

SELECT
    customer_first_name,
    customer_last_name,
    customer_id
FROM
    staging.bikes
WHERE
    customer_first_name = 'Justina' AND customer_last_name = 'Jenkins'; 

/*  ===================
    Investigate unicqe
    customer
    =================== */

-- aggregate over rows
-- there are different ways of aggregation(max, min...

SELECT
    order_id,
    product_name,
    quantity
    list_price
    quantity*list_price AS revenue
FROM
    staging.bikes
ORDER BY
    order_id;

SELECT
    ROUND(SUM(quantity*list_price),2) AS full_revenue,
    ROUND(MIN(quantity*list_price),2) AS min_revenue,
    ROUND(MAX(quantity*list_price),2) AS max_revenue,
    ROUND(AVG(quantity*list_price),2) AS mean_revenue,
    ROUND(MEDIAN(quantity*list_price),2) AS mean_revenue
FROM
    staging.bikes

/*  ===================
    CASE...WHEN
    =================== */
-- similar if...else in other languages

-- we can replace the order_status column to some descriptions

SELECT
    order_id,
    product_name,
    CASE order_status
        WHEN 1 THEN 'Pending'
        WHEN 2 THEN 'Processing'
        WHEN 3 THEN 'Rejected'
        WHEN 4 THEN 'Completed'
    END AS order_status_description
FROM
    staging.bikes;

SELECT
    COUNT(DISTINCT customer_id)
FROM staging.bikes;

SELECT
    COUNT(DISTINCT order_status) AS nr_status
FROM
    staging.bikes;