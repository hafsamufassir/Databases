create DATABASE lab2;

create table countries(
  country_id SERIAL PRIMARY KEY,
  country_name varchar(255),
  region_id int,
  population int
);

INSERT INTO countries(country_name, region_id, population)
VALUES ('PAKISTAN', 786, 193);

INSERT INTO countries(region_id)
VALUES (NULL);

INSERT INTO countries(country_name, region_id, population)
VALUES ('KAZAKHSTAN', 786, 17), ('RUSSIA', 123, 100), ('INDIA', 124, 1);

ALTER TABLE countries
    ALTER COLUMN country_name SET DEFAULT 'KAZAKHSTAN';

INSERT INTO countries(country_name)
VALUES (DEFAULT);

-- INSERT INTO countries(country_name, region_id, population)
-- VALUES (DEFAULT, DEFAULT, DEFAULT);

INSERT INTO countries DEFAULT VALUES ;

  CREATE TABLE countries_new (LIKE countries including all);

INSERT into countries_new
SELECT * from countries;

update countries_new SET region_id = 1 where region_id ISNULL;

update countries_new
set population = population*1.1
returning country_name, population AS "New Population";

DELETE FROM countries_new
WHERE population<100000 OR population ISNULL;
-- RETURNING *;

DELETE FROM countries_new
USING countries
WHERE countries.country_id = countries_new.country_id
returning *;

delete from countries
returning *;











