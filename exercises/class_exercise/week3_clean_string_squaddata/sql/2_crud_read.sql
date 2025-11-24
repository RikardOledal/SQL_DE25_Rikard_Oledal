SELECT
    *
FROM
    staging.squad
WHERE
    instr (context, title) = 0;