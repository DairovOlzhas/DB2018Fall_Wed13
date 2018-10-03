CREATE DATABASE lab5;

CREATE TABLE customers (
  customer_id SERIAL UNIQUE PRIMARY KEY,
  cust_name VARCHAR(50),
  city VARCHAR(50),
  grade INTEGER,
  salesman_id SERIAL
); --1
CREATE TABLE orders (
  ord_no SERIAL PRIMARY KEY ,
  purch_amt DOUBLE PRECISION,
  ord_date DATE,
  customer_id SERIAL REFERENCES customers(customer_id),
  salesman_id SERIAL
); --2

  SELECT sum(purch_amt) FROM orders;--3
  SELECT avg(purch_amt) FROM orders;--4
SELECT count(*) FROM customers WHERE cust_name NOTNULL ;--5
  SELECT min(purch_amt) FROM orders;--6
  SELECT * FROM customers WHERE cust_name = '%b';--7
  SELECT * FROM orders WHERE customer_id IN (SELECT customer_id FROM customers WHERE city = 'New York');--8
SELECT * FROM customers WHERE customer_id IN (SELECT customer_id FROM orders WHERE purch_amt > 10);--9
SELECT sum(grade) FROM customers;--10

SELECT * FROM customers WHERE cust_name NOTNULL ;--11
SELECT max(grade) FROM customers;--12