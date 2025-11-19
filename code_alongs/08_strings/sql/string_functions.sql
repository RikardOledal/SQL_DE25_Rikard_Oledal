SELECT
    sql_word
FROM
    staging.sql_glossary;

-- remove leading and trailing spaces
SELECT
    sql_word,
    trim(sql_word, ' ') as trimmed_word,
FROM
    staging.sql_glossary;

-- get first and last letter
SELECT
    sql_word,
    trim(sql_word, ' ') as trimmed_word,
    trimmed_word[1] as first_character,
    trimmed_word[-1] as last_character
FROM
    staging.sql_glossary;

-- transform character to upper case
SELECT
    sql_word,
    upper(trim(sql_word, ' ')) as trimmed_word,
    trimmed_word[1] as first_character,
    trimmed_word[-1] as last_character
FROM
    staging.sql_glossary;

-- replace 2 spaces with 1 space
SELECT
    description,
    replace(description, '  ', ' ') AS cleaned_description
FROM
    staging.sql_glossary;

-- concatenate strings
SELECT
    sql_word,
    concat(upper(trim(sql_word, ' ')), ' command') as trimmed_word
FROM
    staging.sql_glossary;
-- alt
SELECT
    sql_word,
    upper(trim(sql_word, ' ')) || ' command' as trimmed_word
FROM
    staging.sql_glossary;

-- extract substring
SELECT
    sql_word,
    trim(sql_word) AS trimmed_word,
    substring(trim(sql_word),1,5) AS first_five_character,
    trimmed_word[1:5] AS sliced_five_chars
FROM
    staging.sql_glossary;

-- reverse word
SELECT
    sql_word,
    trim(sql_word) AS trimmed_word,
    reverse(trimmed_word) AS reversed_word
FROM
    staging.sql_glossary;

-- find position of first occurance of a substring
-- return 0 if substring is not found
SELECT
    description,
    instr(description, 'select') AS select_position,
    select_position != 0 AS about_select
FROM
    staging.sql_glossary;

SELECT 'fun' || 'joke' AS concatenated_string;