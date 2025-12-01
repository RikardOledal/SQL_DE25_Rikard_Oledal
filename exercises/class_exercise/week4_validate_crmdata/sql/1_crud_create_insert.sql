INSERT INTO
    constrained.new_crm
SELECT
    *
FROM
    staging.new_crm
WHERE
    regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')
    AND region IN ('EU', 'US')
    AND status IN ('active', 'inactive');

INSERT INTO
    constrained.old_crm
SELECT
    *
FROM
    staging.old_crm
WHERE
    regexp_matches (email, '[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]+')
    AND region IN ('EU', 'US')
    AND status IN ('active', 'inactive');