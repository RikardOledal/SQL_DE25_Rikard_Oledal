CREATE TABLE
    IF NOT EXISTS bikedata AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/bike_joined_table.csv')
    );

ALTER TABLE main.bikedata
ADD COLUMN manager_name VARCHAR DEFAULT 'Cathy Larsson';

UPDATE bikedata
SET
    manager_name = 'Amy Andersson'
WHERE
    manager_id = 1;

UPDATE bikedata
SET
    manager_name = 'Bill Berg'
WHERE
    manager_id = 2;

UPDATE bikedata
SET
    manager_name = 'Davis Lam'
WHERE
    manager_id = 7