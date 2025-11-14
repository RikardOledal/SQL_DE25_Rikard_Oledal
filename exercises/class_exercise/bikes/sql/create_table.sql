CREATE TABLE
    IF NOT EXISTS brands AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/brands.csv')
    );

CREATE TABLE
    IF NOT EXISTS categories AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/categories.csv')
    );

CREATE TABLE
    IF NOT EXISTS customers AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/customers.csv')
    );

CREATE TABLE
    IF NOT EXISTS order_items AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/order_items.csv')
    );

CREATE TABLE
    IF NOT EXISTS orders AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/orders.csv')
    );

CREATE TABLE
    IF NOT EXISTS products AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/products.csv')
    );

CREATE TABLE
    IF NOT EXISTS staffs AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/staffs.csv')
    );

CREATE TABLE
    IF NOT EXISTS stocks AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/stocks.csv')
    );

CREATE TABLE
    IF NOT EXISTS stores AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/stores.csv')
    );
