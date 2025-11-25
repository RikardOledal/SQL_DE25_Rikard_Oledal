SELECT
    sunriseTime,
    typeof (sunriseTime) AS type_sunriseTime,
    sunsetTime,
    typeof (sunsetTime) AS type_sunsetTime,
    temperatureHighTime,
    typeof (temperatureHighTime) AS type_temperatureHighTime,
    temperatureLowTime,
    typeof (temperatureLowTime) AS type_temperatureLowTime,
    windGustTime,
    typeof (windGustTime) AS type_windGustTime,
    precipIntensityMaxTime,
    typeof (precipIntensityMaxTime) AS type_precipIntensityMaxTime
FROM
    staging.weather
LIMIT
    1;