FROM
    food;

SELECT DISTINCT
    id
FROM
    food;

SELECT
    COUNT(DISTINCT id)
FROM
    food;
-- 201 distinct foods

SELECT
    COUNT(*) AS number_rows
FROM
    food;
-- 135025 rows in Table

desc food;

/*  ===================
    id          VARCHAR
    googleTopic VARCHAR
    week_id     VARCHAR
    value       BIGINT
    =================== */

SELECT
    *
FROM
    food
WHERE
    week_id BETWEEN '2004-04' AND '2004-06';
