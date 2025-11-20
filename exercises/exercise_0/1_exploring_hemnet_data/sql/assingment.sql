-- a) Create a database file called hemnet.duckdb and ingest the data from the csv file into your database.

CREATE TABLE
    IF NOT EXISTS hemnetDATA AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/hemnet_data_clean.csv')
    )

-- b) Make a wildcard selection to checkout the data (use the asterisk symbol)

SELECT
    *
FROM
    hemnetDATA;

-- c) Find out how many rows there are in the table
-- Anwser: 500

SELECT
    count(*) AS rows
FROM
    hemnetDATA;

-- d) Describe the table that you have ingested to see the columns and data types.

-- COLUMNS NAME             DATA TYPE
-- column00                 DOUBLE 
-- address                  VARCHAR
-- asked_price              DOUBLE 
-- coordinate               VARCHAR
-- final_price              BIGINT 
-- pourcentage_difference   DOUBLE 
-- land_area                DOUBLE 
-- area                     DOUBLE 
-- commune                  VARCHAR
-- price_per_area           DOUBLE 
-- rooms                    DOUBLE 
-- sale_date                VARCHAR
-- supplemental_area        DOUBLE 

desc hemnetDATA;

-- e) Find out the 5 most expensive homes sold.

-- ┌─────────────┬────────────────────────┬────────┬────────┬────────────────┬─────────────────┐
-- │ final_price │        address         │  area  │ rooms  │ price_per_area │    sale_date    │
-- ├─────────────┼────────────────────────┼────────┼────────┼────────────────┼─────────────────┤
-- │    31100000 │ Sångmöstigen 3         │  240.0 │    9.0 │       129583.0 │ Såld 2022-03-27 │
-- │    28300000 │ Vikavägen 15           │  239.0 │    8.0 │       118410.0 │ Såld 2022-04-17 │
-- │    26000000 │ Gustaf Lundbergs väg 7 │  197.0 │   11.0 │       131980.0 │ Såld 2022-05-10 │
-- │    26000000 │ Bardabacken 17         │  229.0 │   NULL │       113537.0 │ Såld 2022-04-09 │
-- │    25000000 │ Ferievägen 65          │  375.0 │   11.0 │        66667.0 │ Såld 2022-05-19 │
-- └─────────────┴────────────────────────┴────────┴────────┴────────────────┴─────────────────┘

SELECT
    final_price,
    address,
    area,
    rooms,
    price_per_area,
    sale_date
FROM
    hemnetDATA
ORDER BY
    final_price DESC
LIMIT
    5;

-- f) Find out the 5 cheapest homes sold.

-- ┌─────────────┬─────────────────────┬────────┬────────┬────────────────┬─────────────────┐
-- │ final_price │       address       │  area  │ rooms  │ price_per_area │    sale_date    │
-- ├─────────────┼─────────────────────┼────────┼────────┼────────────────┼─────────────────┤
-- │     1490000 │ Småbrukarvägen 46C  │   21.0 │    2.0 │        70952.0 │ Såld 2022-03-10 │
-- │     3500000 │ Rymdvägen 13        │   92.0 │    4.0 │        38043.0 │ Såld 2022-05-11 │
-- │     4200000 │ Själlandsgatan 85   │   76.0 │    3.0 │        55263.0 │ Såld 2022-03-09 │
-- │     4700000 │ Lammholmsbacken 66  │  112.0 │    5.0 │        41964.0 │ Såld 2022-05-27 │
-- │     4800000 │ Lammholmsbacken 115 │  113.0 │    5.0 │        42478.0 │ Såld 2022-05-18 │
-- └─────────────┴─────────────────────┴────────┴────────┴────────────────┴─────────────────┘

SELECT
    final_price,
    address,
    area,
    rooms,
    price_per_area,
    sale_date
FROM
    hemnetDATA
ORDER BY
    final_price ASC
LIMIT
    5;


-- g) Find out statistics on minimum, mean, median and maximum prices of homes sold.

-- ┌────────────────┬─────────────────┬────────────────┬─────────────────┐
-- │   min_price    │   mean_price    │  median_price  │    max_price    │
-- │     int64      │     double      │     double     │      int64      │
-- ├────────────────┼─────────────────┼────────────────┼─────────────────┤
-- │    1490000     │   10047154.0    │   8852500.0    │    31100000     │
-- │ (1.49 million) │ (10.05 million) │ (8.85 million) │ (31.10 million) │
-- └────────────────┴─────────────────┴────────────────┴─────────────────┘

SELECT
    min(final_price) AS min_price,
    round(avg(final_price),0) AS mean_price,
    round(median(final_price),0) AS median_price,
    max(final_price) AS max_price
FROM
    hemnetDATA;

-- h) Find out statistics on minimum, mean, median and maximum prices of price per area.

-- ┌────────┬───────────┬────────────┬──────────────┬───────────┐
-- │  area  │ min_price │ mean_price │ median_price │ max_price │
-- │ double │   int64   │   double   │    double    │   int64   │
-- ├────────┼───────────┼────────────┼──────────────┼───────────┤
-- │   21.0 │   1490000 │  1490000.0 │    1490000.0 │   1490000 │
-- │   48.0 │   6650000 │  7825000.0 │    7825000.0 │   9000000 │
-- │   53.0 │   9800000 │  9800000.0 │    9800000.0 │   9800000 │
-- │   63.0 │   4830000 │  7110000.0 │    8250000.0 │   8250000 │
-- │   64.0 │   6200000 │  6200000.0 │    6200000.0 │   6200000 │
-- │   65.0 │   7000000 │  8200000.0 │    8600000.0 │   8870000 │
-- │   66.0 │   6800000 │  8988333.0 │    9365000.0 │  10500000 │
-- │   67.0 │   7250000 │  7612500.0 │    7475000.0 │   8250000 │
-- │   68.0 │   6600000 │  7332727.0 │    7060000.0 │   8375000 │
-- │   69.0 │   6600000 │  7318750.0 │    7337500.0 │   8000000 │
-- │   70.0 │   7100000 │  7925000.0 │    7850000.0 │   8900000 │
-- │   71.0 │   6500000 │  8200000.0 │    8700000.0 │   9400000 │
-- │   72.0 │   7400000 │  8416667.0 │    7850000.0 │  10000000 │
-- │   74.0 │   7595000 │  8798333.0 │    9300000.0 │   9500000 │
-- │   75.0 │   9700000 │  9700000.0 │    9700000.0 │   9700000 │
-- │   76.0 │   4200000 │  8050000.0 │    8050000.0 │  11900000 │
-- │   77.0 │   7200000 │  7200000.0 │    7200000.0 │   7200000 │
-- │   78.0 │   8400000 │  8400000.0 │    8400000.0 │   8400000 │
-- │   79.0 │   7000000 │  9492500.0 │    8850000.0 │  13270000 │
-- │   80.0 │   7450000 │  8216667.0 │    8600000.0 │   8600000 │
-- │     ·  │      ·    │      ·     │        ·     │      ·    │
-- │     ·  │      ·    │      ·     │        ·     │      ·    │
-- │     ·  │      ·    │      ·     │        ·     │      ·    │
-- │  232.0 │  11850000 │ 11850000.0 │   11850000.0 │  11850000 │
-- │  235.0 │   9700000 │  9700000.0 │    9700000.0 │   9700000 │
-- │  236.0 │  17800000 │ 17800000.0 │   17800000.0 │  17800000 │
-- │  239.0 │  28300000 │ 28300000.0 │   28300000.0 │  28300000 │
-- │  240.0 │  31100000 │ 31100000.0 │   31100000.0 │  31100000 │
-- │  246.0 │  19500000 │ 19500000.0 │   19500000.0 │  19500000 │
-- │  248.0 │  11100000 │ 11100000.0 │   11100000.0 │  11100000 │
-- │  250.0 │  10200000 │ 10200000.0 │   10200000.0 │  10200000 │
-- │  256.0 │  10300000 │ 10300000.0 │   10300000.0 │  10300000 │
-- │  265.0 │  20000000 │ 20000000.0 │   20000000.0 │  20000000 │
-- │  266.0 │  14800000 │ 18400000.0 │   18400000.0 │  22000000 │
-- │  276.0 │  12975000 │ 12975000.0 │   12975000.0 │  12975000 │
-- │  281.0 │  25000000 │ 25000000.0 │   25000000.0 │  25000000 │
-- │  293.0 │   7450000 │  7450000.0 │    7450000.0 │   7450000 │
-- │  304.0 │  22250000 │ 22250000.0 │   22250000.0 │  22250000 │
-- │  375.0 │  25000000 │ 25000000.0 │   25000000.0 │  25000000 │
-- │  713.0 │  14700000 │ 14700000.0 │   14700000.0 │  14700000 │
-- │ 1766.0 │  21200000 │ 21200000.0 │   21200000.0 │  21200000 │
-- │ 1795.0 │  11800000 │ 11800000.0 │   11800000.0 │  11800000 │
-- │   NULL │   4900000 │  4900000.0 │    4900000.0 │   4900000 │
-- ├────────┴───────────┴────────────┴──────────────┴───────────┤
-- │ 161 rows (40 shown)                              5 columns │
-- └────────────────────────────────────────────────────────────┘

SELECT
    area,
    min(final_price) AS min_price,
    round(avg(final_price),0) AS mean_price,
    round(median(final_price),0) AS median_price,
    max(final_price) AS max_price
FROM
    hemnetDATA
GROUP BY
    area
ORDER BY
    area;

-- i) How many unique communes are represented in the dataset.

-- ┌────────────┐
-- │ nr_commune │
-- ├────────────┤
-- │    178     │
-- └────────────┘

SELECT 
    count(distinct commune) AS nr_commune
FROM
    hemnetDATA;

-- j) How many percentage of homes cost more than 10 million?
-- 
-- ┌─────────────┬────────────────┬─────────┐
-- │ total_sales │ ten_milj_sales │ procent │
-- ├─────────────┼────────────────┼─────────┤
-- │     500     │      173       │  34.6   │
-- └─────────────┴────────────────┴─────────┘

SELECT
    COUNT(*) AS total_sales,
    COUNT(*) FILTER (final_price > 10000000) AS ten_milj_sales,
    ROUND(((ten_milj_sales/total_sales)*100),2) AS procent
FROM
    hemnetDATA;

-- k) Feel free to explore anything else you find interesting in this dataset.