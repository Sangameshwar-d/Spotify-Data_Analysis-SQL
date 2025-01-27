
DROP TABLE spotify;
CREATE TABLE spotify(

                     Artist VARCHAR(55),
					 Track VARCHAR(300),
					 Album	VARCHAR(300),
					 Album_type VARCHAR(20),
					 Danceability FLOAT,
					 Energy FLOAT,
					 Loudness FLOAT,
					 Speechiness FLOAT,
					 Acousticness FLOAT,
					 Instrumentalness FLOAT,
					 Liveness FLOAT,
					 Valence FLOAT,
					 Tempo FLOAT,
					 Duration_min FLOAT,
					 Title  VARCHAR(200),
					 Channel VARCHAR(100),
					 Views BIGINT,			
					 Likes BIGINT,	
					 Comments BIGINT,	
					 Licensed VARCHAR(10),
					 official_video VARCHAR(10),
					 Stream BIGINT,
					 EnergyLiveness FLOAT,
					 most_playedon VARCHAR(15)

);