CREATE DATABASE netflix;
USE netflix;
CREATE TABLE originals (
    Title VARCHAR(255),
    Genre VARCHAR(100),
    Premiere DATE,
    Runtime INT,
    IMDB_Score FLOAT
);
show tables;


SELECT * FROM originals LIMIT 10;

##Top 5 longest movies##
SELECT Title, Runtime 
FROM originals 
ORDER BY Runtime DESC 
LIMIT 5;

-- Movies with IMDB score above 6##
SELECT Title, IMDB_Score 
FROM originals 
WHERE IMDB_Score > 6;

 -- Average IMDB score by Genre##
 SELECT Genre, AVG(IMDB_Score) AS AvgScore
FROM originals
GROUP BY Genre;

-- Total runtime by genre##
SELECT Genre, SUM(Runtime) AS TotalRuntime
FROM originals
GROUP BY Genre;

-- Titles with score above genre average
SELECT Title, Genre, IMDB_Score
FROM originals o
WHERE IMDB_Score > (
    SELECT AVG(IMDB_Score)
    FROM originals i
    WHERE i.Genre = o.Genre
);

CREATE VIEW HighlyRated AS
SELECT Title, Genre, IMDB_Score
FROM originals
WHERE IMDB_Score >6;
SELECT * FROM HighRated;

-- JOINS
CREATE TABLE directors (
    DirectorID INT AUTO_INCREMENT PRIMARY KEY,
    Title VARCHAR(255),
    DirectorName VARCHAR(100)
);



select * from directors;

-- left join
SELECT o.Title, o.Genre, d.DirectorName
FROM originals o
LEFT JOIN directors d ON o.Title = d.Title;

-- right join
SELECT o.Title, o.Genre, d.DirectorName
FROM originals o
RIGHT JOIN directors d ON o.Title = d.Title;

-- inner join
SELECT o.Title, o.Genre, d.DirectorName
FROM originals o
INNER JOIN directors d ON o.Title = d.Title;














