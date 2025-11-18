-- List the top 10 bestselling tracks by quantity sold.

SELECT
	t.TrackId,
	t.Name AS track_name,
	COUNT(il.Quantity) AS quantity_sold
FROM InvoiceLine il
JOIN Track t
ON il.TrackId = t.TrackId
GROUP BY t.TrackId, t.Name
ORDER BY quantity_sold DESC
LIMIT 10;

-- Identify the top 5 artists by total revenue.

SELECT 
    ar.ArtistId,
    ar.Name AS ArtistName,
    SUM(il.UnitPrice * il.Quantity) AS TotalRevenue
FROM InvoiceLine il
JOIN Track t 
    ON il.TrackId = t.TrackId
JOIN Album al 
    ON t.AlbumId = al.AlbumId
JOIN Artist ar 
    ON al.ArtistId = ar.ArtistId
GROUP BY ar.ArtistId, ar.Name
ORDER BY TotalRevenue DESC
LIMIT 5;

-- Determine the most popular genre based on tracks sold.

SELECT
	g.Name AS genre_name,
	SUM(il.Quantity) AS number_of_tracks_sold
FROM InvoiceLine il
JOIN Track t
	ON il.TrackId = t.TrackId
JOIN Genre g
	ON t.GenreId = g.GenreId
GROUP BY genre_name
ORDER BY number_of_tracks_sold DESC;

-- Find which media type produces the most revenue.

SELECT 
	mt.Name AS media_type_name,
	SUM(il.UnitPrice * il.Quantity) AS total_revenue
FROM InvoiceLine il
JOIN Track t
	ON il.TrackId = t.TrackId
JOIN MediaType mt
	ON t.MediaTypeId = mt.MediaTypeId
GROUP BY media_type_name
ORDER BY total_revenue DESC;


