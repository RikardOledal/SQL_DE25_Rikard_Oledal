SELECT
    COUNT(*)
FROM
    data_jobs;


SELECT
    COUNT(*)
FROM
    data_jobs
WHERE
    salary_in_usd < 50000;

-- Find entry level jobs
SELECT DISTINCT
    experience_level
FROM
    data_jobs;

-- Find pay for entry level jobs
SELECT
    MAX(salary_in_usd) AS max_entry_salary_usd,
    MEDIAN(salary_in_usd) AS median_entry_salary_usd,
    ROUND(AVG(salary_in_usd),2) AS average_entry_salary_usd,
    MIN(salary_in_usd) AS min_entry_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'EN';

-- Find pay for mid level jobs
SELECT
    MAX(salary_in_usd) AS max_midexp_salary_usd,
    MEDIAN(salary_in_usd) AS median_midexp_salary_usd,
    ROUND(AVG(salary_in_usd),2) AS average_midexp_salary_usd,
    MIN(salary_in_usd) AS min_midexp_salary_usd
FROM
    data_jobs
WHERE
    experience_level = 'MI';