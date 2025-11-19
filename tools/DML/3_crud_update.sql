-- Always use SELECT first to make sure you UPDATE right data
UPDATE schema_name.table_name
SET
    employment_year = 2023
WHERE
    employee_id IN (98, 99);

UPDATE schema_name.table_name
SET
    pension_plan = 1
WHERE
    employment_year < 2016;
