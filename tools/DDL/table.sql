-- Create Table manualy
CREATE TABLE
    IF NOT EXISTS funny_jokes (
        id INTEGER PRIMARY KEY,
        joke_text VARCHAR,
        rating INTEGER
    );

-- Create Table from CSV
CREATE TABLE
    IF NOT EXISTS videos AS (
        SELECT
            *
        FROM
            read_csv_auto ('folder_name/file_name.csv')
    )