create DATABASE lab7;


CREATE TABLE departments(
  departments_id serial
);

CREATE TABLE employees(
  departments_id serial
);


CREATE INDEX country_name
  ON countries (name); --1


CREATE INDEX country_name_sutname
  ON countries (name, surname); --2


CREATE UNIQUE INDEX employee_salary
  ON employees (salary); --3


CREATE UNIQUE INDEX employee_name_format
  ON employees (substring(name from 1 for 4));--4


CREATE INDEX empl_dep_sal_bud
  ON employees inner join departments (departments.deparrment_id, e.department_id, d.budget, e.salary); --5




