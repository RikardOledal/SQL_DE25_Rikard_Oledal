-- ## Task 1
-- You are asked to create a database with:
-- - a schema called *staging*
-- - a table under the schema, called *weather*

-- Use the file *daily_weather_2020.csv* from [kaggle](https://www.kaggle.com/datasets/vishalvjoseph/weather-dataset-for-covid19-predictions) to ingest rows into table. Use `read_csv_auto()` function to automatically detect column data types.

CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.weather AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/daily_weather_2020.csv')
    )

-- ## Task 2
-- What are the data types of the following columns:
-- - sunriseTime
-- - sunsetTime
-- - temperatureHighTime
-- - temperatureLowTime
-- - windGustTime
-- - precipIntensityMaxTime

DESC
SELECT
    sunriseTime,
    sunsetTime,
    temperatureHighTime,
    temperatureLowTime,
    windGustTime,
    precipIntensityMaxTime,
FROM
    staging.weather;

┌──────────────┬──────────────────┬──────────────┬─────────────────┬───┬──────────────┬───────────────────┬──────────────────────┬──────────────────────┐
│ sunriseTime  │ type_sunriseTime │  sunsetTime  │ type_sunsetTime │ . │ windGustTime │ type_windGustTime │ precipIntensityMax.  │ type_precipIntensi.  │
│    double    │     varchar      │    double    │     varchar     │   │    int64     │      varchar      │        double        │       varchar        │
├──────────────┼──────────────────┼──────────────┼─────────────────┼───┼──────────────┼───────────────────┼──────────────────────┼──────────────────────┤
│ 1577846640.0 │ DOUBLE           │ 1577882700.0 │ DOUBLE          │ . │  1577891880  │ BIGINT            │     1577902320.0     │ DOUBLE               │
├──────────────┴──────────────────┴──────────────┴─────────────────┴───┴──────────────┴───────────────────┴──────────────────────┴──────────────────────┤
│ 1 rows                                                                                                                           12 columns (8 shown) │
└───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
-- Understand the meaning of each data type in the DuckDBs documentation [here](https://duckdb.org/docs/stable/sql/data_types/overview).

-- Columns above are represented as UNIX time, what do their values mean?

-- >[!Note]
-- >For the purpose of this exercise, ignore the time column in this dateset.

-- ## Task 3
-- Show the number of records/rows for each combination of Country/Region and Province/State. How many records are there for each combination?

SELECT
  "Country/Region",
  "Province/State",
  count("Country/Region") AS count_country,
  count("Province/State") AS count_province
FROM
  staging.weather
GROUP BY
  "Country/Region",
  "Province/State"
ORDER BY
  count_country ASC;

-- 112 rows per Combination

-- In the following tasks, analyze only records in Sweden.

-- ## Task 4
-- Show the columns below as TIMESTAMP (WITH TIME ZONE) data type and with the timezone in Sweden:
-- - sunriseTime
-- - sunsetTime

SELECT
  sunriseTime,
  to_timestamp(sunriseTime) AS sunriseTime_date,
  sunsetTime,
  to_timestamp(sunsetTime) AS sunsetTime_date,
FROM
  staging.weather
WHERE
  "Country/Region" ='Sweden';

## Task 5
For each year-month, show the largest gap between sunrise and sunset hours. In your result, show these columns:
- year
- month
- the time with time zone of sunrise when the gap is largest in that month
- the time with time zone of sunset when the gap is largest in that month
- the gap in hours

## Task 6
Show a new column which prints a text of warning, 'It's dangerous to use the crane at kl. ...', where ... is the hour of windGustTime during the day. For instance, the result of one row can be: 'It's dangerous to use the crane at kl. 16'

