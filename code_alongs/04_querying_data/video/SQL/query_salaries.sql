SELECT
    *
FROM
    data_jobs;

-- schema namespace
SELECT
    *
FROM
    main.data_jobs;

-- fully qualified name
SELECT
    *
FROM
    data_jobs.main.data_jobs;

-- the limit clause choosed how many rows to return
SELECT
    *
FROM
    data_jobs
LIMIT
    5;

-- offset
SELECT
    *
FROM
    data_jobs
OFFSET
    5;

desc data_jobs;

-- select specified columns
SELECT
    work_year, job_title, salary_in_usd, company_location
FROM
    data_jobs;

-- select all columns exept those specified
-- in exclude
SELECT
    * EXCLUDE (salary, work_year)
FROM
    data_jobs;

SELECT DISTINCT
    employment_type
FROM
    data_jobs;

SELECT DISTINCT
    experience_level
FROM
    data_jobs;