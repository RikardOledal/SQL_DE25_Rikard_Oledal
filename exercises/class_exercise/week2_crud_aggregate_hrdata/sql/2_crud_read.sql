SELECT * FROM staging.employees;
SELECT * FROM read_csv('data/employees.csv');
SELECT * FROM staging.employees WHERE employment_year < 2016;
SELECT * FROM staging.employees WHERE employment_year = 2001;
SELECT * FROM read_csv('data/more_employees.csv');
SELECT * FROM staging.all_employees;
-- employee_id = BIGINT
-- department = VARCHAR (10 departments)
-- employment_year = BIGINT
-- pension_plan = BIGINT
-- monthly_salary_sek = DOUBLE
-- working_ratio = DOUBLE procent working
-- training_hours_2024 = BIGINT
-- overtime_hours_2024 = BIGINT

SELECT DISTINCT
    department,
    COUNT(*)
FROM
    staging.all_employees;


SELECT DISTINCT
    department,
    COUNT(*)
FROM
    staging.all_employees;

SELECT
    department,
    ROUND(MEDIAN(monthly_salary_sek),0) AS Median_pay,
    ROUND(AVERAGE(monthly_salary_sek),0) AS Mean_pay,
    MAX(monthly_salary_sek) AS Max_pay,
    MIN(monthly_salary_sek) AS Min_pay
FROM
    staging.all_employees
GROUP BY
    department;
