-- indexing
SELECT
    sql_word,
    sql_word[0],
    sql_word[1],
    sql_word[-1]
FROM
    staging.sql_glossary;

-- slicing
SELECT
    sql_word,
    sql_word[:2],
    sql_word[2:5],
    sql_word[3:-1]
FROM
    staging.sql_glossary;