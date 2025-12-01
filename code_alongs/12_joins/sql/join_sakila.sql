-- LEFT JOIN
-- which actor has played which film_id

SELECT
    a.actor_id,
    a.first_name,
    a.last_name,
    fa.film_id
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
LIMIT
    5;

-- ┌──────────┬────────────┬───────────┬─────────┐
-- │ actor_id │ first_name │ last_name │ film_id │
-- ├──────────┼────────────┼───────────┼─────────┤
-- │      1.0 │ PENELOPE   │ GUINESS   │       1 │
-- │      1.0 │ PENELOPE   │ GUINESS   │      23 │
-- │      1.0 │ PENELOPE   │ GUINESS   │      25 │
-- │      1.0 │ PENELOPE   │ GUINESS   │     106 │
-- │      1.0 │ PENELOPE   │ GUINESS   │     140 │
-- └──────────┴────────────┴───────────┴─────────┘

-- join 3 tables
-- which actor has played which films?
SELECT
    a.first_name,
    a.last_name,
    f.title
FROM
    actor a
    LEFT JOIN film_actor fa ON fa.actor_id = a.actor_id
    LEFT JOIN film f ON f.film_id = fa.film_id
LIMIT
    5;

-- ┌────────────┬───────────┬───────────────────────┐
-- │ first_name │ last_name │         title         │
-- ├────────────┼───────────┼───────────────────────┤
-- │ PENELOPE   │ GUINESS   │ ACADEMY DINOSAUR      │
-- │ PENELOPE   │ GUINESS   │ ANACONDA CONFESSIONS  │
-- │ PENELOPE   │ GUINESS   │ ANGELS LIFE           │
-- │ PENELOPE   │ GUINESS   │ BULWORTH COMMANDMENTS │
-- │ PENELOPE   │ GUINESS   │ CHEAPER CLYDE         │
-- └────────────┴───────────┴───────────────────────┘

-- INNER JOIN
-- get all films with associated category?
SELECT
    f.title,
    c.name AS category
FROM
    film_category fc
    INNER JOIN category c ON fc.category_id = c.category_id
    INNER JOIN film f ON f.film_id = fc.film_id;

-- ┌──────────────────────┬─────────────┐
-- │        title         │  category   │
-- ├──────────────────────┼─────────────┤
-- │ ACADEMY DINOSAUR     │ Documentary │
-- │ ACE GOLDFINGER       │ Horror      │
-- │ ADAPTATION HOLES     │ Documentary │
-- │ AFFAIR PREJUDICE     │ Horror      │
-- │ AFRICAN EGG          │ Family      │
-- │ AGENT TRUMAN         │ Foreign     │
-- │ AIRPLANE SIERRA      │ Comedy      │
-- │ AIRPORT POLLOCK      │ Horror      │
-- │ ALABAMA DEVIL        │ Horror      │
-- │ ALADDIN CALENDAR     │ Sports      │
-- │ ALAMO VIDEOTAPE      │ Foreign     │
-- │ ALASKA PHANTOM       │ Music       │
-- │ ALI FOREVER          │ Horror      │
-- │ ALICE FANTASIA       │ Classics    │
-- │ ALIEN CENTER         │ Foreign     │
-- │ ALLEY EVOLUTION      │ Foreign     │
-- │ ALONE TRIP           │ Music       │
-- │ ALTER VICTORY        │ Animation   │
-- │ AMADEUS HOLY         │ Action      │
-- │ AMELIE HELLFIGHTERS  │ Music       │
-- │       ·              │   ·         │
-- │       ·              │   ·         │
-- │       ·              │   ·         │
-- │ WOLVES DESIRE        │ Travel      │
-- │ WOMEN DORADO         │ Action      │
-- │ WON DARES            │ Music       │
-- │ WONDERFUL DROP       │ Foreign     │
-- │ WONDERLAND CHRISTMAS │ Sci-Fi      │
-- │ WONKA SEA            │ Animation   │
-- │ WORDS HUNTER         │ Music       │
-- │ WORKER TARZAN        │ Travel      │
-- │ WORKING MICROCOSMOS  │ Travel      │
-- │ WORLD LEATHERNECKS   │ Horror      │
-- │ WORST BANGER         │ Action      │
-- │ WRATH MILE           │ Documentary │
-- │ WRONG BEHAVIOR       │ Children    │
-- │ WYOMING STORM        │ New         │
-- │ YENTL IDAHO          │ Horror      │
-- │ YOUNG LANGUAGE       │ Documentary │
-- │ YOUTH KICK           │ Music       │
-- │ ZHIVAGO CORE         │ Horror      │
-- │ ZOOLANDER FICTION    │ Children    │
-- │ ZORRO ARK            │ Comedy      │
-- ├──────────────────────┴─────────────┤
-- │ 1000 rows (40 shown)     2 columns │
-- └────────────────────────────────────┘

-- CROSS JOIN
SELECT
    count(*)
FROM
    film;

-- ┌──────────────┐
-- │ count_star() │
-- ├──────────────┤
-- │     1000     │
-- └──────────────┘

SELECT
    count(*)
FROM
    category;

-- ┌──────────────┐
-- │ count_star() │
-- ├──────────────┤
-- │      16      │
-- └──────────────┘

SELECT
    count(*)
FROM
    film f
    INNER JOIN category c ON category_id;

-- ┌──────────────┐
-- │ count_star() │
-- ├──────────────┤
-- │    16000     │
-- └──────────────┘

SELECT
    f.title,
    c.name AS category
FROM
    film f
    INNER JOIN category c ON category_id;
    
-- in which address, city and country deos the staff live in
FROM staff LIMIT 5;


-- ┌──────────┬────────────┬───────────┬────────────┬───┬────────┬──────────┬──────────────────────┬─────────────────────┐
-- │ staff_id │ first_name │ last_name │ address_id │ . │ active │ username │       password       │     last_update     │
-- ├──────────┼────────────┼───────────┼────────────┼───┼────────┼──────────┼──────────────────────┼─────────────────────┤  
-- │        1 │ Mike       │ Hillyer   │          3 │ . │      1 │ Mike     │ 8cb2237d0679ca88db.  │ 2021-03-06 15:52:00 │  
-- │        2 │ Jon        │ Stephens  │          4 │ . │      1 │ Jon      │ 8cb2237d0679ca88db.  │ 2021-03-06 15:52:00 │  
-- ├──────────┴────────────┴───────────┴────────────┴───┴────────┴──────────┴──────────────────────┴─────────────────────┤
-- │ 2 rows                                                                                         11 columns (8 shown) │  
-- └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘  

FROM address LIMIT 5;

-- ┌────────────┬──────────────────────┬──────────┬──────────┬─────────┬─────────────┬─────────┬─────────────────────┐
-- │ address_id │       address        │ address2 │ district │ city_id │ postal_code │  phone  │     last_update     │
-- │   int64    │       varchar        │ varchar  │ varchar  │  int64  │   varchar   │ varchar │      timestamp      │
-- ├────────────┼──────────────────────┼──────────┼──────────┼─────────┼─────────────┼─────────┼─────────────────────┤
-- │          1 │ 47 MySakila Drive    │ NULL     │          │     300 │ NULL        │         │ 2021-03-06 15:51:54 │
-- │          2 │ 28 MySQL Boulevard   │ NULL     │          │     576 │ NULL        │         │ 2021-03-06 15:51:54 │
-- │          3 │ 23 Workhaven Lane    │ NULL     │          │     300 │ NULL        │         │ 2021-03-06 15:51:54 │
-- │          4 │ 1411 Lillydale Drive │ NULL     │          │     576 │ NULL        │         │ 2021-03-06 15:51:54 │
-- │          5 │ 1913 Hanoi Way       │ NULL     │          │     463 │ 35200       │         │ 2021-03-06 15:51:54 │
-- └────────────┴──────────────────────┴──────────┴──────────┴─────────┴─────────────┴─────────┴─────────────────────┘

FROM city LIMIT 5;

-- ┌─────────┬────────────────────┬────────────┬─────────────────────┐
-- │ city_id │        city        │ country_id │     last_update     │
-- │  int64  │      varchar       │   int64    │      timestamp      │
-- ├─────────┼────────────────────┼────────────┼─────────────────────┤
-- │       1 │ A Corua (La Corua) │         87 │ 2021-03-06 15:51:49 │
-- │       2 │ Abha               │         82 │ 2021-03-06 15:51:49 │
-- │       3 │ Abu Dhabi          │        101 │ 2021-03-06 15:51:49 │
-- │       4 │ Acua               │         60 │ 2021-03-06 15:51:49 │
-- │       5 │ Adana              │         97 │ 2021-03-06 15:51:49 │
-- └─────────┴────────────────────┴────────────┴─────────────────────┘

FROM country LIMIT 5;

-- ┌────────────┬────────────────┬─────────────────────┐
-- │ country_id │    country     │     last_update     │
-- │   int64    │    varchar     │      timestamp      │
-- ├────────────┼────────────────┼─────────────────────┤
-- │          1 │ Afghanistan    │ 2021-03-06 15:51:49 │
-- │          2 │ Algeria        │ 2021-03-06 15:51:49 │
-- │          3 │ American Samoa │ 2021-03-06 15:51:49 │
-- │          4 │ Angola         │ 2021-03-06 15:51:49 │
-- │          5 │ Anguilla       │ 2021-03-06 15:51:49 │
-- └────────────┴────────────────┴─────────────────────┘


-- staff has address_id
-- address has address_id
-- address has city_id
-- city has city_id
-- city has country_id
-- country has country_id

-- in which address, city and country deos the staff live in

SELECT
  s.staff_id,
  s.first_name,
  s.last_name,
  a.address,
  c.city,
  co.country
FROM staff s
LEFT JOIN address a ON s.address_id = a.address_id
LEFT JOIN city c ON a.city_id = c.city_id
LEFT JOIN country co ON c.country_id = co.country_id;

-- ┌──────────┬────────────┬───────────┬──────────────────────┬────────────┬───────────┐
-- │ staff_id │ first_name │ last_name │       address        │    city    │  country  │
-- ├──────────┼────────────┼───────────┼──────────────────────┼────────────┼───────────┤
-- │        1 │ Mike       │ Hillyer   │ 23 Workhaven Lane    │ Lethbridge │ Canada    │
-- │        2 │ Jon        │ Stephens  │ 1411 Lillydale Drive │ Woodridge  │ Australia │
-- └──────────┴────────────┴───────────┴──────────────────────┴────────────┴───────────┘
