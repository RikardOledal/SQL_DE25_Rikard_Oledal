INSERT INTO staging.employees (department, employment_year)
VALUES 
    ('Sales', 2001),
    ('Logistics', 2002),
    ('IT', 2002);

INSERT INTO staging.employees (department, employment_year)
    SELECT * FROM read_csv('data/employees.csv');