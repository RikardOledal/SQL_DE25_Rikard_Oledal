desc staging.old_crm;

desc staging.new_crm;

SELECT
    'Old_CRM' AS type_crm,
    CASE
        WHEN instr(email[instr(email,'@'):],'.') < 1 THEN 'Email'
        WHEN region != 'EU' AND region !='US' THEN 'Wrong Region'
        WHEN trim(status) != 'active' AND trim(status) != 'inactive' THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.old_crm
WHERE validation_error is NOT NULL
UNION
SELECT
    'New_CRM' AS type_crm,
    CASE
        WHEN instr(email[instr(email,'@'):],'.') < 1 THEN 'Email'
        WHEN region != 'EU' AND region !='US' THEN 'Wrong Region'
        WHEN trim(status) != 'active' AND trim(status) != 'inactive' THEN 'Wrong status'
    END AS validation_error,
    *
FROM staging.new_crm
WHERE validation_error is NOT NULL;