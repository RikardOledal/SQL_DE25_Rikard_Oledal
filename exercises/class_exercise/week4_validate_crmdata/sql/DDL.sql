CREATE SCHEMA IF NOT EXISTS staging;

CREATE TABLE
    IF NOT EXISTS staging.old_crm AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/crm_old.csv')
    );

CREATE TABLE
    IF NOT EXISTS staging.new_crm AS (
        SELECT
            *
        FROM
            read_csv_auto ('data/crm_new.csv')
    );

CREATE SCHEMA IF NOT EXISTS constrained;

CREATE TABLE
    IF NOT EXISTS constrained.old_crm (
        customer_id INTEGER UNIQUE,
        name VARCHAR NOT NULL,
        email VARCHAR CHECK (regexp_matches(email,'[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]')),
        region VARCHAR CHECK (region IN ('EU', 'US')),
        status VARCHAR CHECK (status IN ('active', 'inactive'))
    );
CREATE TABLE
    IF NOT EXISTS constrained.new_crm (
        customer_id INTEGER UNIQUE,
        name VARCHAR NOT NULL,
        email VARCHAR CHECK (regexp_matches(email,'[A-Za-z0-9]+@[A-Za-z]+\.[A-Za-z]')),
        region VARCHAR CHECK (region IN ('EU', 'US')),
        status VARCHAR CHECK (status IN ('active', 'inactive'))
    );
