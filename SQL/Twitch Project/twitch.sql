/*
--getting a feel for the stream table
SELECT * FROM stream LIMIT 20;

--What are the unique games in the stream table?
SELECT DISTINCT game FROM stream WHERE game IS NOT NULL;

--What are the unique channels in the stream table?
SELECT DISTINCT channel FROM stream WHERE channel IS NOT NULL;

--What are the most popular games in the stream table?
SELECT game, COUNT(device_id) AS 'No of viewers' FROM stream WHERE game is NOT NULL
GROUP BY game ORDER BY 2 DESC;

--Where are these LoL stream viewers located?
SELECT country, COUNT(device_id) AS 'No of LOL Viewers' FROM stream WHERE game = 'League of Legends'
GROUP BY country ORDER BY 2 DESC;

-- Create a list of players and their number of streamers.
SELECT player,COUNT(player) AS'No of streamers' FROM stream WHERE player IS NOT NULL
GROUP BY 1 ORDER BY 2 DESC;*/

/*
SELECT
CASE
	WHEN game = 'League of Legends' THEN 'MOBA'
	WHEN game = 'Dota 2' THEN 'MOBA'
	WHEN game = 'Heroes of the Storm' THEN 'MOBA'
	WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS'
	WHEN game = 'DayZ' THEN 'Survival'
	WHEN game = 'Survival Evolved' THEN 'Survival'
	ELSE 'Other'
END AS 'genre'
FROM stream
GROUP BY 1
ORDER BY 1 ASC;*/
/*
--How does view count change in the course of a day?
SELECT time
FROM stream
LIMIT 10;*/

SELECT strftime('%H',time) AS 'Hour of the day', COUNT(device_id) AS 'No of viewers'
FROM stream
WHERE country = 'US'
GROUP BY 1;

