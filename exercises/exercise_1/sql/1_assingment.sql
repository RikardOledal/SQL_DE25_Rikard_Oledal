-- a) Transform employment type column based on this table

UPDATE data_jobs
SET
    employment_type = 'Contract'
WHERE
    employment_type ='CT';

UPDATE data_jobs
SET
    employment_type = 'Freelance'
WHERE
    employment_type ='FL';

UPDATE data_jobs
SET
    employment_type = 'Part time'
WHERE
    employment_type ='PT';

UPDATE data_jobs
SET
    employment_type = 'Full time'
WHERE
    employment_type ='FT';

-- b) Do similar for company size, but you have to figure out what the abbreviations could stand for.

UPDATE data_jobs
SET
    company_size = 'Large'
WHERE
    company_size ='L';

UPDATE data_jobs
SET
    company_size = 'Medium'
WHERE
    company_size ='M';
UPDATE data_jobs
SET
    company_size = 'Small'
WHERE
    company_size ='S';

-- c) Make a salary column with Swedish currency for yearly salary. (rate 9,56/usd)

ALTER TABLE data_jobs
ADD COLUMN salary_in_sek INTEGER DEFAULT 0;

UPDATE data_jobs
SET
    salary_in_sek = round(salary_in_usd*9.56);

-- d) Make a salary column with Swedish currency for monthly salary.

ALTER TABLE data_jobs
ADD COLUMN month_salary_in_sek INTEGER DEFAULT 0;

UPDATE data_jobs
SET
    month_salary_in_sek = round(salary_in_sek/12);

-- e) Make a salary_level column with the following categories: low, medium, high, insanely_high. Decide your thresholds for each category. Make it base on the monthly salary in SEK.

-- low 80k < 
-- medium 80k > 150k 
-- high 150k > 200k
-- insanely_high 200k >

ALTER TABLE data_jobs
ADD COLUMN salary_level VARCHAR;

UPDATE data_jobs
SET
    salary_level = 'LOW'
WHERE
    month_salary_in_sek < 80000;

UPDATE data_jobs
SET
    salary_level = 'MEDIUM'
WHERE
    month_salary_in_sek >= 80000 AND month_salary_in_sek < 150000;

UPDATE data_jobs
SET
    salary_level = 'HIGH'
WHERE
    month_salary_in_sek >= 150000 AND month_salary_in_sek < 200000;

UPDATE data_jobs
SET
    salary_level = 'INSANELY HIGH'
WHERE
    month_salary_in_sek >= 200000;


-- f) Choose the following columns to include in your table: experience_level, employment_type, job_title, salary_annual_sek, salary_monthly_sek, remote_ratio, company_size, salary_level

CREATE TABLE
    IF NOT EXISTS salary_sek AS (
        SELECT
            experience_level,
            employment_type,
            job_title,
            salary_in_sek AS salary_annual_sek,
            month_salary_in_sek AS salary_monthly_sek,
            remote_ratio,
            company_size,
            salary_level
        FROM
            data_jobs
    )

-- g) Think of other transformation that you want to do.