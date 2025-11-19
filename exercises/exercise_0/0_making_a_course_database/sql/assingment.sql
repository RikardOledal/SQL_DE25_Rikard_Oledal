-- a) Select all the exercises in this course

SELECT
    *
FROM
    lecture_data
WHERE
    content_type = 'exercise';

-- b) Select all the lectures in this course

SELECT
    *
FROM
    lecture_data
WHERE
    content_type = 'lecture';

-- c) Select all records for week 48

SELECT
    *
FROM
    lecture_data
WHERE
    weeks = 48;

-- d) Select all records for week 47-49

SELECT
    *
FROM
    lecture_data
WHERE
    weeks BETWEEN 47 AND 49;

-- e) How many lectures are in the table?

SELECT
    COUNT(*)
FROM
    lecture_data
WHERE
    content_type = 'lecture';

-- 22

-- f) How many other content are there?

SELECT
    COUNT(*)
FROM
    lecture_data
WHERE
    content_type != 'lecture';

-- 7

-- g) Which are the unique content types in this table?

SELECT
    count(DISTINCT content_type) AS Nr_content_type
FROM
    lecture_data;

-- h) Delete the row with content 02_setup_duckdb and add it again.

SELECT
    *
FROM
    lecture_data
WHERE
    content = '02_setup_duckdb';

DELETE FROM lecture_data
WHERE
    content = '02_setup_duckdb';

INSERT INTO
	lecture_data (content, weeks, content_type)
VALUES
	('02_setup_duckdb', 46, 'lecture');

-- i) You see that 02_setup_duckdb comes in the end of your table, even though the week is 46. Now make a query where you sort the weeks in ascending order.

SELECT
    *
FROM
    lecture_data
WHERE
    content_type = 'lecture'
ORDER BY
    weeks ASC;

-- j) Now you can choose what you want to explore in this table.

SELECT
    *
FROM
    lecture_data
WHERE
    content_type = 'lecture'
ORDER BY
    weeks ASC,
    content ASC;

SELECT
    *
FROM
    lecture_data
ORDER BY
    weeks ASC,
    content ASC;