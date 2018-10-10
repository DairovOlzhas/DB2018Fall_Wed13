CREATE DATABASE lab4;

CREATE  TABLE warehouses(
  code INTEGER,
  location VARCHAR(255),
  capacity INTEGER
);

CREATE TABLE boxes (
  code CHAR(4),
  contents VARCHAR(255),
  value REAL,
  warehouse INTEGER
);

INSERT INTO Warehouses(Code,Location,Capacity) VALUES(1,'Chicago',3);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(2,'Chicago',4);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(3,'New York',7);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(4,'Los Angeles',2);
 INSERT INTO Warehouses(Code,Location,Capacity) VALUES(5,'San Francisco',8);

 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('0MN7','Rocks',180,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4H8P','Rocks',250,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('4RT3','Scissors',190,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('7G3H','Rocks',200,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8JN6','Papers',75,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('8Y6U','Papers',50,3);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('9J6F','Papers',175,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('LL08','Rocks',140,4);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P0H6','Scissors',125,1);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('P2T6','Scissors',150,2);
 INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('TU55','Papers',90,5);


--4
SELECT * FROM warehouses;

--5
SELECT * FROM boxes WHERE value BETWEEN 50 AND 150;

--6
SELECT distinct on (warehouse) * FROM boxes;

--7
SELECT count(*) FROM boxes GROUP BY contents;

--8
INSERT INTO Warehouses(Code,Location,Capacity) VALUES(6,'New York',3);

--9
INSERT INTO Boxes(Code,Contents,Value,Warehouse) VALUES('H2RT','Papers',200,2);

--10
UPDATE Boxes SET value = 0.8 * value WHERE value = (SELECT value FROM boxes ORDER BY value ASC LIMIT 1 OFFSET 2);

--11
DELETE FROM Boxes WHERE value<=150;


--12
DELETE FROM Boxes WHERE warehouse In(SELECT code FROM Warehouses WHERE location = 'New York')
  RETURNING code,warehouse;