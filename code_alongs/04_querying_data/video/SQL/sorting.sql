-- ascending order by default
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd;

-- descending order
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd
DESC;

-- sort by salary_in_usd DESC and job_title ascending ASC
SELECT
    *
FROM
    data_jobs
ORDER BY
    salary_in_usd DESC,
    job_title ASC;
