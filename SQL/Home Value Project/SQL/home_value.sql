--SELECT DISTINCT  COUNT(DISTINCT zip_code)
--FROM home_value_data;

--SELECT state,COUNT(zip_code) AS 'Count'
--FROM home_value_data
--GROUP BY 1;

--SELECT MAX(substr(date,1,4)) AS 'Max year',MIN(substr(date,1,4)) AS 'Min year'
--FROM home_value_data;

--SELECT MAX(value),MIN(value)
--FROM home_value_data
--WHERE date = '2018-11';

/*WITH query1 AS (
SELECT state,ROUND(AVG(value),2) AS 'average_07'
FROM home_value_data
WHERE substr(date,1,4) = '2007'
GROUP BY 1),
query2 AS (SELECT state,ROUND(AVG(value),2) AS 'average_17'
FROM home_value_data
WHERE substr(date,1,4) = '2017'
GROUP BY 1)
SELECT query1.state,query1.average_07,query2.average_17, ((query2.average_17 -query1.average_07)/query1.average_07) * 100 AS 'Change'
FROM query2
JOIN query1
ON query1.state = query2.state
ORDER BY 4 DESC;*/

WITH query1 AS (
SELECT state,ROUND(AVG(value),2) AS 'average_97'
FROM home_value_data
WHERE substr(date,1,4) = '1997'
GROUP BY 1),
query2 AS (SELECT state,ROUND(AVG(value),2) AS 'average_17'
FROM home_value_data
WHERE substr(date,1,4) = '2017'
GROUP BY 1)
SELECT query1.state,query1.average_97,query2.average_17, ((query2.average_17 - query1.average_97)/query1.average_97) * 100 AS 'Change'
FROM query2
JOIN query1
ON query1.state = query2.state
ORDER BY 4 DESC;