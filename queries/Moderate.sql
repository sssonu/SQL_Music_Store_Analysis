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
