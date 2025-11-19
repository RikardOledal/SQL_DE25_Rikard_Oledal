-- Read all from a Table
SELECT
    *
FROM
    schema_name.table_name;

-- Read specific columns from a Table
SELECT
    id
    file_name
FROM
    schema_name.table_name;

-- Read filted info from Table
SELECT
    *
FROM
    schema_name.table_name
WHERE
    employment_year < 2016;

-- Read filted info from Table where you Sort the result ASC or DESC
SELECT
    *
FROM
    schema_name.table_name
WHERE
    employment_year < 2016
ORDER BY
    file_name ASC;

-- Read info from a CSV-file
SELECT
    *
FROM
    read_csv ('folder_name/file_name.csv');