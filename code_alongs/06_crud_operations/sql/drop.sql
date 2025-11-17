DROP TABLE database.python;

-- can't drop SCHEMAS with TABLES in
DROP SCHEMA database;

-- use CASCADE to do this
DROP SCHEMA database CASCADE;