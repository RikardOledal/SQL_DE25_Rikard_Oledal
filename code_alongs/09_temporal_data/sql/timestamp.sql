desc staging.train_schedules;

FROM
    staging.train_schedules;

-- time difference - age
SELECT
    scheduled_arrival,
    actual_arrival,
    delay_minutes,
    age (actual_arrival, scheduled_arrival) AS delay_interval,
    typeof (delay_interval)
FROM
    staging.train_schedules;

-- Current time
SELECT
    current_localtimestamp ();

-- date_trunc removes what nu did´nt pick
-- if you trunc over hour 07:57:12 will be 07:00:00 
SELECT
    scheduled_arrival,
    date_trunc ('hour', scheduled_arrival) AS scheduled_arrival_trunc
FROM
    staging.train_schedules;

SELECT
    current_localtimestamp () AS current_time,
    date_trunc ('minute', current_time) AS min;

SELECT
    current_localtimestamp () AS current_time,
    date_trunc ('second', current_time) AS sec;

-- extract subfield of timestamp
-- show arrival hour in text

SELECT
    scheduled_arrival,
    'kl. ' || extract('hour' FROM scheduled_arrival) AS scheduled_arrival_hour
FROM
    staging.train_schedules;



