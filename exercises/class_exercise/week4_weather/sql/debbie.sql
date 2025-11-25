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