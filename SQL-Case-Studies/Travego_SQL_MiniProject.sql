-- Create the database
CREATE DATABASE IF NOT EXISTS travego;

-- Use the database
USE travego;

-- Create the passenger table
CREATE TABLE passenger (
    Passenger_id INT PRIMARY KEY,
    Passenger_name VARCHAR(30) NOT NULL,
    Category ENUM('AC', 'Non-AC'),
    Gender ENUM('M', 'F'),
    Boarding_City VARCHAR(20) NOT NULL,
    Destination_City VARCHAR(20) NOT NULL,
    Distance INT,
    Bus_Type ENUM('Sleeper', 'Sitting')
);

-- Create the price table with a foreign key reference
CREATE TABLE price (
    id INT PRIMARY KEY,
    Bus_Type ENUM('Sleeper', 'Sitting'),
    Distance INT,
    price INT
);

-- Instering the Data into passenger table
INSERT INTO passenger (Passenger_id, Passenger_name, Category, Gender, Boarding_City, Destination_City, Distance, Bus_Type)
VALUES
    (1, 'Sejal', 'AC', 'F', 'Bengaluru', 'Chennai', 350, 'Sleeper'),
    (2, 'Anmol', 'Non-AC', 'M', 'Mumbai', 'Hyderabad', 700, 'Sitting'),
    (3, 'Pallavi', 'AC', 'F', 'Panaji', 'Bengaluru', 600, 'Sleeper'),
    (4, 'Khusboo', 'AC', 'F', 'Chennai', 'Mumbai', 1500, 'Sleeper'),
    (5, 'Udit', 'Non-AC', 'M', 'Trivandrum', 'Panaji', 1000, 'Sleeper'),
    (6, 'Ankur', 'AC', 'M', 'Nagpur', 'Hyderabad', 500, 'Sitting'),
    (7, 'Hemant', 'Non-AC', 'M', 'Panaji', 'Mumbai', 700, 'Sleeper'),
    (8, 'Manish', 'Non-AC', 'M', 'Hyderabad', 'Bengaluru', 500, 'Sitting'),
    (9, 'Piyush', 'AC', 'M', 'Pune', 'Nagpur', 700, 'Sitting');
    
-- Instering the Data into price table
INSERT INTO price (id, Bus_Type, Distance, price)
VALUES
    (1, 'Sleeper', 350, 770),
    (2, 'Sleeper', 500, 1100),
    (3, 'Sleeper', 600, 1320),
    (4, 'Sleeper', 700, 1540),
    (5, 'Sleeper', 1000, 2200),
    (6, 'Sleeper', 1200, 2640),
    (7, 'Sleeper', 1500, 2700),
    (8, 'Sitting', 500, 620),
    (9, 'Sitting', 600, 744),
    (10, 'Sitting', 700, 868),
    (11, 'Sitting', 1000, 1240),
    (12, 'Sitting', 1200, 1488),
    (13, 'Sitting', 1500, 1860);

SELECT * FROM passenger;
SELECT * FROM price;

-- a. How many females and how many male passengers traveled a minimum distance of 600 KMs?
SELECT Gender, COUNT(*) as Count
FROM passenger
WHERE Distance >= 600
GROUP BY Gender;

-- b. Find the minimum ticket price of a Sleeper Bus.
SELECT MIN(price) as MinTicketPrice
FROM price
WHERE Bus_Type = 'Sleeper';

-- c. Select passenger names whose names start with character 'S'
SELECT Passenger_name
FROM passenger
WHERE LEFT(Passenger_name, 1) = 'S';

-- d. Calculate the price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output
SELECT p.Passenger_name, p.Boarding_City, p.Destination_City, p.Bus_Type, pr.price
FROM passenger p
JOIN price pr ON p.Passenger_id = pr.id;

-- e. What are the passenger name(s) and the ticket price for those who traveled 1000 KMs Sitting in a bus?
SELECT p.Passenger_name, pr.price
FROM passenger p
LEFT JOIN price pr ON p.Passenger_id = pr.id
WHERE p.Distance = 1000 AND p.Bus_type = 'Sitting'
UNION
SELECT p.Passenger_name, pr.price
FROM passenger p
LEFT JOIN price pr ON p.Passenger_id = pr.id
WHERE p.Distance = 1000 AND p.Bus_type = 'Sitting';


-- f. What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji? 
SELECT p.Bus_Type, pr.price
FROM passenger p
JOIN price pr ON p.Passenger_id = pr.id
WHERE p.Passenger_name = 'Pallavi' AND p.Boarding_City = 'Bengaluru' AND p.Destination_City = 'Panaji';

-- #Question is only Wrong if it was from Panaji to Bangalore (Bengaluru) then asnwer would be 
SELECT p.Bus_Type, pr.price
FROM passenger p
JOIN price pr ON p.Passenger_id = pr.id
WHERE p.Passenger_name = 'Pallavi' AND p.Boarding_City ='Panaji'  AND p.Destination_City = 'Bengaluru';

-- g. List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.
SELECT DISTINCT Distance
FROM passenger
ORDER BY Distance DESC;

-- h. Display the passenger name and percentage of distance traveled by that passenger from the total distance traveled by all passengers without using user variables.
SELECT p.Passenger_name, 
       (p.Distance / SUM(p.Distance) OVER ()) * 100 AS PercentageDistance
FROM passenger p;


