-- Task 1

-- Task 2
-- Find invalid emails with LIKE operator and wildcard
SELECT
    *
FROM
    staging.old_crm
WHERE
    email NOT LIKE '%@%.%';

-- Find invalid emails with REGEXP function

SELECT
    *
FROM
    staging.new_crm
WHERE
    NOT regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]')
    OR NOT region IN ('EU', 'US')
    OR NOT trim(status) IN ('active', 'inactive');

-- Task 3
-- Task 4