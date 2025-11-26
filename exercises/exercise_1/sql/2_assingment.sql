-- a) Count number of Data engineers jobs. For simplicity just go for job_title Data Engineer.

SELECT
    count(*) AS Data_Engineer
FROM
    salary_sek
WHERE
    job_title = 'Data Engineer';

-- ┌───────────────┐
-- │ Data_Engineer │
-- ├───────────────┤
-- │     3464      │
-- └───────────────┘

-- b) Count number of unique job titles in total.

SELECT 
    count(DISTINCT job_title) AS Titles
FROM
    salary_sek;

-- ┌────────┐
-- │ Titles │
-- ├────────┤
-- │  155   │
-- └────────┘

-- c) Find out how many jobs that goes into each salary level.

SELECT 
    salary_level,
    count(job_title) AS nr_jobs
FROM
    salary_sek
GROUP BY
    salary_level
ORDER BY
    nr_jobs;

-- ┌───────────────┬─────────┐
-- │ salary_level  │ nr_jobs │
-- ├───────────────┼─────────┤
-- │ INSANELY HIGH │    1101 │
-- │ HIGH          │    2919 │
-- │ LOW           │    4107 │
-- │ MEDIUM        │    8407 │
-- └───────────────┴─────────┘

-- d) Find out the median and mean salaries for each seniority levels.

SELECT 
    experience_level,
    round(avg(salary_annual_sek), 0) AS salary_mean,
    round(median(salary_annual_sek), 0) AS salary_median
FROM
    salary_sek
GROUP BY
    experience_level;

-- ┌──────────────────┬─────────────┬───────────────┐
-- │ experience_level │ salary_mean │ salary_median │
-- ├──────────────────┼─────────────┼───────────────┤
-- │ Expert level     │   1866727.0 │     1835520.0 │
-- │ Entry level      │    882650.0 │      793480.0 │
-- │ Mid level        │   1203825.0 │     1099400.0 │
-- │ Senior level     │   1564617.0 │     1481800.0 │
-- └──────────────────┴─────────────┴───────────────┘

-- e) Find out the top earning job titles based on their median salaries and how much they earn.

SELECT 
    job_title,
    round(avg(salary_annual_sek), 0) AS salary_mean,
FROM
    salary_sek
GROUP BY
    job_title
ORDER BY
    salary_mean DESC
LIMIT 10;

-- ┌────────────────────────────────┬─────────────┐
-- │           job_title            │ salary_mean │
-- │            varchar             │   double    │
-- ├────────────────────────────────┼─────────────┤
-- │ Analytics Engineering Manager  │   3822853.0 │
-- │ Data Science Tech Lead         │   3585000.0 │
-- │ Head of Machine Learning       │   2865691.0 │
-- │ Managing Director Data Science │   2676800.0 │
-- │ AWS Data Architect             │   2466480.0 │
-- │ AI Architect                   │   2414390.0 │
-- │ Cloud Data Architect           │   2390000.0 │
-- │ Director of Data Science       │   2091492.0 │
-- │ Head of Data                   │   2025383.0 │
-- │ Prompt Engineer                │   1960695.0 │
-- ├────────────────────────────────┴─────────────┤
-- │ 10 rows                            2 columns │
-- └──────────────────────────────────────────────┘

-- f) How many percentage of the jobs are fully remote, 50 percent remote and fully not remote.

SELECT 
    round((count(*) FILTER (remote_ratio = 0)/count(*))*100,2) AS not_remote_procent,
    round((count(*) FILTER (remote_ratio = 50)/count(*))*100,2) AS half_remote_procent,
    round((count(*) FILTER (remote_ratio = 100)/count(*))*100,2) AS fully_remote_procent,
FROM
    salary_sek;

-- ┌────────────────────┬─────────────────────┬──────────────────────┐
-- │ not_remote_procent │ half_remote_procent │ fully_remote_procent │
-- │       double       │       double        │        double        │
-- ├────────────────────┼─────────────────────┼──────────────────────┤
-- │       67.24        │        1.51         │        31.25         │
-- └────────────────────┴─────────────────────┴──────────────────────┘

-- g) Pick out a job title of interest and figure out if company size affects the salary. Make a simple analysis as a comprehensive one requires causality investigations which are much harder to find.

-- Smallest pay for a Small-company-sized Data Engineer job

SELECT 
    company_size,
    round(median(salary_annual_sek),0) AS median_salary,
FROM
    salary_sek
WHERE
    job_title = 'Data Engineer'
GROUP BY
    company_size;

-- ┌──────────────┬───────────────┐
-- │ company_size │ median_salary │
-- ├──────────────┼───────────────┤
-- │ Large        │     1150011.0 │
-- │ Small        │      621400.0 │
-- │ Medium       │     1338400.0 │
-- └──────────────┴───────────────┘

-- h) Feel free to explore other things