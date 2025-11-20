SELECT
    *
FROM
    hemnetDATA;

SELECT
    count(*) AS rows
FROM
    hemnetDATA;

desc hemnetDATA;

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

SELECT
    min(final_price) AS min_price,
    round(avg(final_price),0) AS mean_price,
    round(median(final_price),0) AS median_price,
    max(final_price) AS max_price
FROM
    hemnetDATA;

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

SELECT 
    count(distinct commune) AS nr_commune
FROM
    hemnetDATA;

SELECT
    COUNT(*) AS total_sales,
    COUNT(*) FILTER (final_price > 10000000) AS ten_milj_sales,
    ROUND(((ten_milj_sales/total_sales)*100),2) AS procent
FROM
    hemnetDATA;