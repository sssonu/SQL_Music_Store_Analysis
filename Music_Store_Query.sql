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


                                --Moderate Questions--

--Q1. Write query to return the email, first name, last name, 
--    & Genre of all Rock Music listeners. Return your list ordered alphabetically
--    by email starting with A
SELECT DISTINCT c.email,c.first_name,c.last_name,g.name 
FROM customer c
JOIN invoice i  
ON  c.customer_id = i.customer_id
JOIN invoice_line il
ON i.invoice_id=il.invoice_id
JOIN track t 
ON il.track_id = t.track_id
JOIN genre g 
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
ORDER BY c.email;

--Q2. Let's invite the artists who have written the most rock music in our dataset.
--    Write a query that returns the Artist name and total track count of the top 10 
--    rock bands
SELECT a.artist_id,a.name AS artist_name,COUNT(g.name) AS genre
FROM artist a 
JOIN album al 
ON a.artist_id = al.artist_id
JOIN track t 
ON al.album_id = t.album_id
JOIN genre g 
ON t.genre_id = g.genre_id
WHERE g.name = 'Rock'
GROUP BY a.artist_id
ORDER BY genre DESC
LIMIT 10;

--Q3. Return all the track names that have a song length longer than the average song length. 
--    Return the Name and Milliseconds for each track. Order by the song length with the
--    longest songs listed first
SELECT name,milliseconds 
FROM track 
WHERE milliseconds > (SELECT AVG(milliseconds) FROM track) 
ORDER BY milliseconds DESC;
