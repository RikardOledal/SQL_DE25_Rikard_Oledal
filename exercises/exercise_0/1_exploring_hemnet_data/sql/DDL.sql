CREATE TABLE
    IF NOT EXISTS hemnetDATA AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/hemnet_data_clean.csv')
    )