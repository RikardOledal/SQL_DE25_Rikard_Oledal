CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.bikes AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/join_table.csv')
    );