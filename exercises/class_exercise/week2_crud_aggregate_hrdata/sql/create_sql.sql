CREATE SCHEMA IF NOT EXISTS staging;

CREATE SEQUENCE IF NOT EXISTS id_employee_sequence START 1;

CREATE TABLE
    IF NOT EXISTS staging.employees (
        employee_id INTEGER PRIMARY KEY DEFAULT nextval ('id_employee_sequence'),
        department STRING,
        employment_year INTEGER
    );

CREATE TABLE
    IF NOT EXISTS staging.all_employees AS (
        SELECT
            *
        FROM read_csv_auto('data/more_employees.csv')
    );