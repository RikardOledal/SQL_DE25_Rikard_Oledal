FROM actor;
FROM film;
FROM address;
FROM category;
FROM city;
FROM country;
FROM customer;
FROM film_actor;

SELECT
    count(*) AS number_movies,
    count(DISTINCT title) AS unique_nr_of titles
FROM
    film;

SELECT DISTINCT rating FROM main.film;

SELECT
    'custumer' AS TYPE,
    c.first_name,
    c.last_name
FROM
    customer c
WHERE
    c.first_name LIKE 'D%';