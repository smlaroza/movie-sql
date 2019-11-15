--Question 1
SELECT id, title, genres
FROM movies; 
--Question 2
SELECT title, id
FROM movies
LIMIT 10;
--Question 3
SELECT title
FROM movies
WHERE id = 485;
--Question 4
SELECT id
FROM movies
WHERE title LIKE "%Made In America%";
--Question 5
SELECT title
FROM movies
ORDER BY IF(title RLIKE '^[a-z]', 1, 2), title;
LIMIT 10
--Question 6
SELECT title 
FROM movies
WHERE title LIKE "%(2002)%";
--Question 7
SELECT title
FROM movies
WHERE title LIKE "%Godfather%";
LIMIT 1
--Question 8
SELECT title, genres
FROM movies
WHERE genres LIKE "%Comedy%";
--Question 9
SELECT title, genres
FROM movies
WHERE genres LIKE "%Comedy%" AND title LIKE "%(2000)%";
--Question 10
SELECT title, genres
FROM movies
WHERE title LIKE "%Death%" AND genres LIKE "%Comedy%";
--Question 11
SELECT title 
FROM movies
WHERE title LIKE "%Super%" AND title LIKE "%(2001)%" OR "%(2002)%";
--Question 12



--Question 13
INSERT INTO actors(name, character_name, moviesId, date_of_birth)
VALUES 
	("Drew Barrymore", "Lucy Whitmore", 1, "1975-02-22"),
    ("Angelina Jolie", "Maleficent", 2, "1975-06-04"),
    ("Jennifer Aniston", "Brooke Meyers", 3, "1969-11-02"),
    ("Natalie Portman", "Novalee Nation", 4, "1981-09-06"),
    ("Mila Kunis", "Jamie Rellis", 5, "1983-12-08"),
    ("Emma Stone", "Skeeter Phelan", 6, "1988-06-11"),
    ("Emma Watson", "Hermione Granger", 7, "1990-07-04"),
    ("Jennifer Lawrence", "Katniss Everdeen", 8, "1990-07-15"),
    ("Anne Hathaway", "Mia Thermopolis", 9, "1982-11-12"),
    ("Margot Robbie","Naomi Lapaglia", 10, "1990-07-02");
--Question 14
ALTER TABLE movies 
ADD MPAA_rating varchar(100) not null;

UPDATE movie.movies
SET MPAA_rating = "3.0"
WHERE id=3 or id=4 or id=5 or id=6 or id=7;
--Question 15
SELECT m.title, r.rating
FROM movies m 
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.title LIKE "%Godfather%";
--Question 16
SELECT m.title, r.rating
FROM movies m 
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.title LIKE "%Godfather%"
ORDER BY r.timestamp DESC;
--Question 17
SELECT title, imdb_Id
FROM movies m 
LEFT JOIN links ON links.movie_Id = m.id
WHERE title LIKE "%(2005)%" AND genres LIKE "%Comedy%"
--Question 18
SELECT title, rating
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE rating = null;

--Question 19
SELECT Avg(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 10;
--Question 20
SELECT COUNT(rating)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 15;
--Question 21
SELECT COUNT(genres)
FROM movies m
LEFT JOIN ratings r ON r.movie_id = m.id
WHERE m.id = 7;
--Question 22
SELECT COUNT(title)
FROM movies m
WHERE genres LIKE "%Romance%";
--Question 23
SELECT Avg(rating)
FROM movies m 
LEFT JOIN ratings r ON r.user_id = m.id
WHERE r.user_id = 8;
--Question 24
SELECT MAX(rating)
FROM movies m
LEFT JOIN ratings r ON r.user_id = m.id;
--Question 25
SELECT Avg(rating) h, user_id
FROM ratings
GROUP BY user_id
ORDER BY h DESC
LIMIT 1;
--Question 26
SELECT Avg(rating) h, user_id, COUNT(rating) r
FROM ratings
GROUP BY user_id
HAVING r > 50
ORDER BY h DESC
LIMIT 1
--Question 27