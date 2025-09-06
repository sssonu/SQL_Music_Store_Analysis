                                                                  --Easy level Questions----

--Q1. Who is the senior most employee based on job title?
SELECT * FROM employee 
ORDER BY levels DESC 
LIMIT 1;

--Q2. Which countries have the most Invoices?
SELECT billing_country,COUNT(*) AS total_invoices
FROM invoice 
GROUP BY billing_country
ORDER BY total_invoices DESC 
LIMIT 1;

--Q3. What are top 3 values of total invoice?
SELECT * FROM invoice
ORDER BY total DESC
LIMIT 3;

--Q4. Which city has the best customers? We would like to throw a promotional Music
--    Festival in the city we made the most money. Write a query that returns one city 
--    that has the highest sum of invoice totals. Return both the city name & sum of all 
--    invoice totals
SELECT billing_city AS highest_customer_city,SUM(total) AS sum_of_total_invoices
FROM invoice 
GROUP BY billing_city 
ORDER BY SUM(total) 
DESC LIMIT 1;

--Q5. Who is the best customer? 
--    The customer who has spent the most money will be declared the best customer. 
--    Write a query that returns the person who has spent the most money

SELECT c.customer_id,c.first_name,c.last_name, SUM(i.total)
FROM customer c
JOIN invoice i 
ON c.customer_id = i.customer_id
GROUP BY c.customer_id
ORDER BY SUM(i.total)
DESC LIMIT 1;


