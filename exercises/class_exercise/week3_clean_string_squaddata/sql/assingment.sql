-- Task 1
-- You are asked to create a database with:
-- a schema called staging
-- a table under the schema, called squad

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.squad AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/squad.csv')
    )

-- Task 2
-- Find rows that do not contain the title column value in the context column value.

SELECT
    *
FROM
    staging.squad
WHERE
    instr (context, title) = 0;
-- Task 3
-- Find rows that start with title column value in the context column value.
-- Task 4
-- Create a new column which is the first answer of the AI model. Do not use pattern matching in your query.


-- Task 5
-- Create a new column which is the first answer of the AI model. Use pattern matching in your query