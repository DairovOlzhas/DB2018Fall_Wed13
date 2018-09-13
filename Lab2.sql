CREATE DATABASE lab2;

CREATE TABLE countries (
  country_id SERIAL PRIMARY KEY ,
  country_name TEXT,
  region_id INTEGER,
  populaation INTEGER
);

INSERT INTO countries (country_id, country_name, region_id, populaation) VALUES (DEFAULT ,'Kazakhstan', 1, 18000000);

SELECT * FROM countries;

INSERT INTO countries (country_id, country_name) VALUES (15, 'Russia');

INSERT INTO countries (region_id) VALUES (NULL );

INSERT INTO countries VALUES (DEFAULT );
INSERT INTO countries VALUES (DEFAULT );
INSERT INTO countries VALUES (DEFAULT );

ALTER TABLE countries
    ALTER country_name SET DEFAULT 'Kazakhstan';

INSERT INTO countries (country_name) VALUES (DEFAULT);

INSERT INTO countries DEFAULT VALUES ;

CREATE TABLE countries_new(
  LIKE countries
);

SELECT * FROM countries_new;

INSERT INTO countries_new
    SELECT * FROM countries;

UPDATE countries_new
  SET region_id = 1
    WHERE region_id ISNULL ;

UPDATE countries
  SET populaation = populaation * 1.1
RETURNING country_name, populaation AS new_population;



DELETE FROM countries
    WHERE populaation < 100000;

DELETE FROM countries_new AS cn USING countries AS c
  WHERE cn.country_id = c.country_id
RETURNING *;

DELETE FROM countries
RETURNING *;