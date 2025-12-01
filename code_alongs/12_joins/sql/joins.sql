-- LEFT JOIN

SELECT
    *
FROM
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;

-- ┌──────────┬────────────┬───────────┬───────┬──────────┬────────────────┬─────────────┐
-- │ plant_id │ plant_name │   type    │  id   │ plant_id │ water_schedule │  sunlight   │
-- ├──────────┼────────────┼───────────┼───────┼──────────┼────────────────┼─────────────┤
-- │        1 │ Rose       │ Flower    │     1 │        1 │ Daily          │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │     2 │        3 │ Weekly         │ Partial Sun │
-- │        4 │ Cactus     │ Succulent │     3 │        4 │ Biweekly       │ Full Sun    │
-- │        2 │ Oak        │ Tree      │  NULL │     NULL │ NULL           │ NULL        │
-- │        5 │ Sunflower  │ Flower    │  NULL │     NULL │ NULL           │ NULL        │
-- └──────────┴────────────┴───────────┴───────┴──────────┴────────────────┴─────────────┘

SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    LEFT JOIN plant_care pc ON p.plant_id = pc.plant_id;

-- ┌──────────┬────────────┬───────────┬────────────────┬─────────────┐
-- │ plant_id │ plant_name │   type    │ water_schedule │  sunlight   │
-- ├──────────┼────────────┼───────────┼────────────────┼─────────────┤
-- │        1 │ Rose       │ Flower    │ Daily          │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │ Weekly         │ Partial Sun │
-- │        4 │ Cactus     │ Succulent │ Biweekly       │ Full Sun    │
-- │        2 │ Oak        │ Tree      │ NULL           │ NULL        │
-- │        5 │ Sunflower  │ Flower    │ NULL           │ NULL        │
-- └──────────┴────────────┴───────────┴────────────────┴─────────────┘

-- RIGHT JOIN

SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    RIGHT JOIN plant_care pc ON p.plant_id = pc.plant_id;

-- ┌──────────┬────────────┬───────────┬────────────────┬─────────────┐
-- │ plant_id │ plant_name │   type    │ water_schedule │  sunlight   │
-- │  int32   │  varchar   │  varchar  │    varchar     │   varchar   │
-- ├──────────┼────────────┼───────────┼────────────────┼─────────────┤
-- │        1 │ Rose       │ Flower    │ Daily          │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │ Weekly         │ Partial Sun │
-- │        4 │ Cactus     │ Succulent │ Biweekly       │ Full Sun    │
-- │     NULL │ NULL       │ NULL      │ Daily          │ Shade       │
-- └──────────┴────────────┴───────────┴────────────────┴─────────────┘

-- FULL JOIN

SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    FULL JOIN plant_care pc ON p.plant_id = pc.plant_id;

-- ┌──────────┬────────────┬───────────┬────────────────┬─────────────┐
-- │ plant_id │ plant_name │   type    │ water_schedule │  sunlight   │
-- │  int32   │  varchar   │  varchar  │    varchar     │   varchar   │
-- ├──────────┼────────────┼───────────┼────────────────┼─────────────┤
-- │        1 │ Rose       │ Flower    │ Daily          │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │ Weekly         │ Partial Sun │
-- │        4 │ Cactus     │ Succulent │ Biweekly       │ Full Sun    │
-- │        2 │ Oak        │ Tree      │ NULL           │ NULL        │
-- │        5 │ Sunflower  │ Flower    │ NULL           │ NULL        │
-- │     NULL │ NULL       │ NULL      │ Daily          │ Shade       │
-- └──────────┴────────────┴───────────┴────────────────┴─────────────┘

-- CROSS JOIN

SELECT
    p.plant_id,
    p.plant_name,
    p.type,
    pc.water_schedule,
    pc.sunlight
FROM
    plants p
    CROSS JOIN plant_care pc;

-- ┌──────────┬────────────┬───────────┬────────────────┬─────────────┐
-- │ plant_id │ plant_name │   type    │ water_schedule │  sunlight   │
-- │  int32   │  varchar   │  varchar  │    varchar     │   varchar   │
-- ├──────────┼────────────┼───────────┼────────────────┼─────────────┤
-- │        1 │ Rose       │ Flower    │ Daily          │ Full Sun    │
-- │        2 │ Oak        │ Tree      │ Daily          │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │ Daily          │ Full Sun    │
-- │        4 │ Cactus     │ Succulent │ Daily          │ Full Sun    │
-- │        5 │ Sunflower  │ Flower    │ Daily          │ Full Sun    │
-- │        1 │ Rose       │ Flower    │ Weekly         │ Partial Sun │
-- │        2 │ Oak        │ Tree      │ Weekly         │ Partial Sun │
-- │        3 │ Tulip      │ Flower    │ Weekly         │ Partial Sun │
-- │        4 │ Cactus     │ Succulent │ Weekly         │ Partial Sun │
-- │        5 │ Sunflower  │ Flower    │ Weekly         │ Partial Sun │
-- │        1 │ Rose       │ Flower    │ Biweekly       │ Full Sun    │
-- │        2 │ Oak        │ Tree      │ Biweekly       │ Full Sun    │
-- │        3 │ Tulip      │ Flower    │ Biweekly       │ Full Sun    │
-- │        4 │ Cactus     │ Succulent │ Biweekly       │ Full Sun    │
-- │        5 │ Sunflower  │ Flower    │ Biweekly       │ Full Sun    │
-- │        1 │ Rose       │ Flower    │ Daily          │ Shade       │
-- │        2 │ Oak        │ Tree      │ Daily          │ Shade       │
-- │        3 │ Tulip      │ Flower    │ Daily          │ Shade       │
-- │        4 │ Cactus     │ Succulent │ Daily          │ Shade       │
-- │        5 │ Sunflower  │ Flower    │ Daily          │ Shade       │
-- ├──────────┴────────────┴───────────┴────────────────┴─────────────┤
-- │ 20 rows                                                5 columns │
-- └──────────────────────────────────────────────────────────────────┘
