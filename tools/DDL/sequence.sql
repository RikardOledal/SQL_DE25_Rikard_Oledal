-- Use to get att series of numbers for id
CREATE SEQUENCE IF NOT EXISTS id_sql_sequence START 1;

-- To use sequences when you create a Table
CREATE TABLE
    IF NOT EXISTS schema_name.table_name (
        id INTEGER DEFAULT nextval ('sequence_name'),
        file_name VARCHAR
    );