SELECT * FROM spotify;


--Retrieve the names of all tracks that have more than 1 billion streams.

SELECT artist,
       track,
	   stream
FROM spotify
WHERE stream > 1000000000;


--List all albums along with their respective artists.


SELECT artist,
       album
FROM spotify;


--Get the total number of comments for tracks where licensed = TRUE.

SELECT track,
       comments,
	   licensed
FROM spotify
WHERE licensed = 'TRUE';


--Find all tracks that belong to the album type single.

SELECT track,
       album_type
FROM spotify
WHERE album_type = 'single';



--Count the total number of tracks by each artist.

SELECT artist,
       COUNT(*)
FROM spotify
GROUP BY artist
ORDER BY 2 DESC;




--Medium Level

--Calculate the average danceability of tracks in each album.

SELECT album,
       AVG(danceability)
FROM spotify
GROUP BY album;
	   


--Find the top 5 tracks with the highest energy values.

SELECT track,
       energy,
	   RANK() OVER (ORDER BY energy) as rank
FROM spotify
ORDER BY rank DESC
LIMIT 5;



--List all tracks along with their views and likes where official_video = TRUE.


SELECT track,
       SUM(views) as total_views,
	   SUM(likes) as totlal_likes
FROM spotify
WHERE official_video = 'TRUE'
GROUP BY track;


--For each album, calculate the total views of all associated tracks.

SELECT album,
       track,
       SUM(views) total_views
FROM spotify
GROUP BY 1,2
ORDER BY 2 DESC;
	   

--Retrieve the track names that have been streamed on Spotify more than YouTube.

SELECT * FROM spotify;

SELECT * FROM (
			SELECT track,			
			       COALESCE (SUM (CASE WHEN most_playedon = 'Spotify' THEN stream END),0) as most_playedon_spotify,
				   COALESCE (SUM (CASE WHEN most_playedon = 'Youtube' THEN stream END),0) as most_playedon_youtube			   
			FROM spotify
			GROUP BY 1
			ORDER BY 1 ) AS t1
WHERE most_playedon_spotify  > most_playedon_youtube
      AND
	  most_playedon_youtube != 0 ;	



---Find the top 3 most-viewed tracks for each artist using window functions.


SELECT * FROM spotify;


WITH CTE AS
           (
			SELECT artist,
			       track,
				   SUM(views) as tot_views,
				   DENSE_RANK() OVER (PARTITION BY artist ORDER BY SUM(views) DESC) as views	   
			FROM spotify
			GROUP BY 1,2
			ORDER BY 1,3 DESC
			)	   
SELECT * FROM CTE
WHERE views < 4;


--Write a query to find tracks where the liveness score is above the average.


SELECT * FROM spotify;

SELECT artist,
       track,
	   liveness
FROM spotify
WHERE liveness > (
                   SELECT AVG(liveness)
                   FROM spotify
				  );



--Use a WITH clause to calculate the difference between the highest and lowest energy values for tracks in each album.

SELECT * FROM spotify;


SELECT track,
       album,
	   energy,
	   DENSE_RANK() OVER (PARTITION BY album ORDER BY energy DESC) as rank
FROM spotify
ORDER BY 2,3 DESC;



WITH cte
AS(
	SELECT album,		  
		   MAX(energy) as highest_energy,
		   MIN(energy) as lowest_energy		   
	FROM spotify
	GROUP BY 1
)

SELECT album,
       (highest_energy - lowest_energy) as difference
FROM cte;	   



--Find tracks where the energy-to-liveness ratio is greater than 1.2.

SELECT * FROM spotify;


SELECT track,
       energy,
	   liveness
	   
FROM spotify;	   

SELECT track,
       energy,
       liveness,
       (energy / NULLIF(liveness, 0)) AS energy_liveness_ratio
FROM spotify
WHERE (energy / NULLIF(liveness, 0)) > 1.2;


--Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.


SELECT track,
       likes,
	   views,
	   SUM(likes) OVER (ORDER BY views DESC)
FROM spotify;



SELECT track,
       views,
       likes,
       SUM(likes) OVER (ORDER BY views DESC) AS cumulative_likes
FROM spotify
ORDER BY views DESC;



--Find the top 5 artists with the highest total streams across all their tracks.

SELECT * FROM spotify;


SELECT artist,
       SUM(stream)
FROM spotify
GROUP BY 1
ORDER BY 2 DESC
LIMIT 5;


--Find the most liked track for each artist and include its total likes, ordered alphabetically by artist.

WITH cte
AS(
SELECT artist,
       track,
	   likes,
	   DENSE_RANK() OVER (PARTITION BY artist ORDER BY likes DESC) as rank
FROM spotify
ORDER BY 1 DESC
)

SELECT track,
       artist,
	   likes
FROM cte
WHERE rank = 1;











