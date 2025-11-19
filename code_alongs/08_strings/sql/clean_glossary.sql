CREATE SCHEMA IF NOT EXISTS refined;

CREATE TABLE IF NOT EXISTS refined.sql_glossary AS (
    SELECT
        upper(trim(sql_word)) AS sql_word,
        trim(regexp_replace (description, ' +', ' ', 'g')) AS description,
        lower(trim(regexp_replace (example, ' +', ' ', 'g'))) AS example
    FROM
        staging.sql_glossary
);