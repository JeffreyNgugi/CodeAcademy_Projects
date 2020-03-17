--SELECT DISTINCT Year
--FROM airfare_data
--ORDER BY 1 ASC;

--SELECT city1,city2,MAX(nsmiles)
--FROM airfare_data;

--SELECT city1,city2,MIN(nsmiles)
--FROM airfare_data;

/*SELECT DISTINCT city1 AS 'cities'
FROM airfare_data
UNION
SELECT DISTINCT city2
FROM airfare_data;*/

/*SELECT carrier_low, COUNT(carrier_low)
FROM airfare_data
GROUP BY 1
ORDER BY 2 DESC;*/

/*SELECT carrier_lg, COUNT(carrier_lg)
FROM airfare_data
GROUP BY 1
ORDER BY 2 DESC;*/

--SELECT COUNT(*),AVG(fare_lg - fare_low)
--FROM airfare_data
--WHERE carrier_lg != carrier_low;

/*SELECT carrier_lg,carrier_low,ROUND((fare_lg-fare_low),2) AS 'Difference'
FROM airfare_data
WHERE carrier_lg != carrier_low;*/

/*WITH query1 AS(
SELECT Year,citymarketid_1,citymarketid_2,city1,city2,fare
FROM airfare_data
WHERE Year = 2007), query2 AS(
SELECT Year,citymarketid_1,citymarketid_2,city1,city2,fare
FROM airfare_data
WHERE Year = 2017)
SELECT query1.city1,query2.city2,query1.fare AS 'fare_2007',query2.fare AS 'fare_2017', ((query2.fare - query1.fare) / query1.fare) * 100 AS 'Percent_Change'
FROM query1
JOIN query2
ON query1.citymarketid_1 = query2.citymarketid_1
AND query1.citymarketid_2 = query2.citymarketid_2
ORDER BY 5 DESC;*/

/*WITH query1 AS(
SELECT Year,citymarketid_1,citymarketid_2,city1,city2,fare
FROM airfare_data
WHERE Year = 1997), query2 AS(
SELECT Year,citymarketid_1,citymarketid_2,city1,city2,fare
FROM airfare_data
WHERE Year = 2017)
SELECT query1.city1,query2.city2,query1.fare AS 'fare_1997',query2.fare AS 'fare_2017', ((query2.fare - query1.fare) / query1.fare) * 100 AS 'Percent_Change'
FROM query1
JOIN query2
ON query1.citymarketid_1 = query2.citymarketid_1
AND query1.citymarketid_2 = query2.citymarketid_2
ORDER BY 5 DESC;*/

-- Joining tables to create a table with only flights that have data available for all 4 quarters.
/*
SELECT airfare_Q1.Year,airfare_Q1.quarter AS 'Q1',airfare_Q2.quarter AS 'Q2',airfare_Q3.quarter AS 'Q3',airfare_Q4.quarter AS 'Q4',airfare_Q1.citymarketid_1,airfare_Q1.citymarketid_2,airfare_Q1.city1,airfare_Q1.city2,airfare_Q1.fare AS 'fare1',airfare_Q2.fare AS 'fare2',airfare_Q3.fare AS 'fare3',airfare_Q4.fare AS 'fare4'
FROM airfare_Q1
JOIN airfare_Q2 ON airfare_Q1.citymarketid_1 = airfare_Q2.citymarketid_1 AND airfare_Q1.citymarketid_2 = airfare_Q2.citymarketid_2 AND airfare_Q1.Year = airfare_Q2.Year
JOIN airfare_Q3 ON airfare_Q3.citymarketid_1 = airfare_Q2.citymarketid_1 AND airfare_Q3.citymarketid_2 = airfare_Q2.citymarketid_2 AND airfare_Q3.Year = airfare_Q2.Year
JOIN airfare_Q4 ON airfare_Q4.citymarketid_1 = airfare_Q3.citymarketid_1 AND airfare_Q4.citymarketid_2 = airfare_Q3.citymarketid_2 AND airfare_Q4.Year = airfare_Q3.Year;
*/

--Union to create table airfare_all_quarters
/*SELECT *
FROM airfareQ1
UNION
SELECT *
FROM airfareQ2
UNION
SELECT *
FROM airfareQ3
UNION
SELECT *
FROM airfareQ4*/

SELECT quarter, ROUND(AVG(fare),2) AS 'Average Fare'
FROM airfare_all_quarters
GROUP BY quarter;

SELECT Year,quarter, ROUND(AVG(fare),2) AS 'Average Fare'
FROM airfare_all_quarters
GROUP BY 1,2;
