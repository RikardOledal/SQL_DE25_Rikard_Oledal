-- ALTER TABLE data_jobs
-- ADD COLUMN salary_in_sek INTEGER DEFAULT 0;

-- ALTER TABLE data_jobs
-- ADD COLUMN month_salary_in_sek INTEGER DEFAULT 0;

-- ALTER TABLE data_jobs
-- ADD COLUMN salary_level VARCHAR;

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