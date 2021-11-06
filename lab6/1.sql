--a
SELECT * FROM dealer JOIN client ON dealer.id = client.dealer_id;

-- b
SELECT dealer.name, client.name, client.city, client.priority, sell.id, sell.date, sell.amount
FROM dealer JOIN client ON dealer.id = client.dealer_id
JOIN sell ON dealer.id = sell.dealer_id AND client.id = sell.client_id;

-- c
SELECT * FROM dealer JOIN client ON dealer.id = client.dealer_id WHERE dealer.location=client.city;

-- d
SELECT sell.id, sell.amount, client.name, client.city
FROM client JOIN sell ON client.id = sell.client_id WHERE sell.amount BETWEEN 100 AND 500;

-- e
SELECT * FROM dealer FULL OUTER JOIN client ON dealer.id = client.dealer_id;

-- f
SELECT client.name, client.city, dealer.name,dealer.charge
FROM dealer JOIN client ON dealer.id = client.dealer_id;

-- g
SELECT client.name, client.city, dealer, dealer.charge
FROM client JOIN dealer ON dealer.id = client.dealer_id
WHERE dealer.charge > 0.12;

-- h
SELECT client.name, client.city, sell.id, sell.date, sell.amount, dealer.name, dealer.charge
FROM dealer JOIN client ON dealer.id = client.dealer_id
JOIN sell ON client.id = sell.client_id;

-- i
SELECT client.name, client.priority, dealer.name, sell.id, sell.amount
FROM dealer JOIN client ON dealer.id = client.dealer_id
JOIN sell ON client.id = sell.client_id
WHERE priority IS NOT NULL AND sell.amount > 2000;

--task 2
-- a
CREATE VIEW v1 AS
    SELECT date, COUNT(distinct client_id) AS "number", AVG(amount) as "average", SUM(amount) as "total"
    FROM sell group by date;

-- b
CREATE VIEW v2 AS
    SELECT date, amount FROM sell ORDER BY amount DESC LIMIT 5;

-- c
CREATE VIEW v3 AS
    SELECT dealer, COUNT(amount) AS "number", AVG(amount) as "average",SUM(amount) as "total"
    FROM sell JOIN dealer ON sell.dealer_id = dealer.id GROUP BY dealer;

-- d
CREATE VIEW v4 AS
    SELECT dealer, SUM(amount * dealer.charge) AS "earned"
    FROM sell JOIN dealer ON sell.dealer_id = dealer.id GROUP BY dealer;

-- e
CREATE VIEW v5 AS
    SELECT location, COUNT(amount) as "number", AVG(amount) as "avarage", SUM(amount) as "total"
    FROM dealer JOIN sell ON dealer.id = sell.dealer_id GROUP BY location;

-- f
CREATE VIEW v6 AS
    SELECT city , COUNT(amount) as "number", AVG(amount * (dealer.charge + 1)) as "average", SUM(amount * (dealer.charge +1)) as "total"
    FROM client JOIN dealer ON client.dealer_id = dealer.id
    JOIN sell ON client.id = sell.client_id GROUP BY city;

-- g
CREATE VIEW v7 AS
    SELECT client.city, SUM(sell.amount * (dealer.charge + 1)) AS cities, SUM(amount) AS locations
    FROM client JOIN sell ON client.id = sell.client_id
    JOIN dealer ON sell.dealer_id = dealer.id and client.city = dealer.location GROUP BY city;
