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

UPDATE data_jobs
SET
    salary_in_sek = round(salary_in_usd*9.56);

UPDATE data_jobs
SET
    month_salary_in_sek = round(salary_in_sek/12);

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

UPDATE data_jobs
SET
    salary_level = 'INSANELY HIGH'
WHERE
    month_salary_in_sek >= 200000;

UPDATE data_jobs
SET
    experience_level = CASE
        WHEN experience_level = 'EN' THEN 'Entry level'
        WHEN experience_level = 'MI' THEN 'Mid level'
        WHEN experience_level = 'SE' THEN 'Senior level'
        WHEN experience_level = 'EX' THEN 'Expert level'
    END;