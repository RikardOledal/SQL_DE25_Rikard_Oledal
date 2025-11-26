CREATE TABLE
    IF NOT EXISTS students (name VARCHAR NOT NULL, age UINT8);

-- INSERT INTO students (name, age)
-- VALUES (NULL, 8), ('Amy', 5);

-- DROP TABLE students;

-- CREATE TABLE
--     IF NOT EXISTS students (name VARCHAR UNIQUE, age UINT8);

-- INSERT INTO
--     students (name, age)
-- VALUES 
--     ('Amy', 13),
--     ('Bill', 5);

-- INSERT INTO
--     students (name, age)
-- VALUES 
--     ('Bill', 13);

DROP TABLE students;

-- CREATE TABLE
--     IF NOT EXISTS students (name VARCHAR NOT NULL, age UINT8 CHECK (age >= 18));

-- INSERT INTO
--     students (name, age)
-- VALUES 
--     ('Amy', 17),
--     ('Bill', 21);

CREATE TABLE
    IF NOT EXISTS students (name VARCHAR, age INTEGER);

ALTER TABLE students
ALTER COLUMN age SET DEFAULT 10;

INSERT INTO
    students (name)
VALUES 
    ('Amy'),
    ('Bill');

FROM students;

ALTER TABLE students
ALTER COLUMN age DROP DEFAULT;

INSERT INTO
    students (name)
VALUES 
    ('Amy'),
    ('Bill');

FROM students;
