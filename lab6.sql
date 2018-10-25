CREATE DATABASE lab6; --1


CREATE TABLE locations(
  location_id SERIAL PRIMARY KEY,
  street_adress VARCHAR(25),
  postal_code VARCHAR(12),
  city VARCHAR(30),
  state_province VARCHAR(12)
);

CREATE TABLE departments(
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(50) UNIQUE,
  budget INTEGER,
  location_id INTEGER REFERENCES locations
);


CREATE TABLE employees(
  employee_id SERIAL PRIMARY KEY ,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  email VARCHAR(50),
  phone_number VARCHAR(20),
  salary INTEGER,
  department_id INTEGER REFERENCES departments
);  --2




SELECT first_name, last_name, departments.department_id, department_name
FROM employees
       JOIN departments on employees.department_id = departments.department_id; --3


SELECT first_name, last_name, departments.department_id, department_name
FROM employees
       JOIN departments on employees.department_id = departments.department_id
WHERE employees.department_id = 80
   OR employees.department_id = 40; --40


SELECT first_name, last_name, department_name, city, state_province
FROM employees
       JOIN departments on employees.department_id = departments.department_id
       JOIN locations on departments.location_id = locations.location_id; --5

SELECT departments.department_id, department_name, budget, location_id
FROM departments
       LEFT JOIN employees ON departments.department_id = employees.department_id
WHERE employees.department_id ISNULL ; --6


SELECT first_name, last_name, employees.department_id, department_name
FROM employees
       LEFT JOIN departments ON departments.department_id = employees.department_id; --7








