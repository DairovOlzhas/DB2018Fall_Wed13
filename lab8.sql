CREATE DATABASE lab8; --1

CREATE TABLE salesman(
  salesman_id SERIAL PRIMARY KEY ,
  name VARCHAR(50),
  city VARCHAR(255),
  commision REAL
);

CREATE TABLE customers(
  customer_id SERIAL primary key ,
  name VARCHAR(255),
  city VARCHAR(255),
  grade INTEGER,
  salesman_id SERIAL references salesman(salesman_id)
);


CREATE TABLE orders(
  ord_nu SERIAL,
  purch_amt REAL,
  ord_date DATE,
  customer_id SERIAL references  customers(customer_id),
  salesman_id SERIAL references salesman(salesman_id)
);  --2

CREATE VIEW salesman_NYC AS
  SELECT *
  FROM salesmans
  WHERE city = 'New York'
;--4

CREATE VIEW ord_by_names AS
  SELECT customers.name AS CUST_NAMe, salesman.name AS SALES_NAME
  FROM customers
         INNER JOIN orders on customers.customer_id = orders.customer_id
         INNER JOIN salesman on orders.salesman_id = salesman.salesman_id; --5


CREATE VIEW numb_salesmans_city AS
  SELECT city, count(*)
  FROM salesman
  GROUP BY city; --7

CREATE VIEW salesman_with_custs AS
  SELECT *
  FROM salesman
  WHERE salesman_id IN (SELECT salesman_id FROM customers GROUP BY customer_id HAVING count(*) > 1); --8





