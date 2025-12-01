-- Task 1
-- You are given two csv files exported from the two CRM systems for customer information.

-- Create a database called crm with a staging schema. Then, create two tables under the staging schema to store the data of the two csv files.

-- ┌─────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
-- │ column_name │ column_type │  null   │   key   │ default │  extra  │
-- │   varchar   │   varchar   │ varchar │ varchar │ varchar │ varchar │
-- ├─────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
-- │ customer_id │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ name        │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ email       │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ region      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ status      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- └─────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┘
-- ┌─────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
-- │ column_name │ column_type │  null   │   key   │ default │  extra  │
-- │   varchar   │   varchar   │ varchar │ varchar │ varchar │ varchar │
-- ├─────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
-- │ customer_id │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ name        │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ email       │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ region      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ status      │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
└─────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┘

-- Task 2
-- Both CRM datasets may contain invalid records. Identify all rows in both datasets that fail to meet the following rules:

-- The email address must include an @ symbol followed later by a .
-- The region value must be either EU or US
-- The status must be either active or inactive

SELECT
    'Old_CRM' AS type_crm,
    CASE
        WHEN instr(email[instr(email,'@'):],'.') < 1 THEN 'Email'
        WHEN region != 'EU' AND region !='US' THEN 'Wrong Region'
        WHEN trim(status) != 'active' AND trim(status) != 'inactive' THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.old_crm
WHERE validation_error is NOT NULL
UNION
SELECT
    'New_CRM' AS type_crm,
    CASE
        WHEN instr(email[instr(email,'@'):],'.') < 1 THEN 'Email'
        WHEN region != 'EU' AND region !='US' THEN 'Wrong Region'
        WHEN trim(status) != 'active' AND trim(status) != 'inactive' THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.new_crm
WHERE validation_error is NOT NULL;

-- Update after Debbie

SELECT
    'Old_CRM' AS type_crm,
    CASE
        WHEN NOT regexp_matches(email,'[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]') THEN 'Wrong Email'
        WHEN NOT region IN ('EU', 'US') THEN 'Wrong Region'
        WHEN NOT trim(status) IN ('active', 'inactive') THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.old_crm
WHERE validation_error is NOT NULL
UNION
SELECT
    'New_CRM' AS type_crm,
    CASE
        WHEN NOT regexp_matches(email,'[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]') THEN 'Wrong Email'
        WHEN NOT region IN ('EU', 'US') THEN 'Wrong Region'
        WHEN NOT trim(status) IN ('active', 'inactive') THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.new_crm
WHERE validation_error is NOT NULL;

-- ┌──────────┬──────────────────┬─────────────┬─────────┬──────────────────┬─────────┬───────────────┐
-- │ type_crm │ validation_error │ customer_id │  name   │      email       │ region  │    status     │
-- ├──────────┼──────────────────┼─────────────┼─────────┼──────────────────┼─────────┼───────────────┤
-- │ New_CRM  │ Wrong status     │        1052 │ Fred    │ rob@example.com  │ US      │ blocked       │
-- │ Old_CRM  │ Email            │        1030 │ Stephen │ @@@              │ EU      │ active        │
-- │ Old_CRM  │ Wrong Region     │        1031 │ Petra   │ jim@example.com  │ AS      │ active        │
-- │ New_CRM  │ Wrong Region     │        1051 │ Lisa    │ lisa@example.com │ AU      │ inactive      │
-- │ Old_CRM  │ Wrong status     │        1032 │ Kim     │ kat@example.com  │ US      │ paused        │
-- └──────────┴──────────────────┴─────────────┴─────────┴──────────────────┴─────────┴───────────────┘

-- Task 3
-- Create a new schema called constrained and create two tables under it. For each table, create column constraints for the rules specified in task 2 and insert rows fulfilling these constraints separately from the two tables in the staging schema.

-- Task 4
-- In tasks 4 and 5, use the data in the staging schema that store customer records before column constraints are enforced.

-- To validate whether the old and new CRM systems keep the same customer records, use the column customer_id as the unique identifier of customers and find out:

-- customers only recorded in the old CRM system
-- customers only recorded in the new CRM system
-- customers recorded in both CRM system
-- Task 5
-- With your findings above, you are going to produce a discrepancy report showing customer records that have issues and need to be further checked with the system migration and customer teams.

-- Include records that

-- violate constraints in task 2
-- are not common as you found in task 4