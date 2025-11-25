-- Task 2

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

-- Task 3

SELECT
  "Country/Region" AS Country,
  "Province/State" AS State,
  count(*) AS nr_records
FROM
  staging.weather
GROUP BY
  Country,
  State
ORDER BY
  Country,
  State;

-- Task 4

SELECT 
  date_part('year', to_timestamp(sunriseTime)) AS year,
  date_part('month', to_timestamp(sunriseTime)) AS month,
  to_timestamp(MAX(sunriseTime)),
  to_timestamp(MAX(sunsetTime)),
  round(max(sunsetTime - sunriseTime)/3600) AS sunlight_time
FROM
  staging.weather
WHERE
  "Country/Region" = 'Sweden'
GROUP BY
  year,
  month
ORDER BY
  month;

-- Task 5

SELECT
  *
FROM
  staging.weather
WHERE
  "Country/Region" = 'Sweden';

-- Task 6

SELECT
  to_timestamp(windGustTime) AT TIME ZONE 'Europe/Stockholm' AS most_windy_timestamp,
  date_part('hour', to_timestamp(windGustTime)) AS most_windy_hour,
  CONCAT('Its dangerous to use the crane at kl.',most_windy_hour)
FROM
  staging.weather
WHERE
  "Country/Region" = 'Sweden';