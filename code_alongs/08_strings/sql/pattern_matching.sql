-- LIKE operator in WHERE clause -> filter rows
-- LIKE operator with wildcards to search for pattern

SELECT
    example,
    lower(trim(example)) AS cleaned_example
FROM
    staging.sql_glossary;

-- search for select (use ILIKE for Insensitiv to search not Case sensitive)
SELECT
    example,
    lower(trim(example)) AS cleaned_example
FROM
    staging.sql_glossary
WHERE
    cleaned_example LIKE 'select%'; -- wildcard % matches 0 or more chars

-- wildcard _ represents one character
SELECT
    example,
    lower(trim(example)) AS cleaned_example
FROM
    staging.sql_glossary
WHERE
    cleaned_example LIKE 'S_LECT%';

-- regular expression (RegEX) filter on all that starts with c 
SELECT
    lower(trim(description)) AS cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches(cleaned_description, '^c')

-- filter on all that starts with C or S
SELECT
    trim(description) AS cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches(cleaned_description, '^[CS]')

-- \b makes it match exactly select word (don't match selects or selected)
SELECT
    lower(description) AS cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches(cleaned_description, 'select\b')

-- [a-f] matches range of characters
-- ^[a-f] matches starting with characters a to f
SELECT
    lower(trim(description)) AS cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches(cleaned_description, '^[a-f]')

-- [^a-f] matches range of characters NOT a to f
-- ^[^a-f] matches starting with characters NOT a to f
SELECT
    lower(trim(description)) AS cleaned_description
FROM
    staging.sql_glossary
WHERE
    regexp_matches(cleaned_description, '^[a-f]')

SELECT
    description,
    trim(regexp_replace(description, ' +', ' ', 'g') )AS cleaned_description
FROM
    staging.sql_glossary;