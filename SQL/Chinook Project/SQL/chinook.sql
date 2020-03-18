-- Which tracks appeared in the most playlists? how many playlist did they appear in?
SELECT playlist_track.TrackId,tracks.Name, COUNT(PlaylistId) AS 'Count'
FROM playlist_track
LEFT JOIN tracks ON tracks.TrackId = playlist_track.TrackId
GROUP BY 1
ORDER BY 3 DESC;

-- Which track generated the most revenue? which album? which genre?
-- Track that generated most revenue:
SELECT invoice_items.TrackId,tracks.Name,SUM(invoice_items.UnitPrice) AS 'TotalRev'
FROM invoice_items
LEFT JOIN tracks
ON invoice_items.TrackId = tracks.TrackId
GROUP BY 1
ORDER BY 3 DESC;
--which albumn generated most revenue
WITH query1 AS(
SELECT invoice_items.TrackId,tracks.Name AS 'tracks',tracks.AlbumId,albums.Title,tracks.GenreId,genres.Name AS 'genre',invoice_items.UnitPrice
FROM invoice_items
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
JOIN genres ON tracks.GenreId = genres.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId)
SELECT query1.Title,SUM(query1.UnitPrice) AS 'Sum'
FROM query1
GROUP BY 1
ORDER BY 2 DESC;
--which genre generated the most revenue
WITH query1 AS(
SELECT invoice_items.TrackId,tracks.Name AS 'tracks',tracks.AlbumId,albums.Title,tracks.GenreId,genres.Name AS 'genre',invoice_items.UnitPrice
FROM invoice_items
JOIN tracks ON invoice_items.TrackId = tracks.TrackId
JOIN genres ON tracks.GenreId = genres.GenreId
JOIN albums ON tracks.AlbumId = albums.AlbumId)
SELECT query1.genre,SUM(query1.UnitPrice) AS 'Sum'
FROM query1
GROUP BY 1
ORDER BY 2 DESC;

--Which countries have the highest sales revenue? What percent of total revenue does each country make up?
WITH query1 AS(
SELECT BillingCountry AS 'Country',SUM(Total) AS 'Total_Rev'
FROM invoices
GROUP BY 1
ORDER BY 2 DESC)
SELECT query1.Country,query1.Total_Rev,ROUND(query1.Total_Rev * 100 / (SELECT SUM(invoice_items.UnitPrice) FROM invoice_items)) AS 'Percent'
FROM query1
GROUP BY 1
ORDER BY 2 DESC;

--How many customers did each employee support, what is the average revenue for each sale, and what is their total sale?
WITH query1 AS(
SELECT SupportRepId, COUNT(CustomerId) AS 'Count'
FROM customers 
GROUP BY 1)
SELECT (employees.FirstName || ' ' || employees.LastName) AS 'FullName',query1.Count
FROM query1
JOIN employees ON employees.EmployeeId = query1.SupportRepId
GROUP BY 1;
--what is the average revenue for each sale
WITH query1 AS(
SELECT invoices.CustomerId,customers.SupportRepId,(employees.FirstName || ' ' || employees.LastName) AS 'FullName',invoices.Total
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
JOIN employees ON customers.SupportRepId = employees.EmployeeId)
SELECT query1.FullName AS 'FullName', AVG(query1.Total) AS 'Total'
FROM query1
GROUP BY 1;
-- Alternatively
SELECT SUM(Total) / COUNT(InvoiceId) AS 'Revenue per Sale'
FROM invoices;

--what is their total sale
WITH query1 AS(
SELECT invoices.CustomerId,customers.SupportRepId,(employees.FirstName || ' ' || employees.LastName) AS 'FullName',invoices.Total
FROM invoices
JOIN customers ON invoices.CustomerId = customers.CustomerId
JOIN employees ON customers.SupportRepId = employees.EmployeeId),query2 AS(
SELECT query1.FullName AS 'FullName', SUM(query1.Total) AS 'Total'
FROM query1
GROUP BY 1)
SELECT SUM(query2.Total) AS 'Total of Employees'
FROM query2;

--Additional Challenges

--Do longer or shorter length albums tend to generate more revenue?

WITH query1 AS(
SELECT AlbumId,COUNT(AlbumId) AS 'Count'
FROM tracks
GROUP BY 1), query2 AS(
SELECT tracks.AlbumId,SUM(invoice_items.UnitPrice) AS 'TotalPrice'
FROM invoice_items
JOIN tracks ON tracks.TrackId = invoice_items.TrackId
GROUP BY 1)
SELECT query1.Count,query2.TotalPrice
FROM query2
LEFT JOIN query1
ON query1.AlbumId = query2.AlbumId
ORDER by 2 DESC;

--Is the number of times a track appear in any playlist a good indicator of sales?
WITH query1 AS(
SELECT TrackId, COUNT(PlaylistId) AS 'Count'
FROM playlist_track
GROUP BY 1
ORDER BY 2 DESC)
SELECT query1.Count,ROUND(SUM(invoice_items.UnitPrice),2) AS 'SumRev'
FROM invoice_items
LEFT JOIN query1 
ON query1.TrackId = invoice_items.TrackId
GROUP BY 1;

--How much revenue is generated each year, and what is its percent change from the previous year?
WITH query1 AS(
SELECT CAST(strftime('%Y',InvoiceDate) AS int) AS 'CurrYear',SUM(Total) AS 'CurrTotal'
FROM invoices
GROUP BY 1), query2 AS(
SELECT CAST(strftime('%Y',InvoiceDate) AS int) + 1 AS 'PrevYear',SUM(Total) AS 'PrevTotal'
FROM invoices
GROUP BY 1)
SELECT query1.CurrYear,query1.CurrTotal, ((query1.CurrTotal - query2.PrevTotal)/query2.PrevTotal) *100 AS 'Percent'
FROM query1
LEFT JOIN query2 on query1.CurrYear = query2.PrevYear;
