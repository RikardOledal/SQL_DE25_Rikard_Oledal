DESC staging.sweden_holidays;

-- YYYY-MM-DD
FROM staging.sweden_holidays;

-- addition and subraction

SELECT
    "Holiday Name (Swedish)",
    date,
    typeof(date) AS date_type,
    date + interval 5 day AS plus_5_days,
    typeof(plus_5_days) AS plus_5_days_type,
    date - interval 5 day AS minus_5_days,
    typeof(minus_5_days) AS minus_5_days_type
FROM
    staging.sweden_holidays;

-- DATE functions
-- today
SELECT today()

SELECT
    today() AS today,
    date - today AS time_after_holiday,
    *
FROM
    staging.sweden_holidays;

-- dayname
SELECT
    "Holiday Name (Swedish)",
    date,
    dayname(date) AS weekday
FROM
    staging.sweden_holidays;

-- latest from 2 dates
SELECT
    *,
    today() AS today,
    greatest(date, today) AS later_day
FROM
    staging.sweden_holidays;

-- convert from date to string
SELECT
    date,
    strftime(date, '%d/%m/%Y') AS date_string,
    typeof(date_string)
FROM
    staging.sweden_holidays;

-- convert from string to date
SELECT
    date,
    strftime(date, '%d/%m/%Y') AS date_string,
    typeof(date_string) AS type_of_string,
    strptime(date_string, '%d/%m/%Y')::DATE AS new_date,
    typeof(new_date) AS type_of_new_date,
FROM
    staging.sweden_holidays;



