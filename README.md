# Spotify-Data_Analysis-SQL


![Spotify Logo](https://github.com/najirh/najirh-Spotify-Data-Analysis-using-SQL/blob/main/spotify_logo.jpg)

## Project Overview
This project involves analyzing a Spotify dataset with various attributes about tracks, albums, and artists using SQL. The key focus areas are:

1.Normalizing a denormalized dataset.
2.Writing SQL queries of varying complexity (easy, medium, and advanced).
3.Optimizing query performance to derive valuable insights.

The primary goals of the project are to practice advanced SQL skills and generate actionable insights from the dataset.


###Dataset Structure

The dataset includes the following attributes:
- artist: The performer of the track.
- track: The name of the song.
- album: The album to which the track belongs.
- album_type: The type of album (e.g., single or album).
- danceability, energy, loudness, speechiness, acousticness, instrumentalness, liveness, valence, tempo: Various metrics related to the audio features of the track.
- duration_min: Duration of the track in minutes.
- title, channel, views, likes, comments: YouTube-related data for the track.
- licensed: Indicates if the track is licensed.
- official_video: Indicates if the track has an official video.
- stream: Number of streams on Spotify.
- energy_liveness: Calculated metric combining energy and liveness.
- most_played_on: Indicates the platform where the track is most played.


```sql
-- create table
DROP TABLE IF EXISTS spotify;
CREATE TABLE spotify (
    artist VARCHAR(255),
    track VARCHAR(255),
    album VARCHAR(255),
    album_type VARCHAR(50),
    danceability FLOAT,
    energy FLOAT,
    loudness FLOAT,
    speechiness FLOAT,
    acousticness FLOAT,
    instrumentalness FLOAT,
    liveness FLOAT,
    valence FLOAT,
    tempo FLOAT,
    duration_min FLOAT,
    title VARCHAR(255),
    channel VARCHAR(255),
    views FLOAT,
    likes BIGINT,
    comments BIGINT,
    licensed BOOLEAN,
    official_video BOOLEAN,
    stream BIGINT,
    energy_liveness FLOAT,
    most_played_on VARCHAR(50)
);
```
## Project Steps

### 1. Data Exploration
Before writing SQL queries, the dataset was thoroughly analyzed to understand the structure, relationships, and potential insights. Key observations were made regarding:

- `Artist`: The performer of the track.
- `Track`: The name of the song.
- `Album`: The album to which the track belongs.
- `Album_type`: The type of album (e.g., single or album).
- Various metrics such as `danceability`, `energy`, `loudness`, `tempo`, and more.

---

### 2. Querying the Data
After the data is inserted, various SQL queries can be written to explore and analyze the data. Queries are categorized into **easy**, **medium**, and **advanced** levels to help progressively develop SQL proficiency.

#### Easy Queries
- Simple data retrieval, filtering, and basic aggregations.
  
#### Medium Queries
- More complex queries involving grouping, aggregation functions, and joins.
  
#### Advanced Queries
- Nested subqueries, window functions, CTEs, and performance optimization.

---

### 3. Query Optimization
In advanced stages, the focus shifts to improving query performance. Some optimization strategies include:
- **Indexing**: Adding indexes on frequently queried columns.
- **Query Execution Plan**: Using `EXPLAIN ANALYZE` to review and refine query performance.
  
---

## 4. Business problems

### Easy Level
1. Retrieve the names of all tracks that have more than 1 billion streams.
2. List all albums along with their respective artists.
3. Get the total number of comments for tracks where `licensed = TRUE`.
4. Find all tracks that belong to the album type `single`.
5. Count the total number of tracks by each artist.

### Medium Level
1. Calculate the average danceability of tracks in each album.
2. Find the top 5 tracks with the highest energy values.
3. List all tracks along with their views and likes where `official_video = TRUE`.
4. For each album, calculate the total views of all associated tracks.
5. Retrieve the track names that have been streamed on Spotify more than YouTube.

### Advanced Level
1. Find the top 3 most-viewed tracks for each artist using window functions.
2. Write a query to find tracks where the liveness score is above the average.
3. **Use a `WITH` clause to calculate the difference between the highest and lowest energy values for tracks in each album.**   
4. Find tracks where the energy-to-liveness ratio is greater than 1.2.
5. Calculate the cumulative sum of likes for tracks ordered by the number of views, using window functions.

---

## 5. Insights Generated

1. Identified top-performing tracks by streams, views, and likes.
2. Highlighted relationships between audio features (e.g., energy and liveness).
3. Determined platform-specific engagement patterns.
4. Derived album and artist-specific performance metrics.


---

## 6. Technology Stack
- **Database**: PostgreSQL
- **SQL Queries**: DDL, DML, Aggregations, Joins, Subqueries, Window Functions
- **Tools**: pgAdmin 4 

---

## 7. Conclusion

This project provided hands-on experience with advanced SQL concepts and query optimization techniques. It also highlighted the importance of database design and performance tuning in real-world data analysis.

---


