CREATE TABLE SOTR (
  Name varchar(255),
  Address varchar(255),
  Mesto varchar(255),
  Sex varchar(255),
  BirthDate date
);

CREATE TABLE ZARP (
  Name varchar(255),
  Zarp int
);

CREATE TABLE PAYMENTS (
  Name varchar(255),
  Data date,
  Amount float
);

INSERT INTO SOTR (name, address, mesto, sex, birthdate) VALUES ('Петр', 'Г.Москва, ул. Петрова, д.4', 'Москва', 'M', '1985-04-23');
INSERT INTO SOTR (name, address, mesto, sex, birthdate) VALUES ('Иван', 'Г.Киев, ул. Иванова, д.3', 'Киев', 'M', '1979-12-12');
INSERT INTO SOTR (name, address, mesto, sex, birthdate) VALUES ('Маша', 'Г.Москва, ул. Машина, д.1', 'Москва', 'W', '1980-09-11');
INSERT INTO SOTR (name, address, mesto, sex, birthdate) VALUES ('Федор', 'Г.Москва, ул. Федорова, д.10', 'Фрунзе', 'M', '1976-07-03');

INSERT INTO ZARP (name, zarp) VALUES ('Петр', 100);
INSERT INTO ZARP (name, zarp) VALUES ('Федор', 200);
INSERT INTO ZARP (name, zarp) VALUES ('Маша', 300);

INSERT INTO PAYMENTS (name, data, amount) VALUES ('Петр', '2007-03-30', 70);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Федор', '2007-03-30', 200);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Петр', '2007-04-30', 100);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Маша', '2007-04-30', 250);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Федор', '2007-04-30', 200);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Федор', '2007-05-31', 200);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Маша', '2007-05-31', 300);
INSERT INTO PAYMENTS (name, data, amount) VALUES ('Петр', '2007-05-31', 100);

/*Task 1*/
SELECT * FROM SOTR WHERE birthdate >= '1977-01-01' and birthdate <= '1983-12-31'; 

/*Task 2*/
SELECT * FROM SOTR WHERE sex = 'W'; 

/*Task 3*/
SELECT SOTR.Name, SOTR.Address, ZARP.Zarp from SOTR INNER JOIN ZARP on SOTR.Name = ZARP.Name WHERE SOTR.Name = 'Федор';

/*Task 4*/
SELECT SOTR.Name, SOTR.Address,
CASE
    WHEN ZARP.Zarp is NULL THEN '0' 
    ELSE ZARP.Zarp
END AS Zarp from SOTR LEFT JOIN ZARP ON SOTR.Name = ZARP.Name; 

/*Task 5*/
SELECT SOTR.Name,
CASE
    WHEN SUM(amount) is NULL THEN '0' 
    ELSE SUM(amount)
END AS amount FROM SOTR LEFT JOIN PAYMENTS ON SOTR.Name = PAYMENTS.Name GROUP BY SOTR.Name;

