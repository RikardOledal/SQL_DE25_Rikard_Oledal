-- a) Create a database file called bike_join.duckdb and ingest the data from the csv file into your database.

-- CREATE TABLE
    -- IF NOT EXISTS bikedata AS (
        -- SELECT
            -- *
        -- FROM
            -- read_csv_auto ('data/bike_joined_table.csv')
    -- )

-- ┌─────────────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
-- │     column_name     │ column_type │  null   │   key   │ default │  extra  │
-- ├─────────────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
-- │ order_id            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ order_date          │ DATE        │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_id         │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ staff_id            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ order_status        │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ required_date       │ DATE        │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_id_1       │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_first_name │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_last_name  │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_phone      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_email      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_street     │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_city       │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_state      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ customer_zip_code   │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ product_id          │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ quantity            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ list_price          │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ discount            │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ product_name        │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ brand_id            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ category_id         │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ model_year          │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ category_name       │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ brand_name          │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ staff_first_name    │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ staff_last_name     │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ manager_id          │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- ├─────────────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┤
-- │ 28 rows                                                         6 columns │
-- └───────────────────────────────────────────────────────────────────────────┘

desc bikedata;

-- b) The column order_id is the unique identifier of an order. How many unique orders are in the data?

-- ┌───────────────┐
-- │ unique_orders │
-- ├───────────────┤
-- │     1615      │
-- └───────────────┘

SELECT
    count(distinct order_id) AS unique_orders
FROM
    bikedata;

-- c) A unique order can involve multiple products. The column product_id is the unique identifier of a product. How many unique products are in the data?

-- ┌─────────────────┐
-- │ unique_products │
-- ├─────────────────┤
-- │       307       │
-- └─────────────────┘

SELECT
    count(distinct product_id) AS unique_products
FROM
    bikedata;

-- d) For the product with product_name Surly Straggler - 2016, how many customers have ordered it? How much is the total sales value coming from these orders?

-- ┌──────────────┬─────────────┐
-- │ nr_customers │ total_sales │
-- ├──────────────┼─────────────┤
-- │      97      │  203508.0   │
-- └──────────────┴─────────────┘

SELECT
    count(customer_id) AS nr_customers,
    round(sum(list_price*(1-discount)*quantity),0) AS total_sales
FROM
    bikedata
WHERE
    product_name = 'Surly Straggler - 2016';

-- e) How many customers are coming from these cities: San Angelo, Orchard Park and Merrick?

-- ┌──────────────┐
-- │ nr_customers │
-- ├──────────────┤
-- │      35      │
-- └──────────────┘

SELECT
    count(distinct customer_id) AS nr_customers
FROM
    bikedata
WHERE
    customer_city IN ('San Angelo', 'Orchard Park', 'Merrick')

-- f) Create a new column manager_name using the information below:

ALTER TABLE bikedata
ADD COLUMN manager_name VARCHAR DEFAULT 'Cathy Larsson';

UPDATE bikedata
SET
    manager_name = 'Amy Andersson'
WHERE
    manager_id = 1;

UPDATE bikedata
SET
    manager_name = 'Bill Berg'
WHERE
    manager_id = 2;

UPDATE bikedata
SET
    manager_name = 'Davis Lam'
WHERE
    manager_id = 7;



