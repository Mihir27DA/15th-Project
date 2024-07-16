create database supermarket;
use supermarket;

-- 1. Display the first 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
LIMIT 5;

-- 2. Display the last 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
ORDER BY `Invoice ID` DESC
LIMIT 5;

-- 3. Display random 5 rows from the dataset.
SELECT 
    *
FROM
    supermarket
ORDER BY RAND()
LIMIT 5;

-- 4. Display count, min, max, avg, and std values in the dataset.
SELECT 
    COUNT(`gross income`),
    MIN(`gross income`),
    MAX(`gross income`),
    AVG(`gross income`),
    STD(`gross income`)
FROM
    supermarket;


-- 5. Find the number of missing values.
SELECT 
    COUNT(*)
FROM
    supermarket
WHERE
    Branch IS NULL;

-- 6. Count the number of occurrences of each city.
SELECT 
    City, COUNT(City)
FROM
    supermarket
GROUP BY City;

-- 7. Find the most frequently used payment method.
SELECT 
    Payment, COUNT(*) as count
FROM
    supermarket
GROUP BY Payment
ORDER BY COUNT(*) DESC;


-- 8. Find the most profitable branch as per gross income.

SELECT 
    City, Branch, SUM(`gross income`)
FROM
    supermarket
GROUP BY City , Branch;


-- 9.  Find the most used payment method city-wise.

SELECT 
    city,
    SUM(CASE
        WHEN Payment = 'Cash' THEN 1
        ELSE 0
    END) AS 'Cash',
    SUM(CASE
        WHEN Payment = 'Ewallet' THEN 1
        ELSE 0
    END) AS 'Ewallet',
    SUM(CASE
        WHEN Payment = 'Credit card' THEN 1
        ELSE 0
    END) AS 'Credit card'
FROM
    supermarket
GROUP BY City;


-- 10. Find the product line purchased in the highest quantity.
SELECT 
    `Product line`, SUM(Quantity)
FROM
    supermarket
GROUP BY `Product line`
ORDER BY SUM(Quantity) DESC;


-- 11. Find the time at which sales are highest.

SELECT 
    HOUR(Time) AS hour, SUM(Total) AS total
FROM
    supermarket
GROUP BY hour
ORDER BY total DESC;

-- 12. Which gender spends more on average?
SELECT 
    Gender, AVG(`gross income`)
FROM
    supermarket
GROUP BY Gender;