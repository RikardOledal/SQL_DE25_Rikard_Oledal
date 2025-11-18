UPDATE staging.employees
SET
    employment_year = 2023
WHERE
    employee_id IN (98, 99);

UPDATE staging.employees
SET
    pension_plan = 1
WHERE
    employment_year < 2016;
