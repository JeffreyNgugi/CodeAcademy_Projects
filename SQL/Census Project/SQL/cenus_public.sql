SELECT zip_code, COUNT(*)
FROM public_data
GROUP BY zip_code;

SELECT state_code, COUNT(*)
FROM public_data
GROUP BY 1;

SELECT locale_code,
CASE 
	WHEN locale_code BETWEEN 11 AND 13 THEN 'City'
	WHEN locale_code BETWEEN 21 AND 23 THEN 'Suburb'
	WHEN locale_code BETWEEN 31 AND 33 THEN 'Town'
	WHEN locale_code BETWEEN 41 AND 43 THEN 'Rural'
	ELSE 'Undescribed'
END AS locale_Text,
CASE 
	WHEN locale_code = 11 OR locale_code= 21 THEN 'large'
	WHEN locale_code = 12 OR locale_code= 22 THEN 'Midsize'
	WHEN locale_code = 13 OR locale_code= 23 THEN 'Small'
	WHEN locale_code = 31 OR locale_code= 41 THEN 'Fringe'
	WHEN locale_code = 32 OR locale_code= 42 THEN 'Distant'
	WHEN locale_code = 33 OR locale_code= 43 THEN 'Remote'
END AS local_size
FROM public_data;

SELECT MIN(median_household_income),MAX(median_household_income),AVG(median_household_income)
FROM census_data;

SELECT state_code,MIN(median_household_income),MAX(median_household_income),AVG(median_household_income)
FROM census_data
GROUP BY 1;

SELECT 
CASE
	WHEN median_household_income < 50000 THEN '<$50k'
	WHEN median_household_income BETWEEN 50000 AND 100000 THEN '$50K - $100K'
	WHEN median_household_income > 100000 THEN '$100K+'
	ELSE 'undefined'
END AS income_grouped, AVG(pct_edu_hs) AS 'Average'
FROM census_data
GROUP BY 1;

WITH query1 AS (
SELECT state_code,AVG(pct_proficient_math) AS 'maths',AVG(pct_proficient_reading) AS 'reading'
FROM public_data
GROUP BY 1), 
query2 AS(
SELECT query1.state_code, 
CASE
	WHEN query1.maths > query1.reading THEN 'M'
	WHEN query1.maths < query1.reading THEN 'R'
	WHEN query1.maths = query1.reading THEN 'Equal'
	ELSE 'No Exam Data'
END AS subject
FROM query1)

SELECT COUNT(*)
FROM query2
WHERE query2.subject = 'R';

SELECT state_code,zip_code,(pct_proficient_math + pct_proficient_reading)/2 AS 'all'
FROM public_data
WHERE state_code = 'AK'
GROUP BY 1,2
ORDER BY 3 DESC;