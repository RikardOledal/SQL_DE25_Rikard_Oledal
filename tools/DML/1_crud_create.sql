-- Insert data manualy
INSERT INTO
    schema_name.table_name (colum_name1, colum_name2)
VALUES
    ('Sales', 2001),
    ('Logistics', 2002),
    ('IT', 2002);

-- Insert via CSV
INSERT INTO
    schema_name.table_name (colum_name1, colum_name2)
SELECT
    *
FROM
    read_csv ('folder_name/file_name.csv');