--1o erwthma -> 97 rows
SELECT EXTRACT(YEAR FROM release_date) as Year, COUNT(id) as Number_of_Movies 
FROM movie 
WHERE EXTRACT(YEAR FROM release_date) IS NOT Null 
GROUP BY EXTRACT(YEAR FROM release_date)  
ORDER BY EXTRACT(YEAR FROM release_date);

--2o erwthma -> 9 rows
SELECT g.name, COUNT(g.id)
FROM movie_genres as mg,genre as g 
WHERE g.id = mg.genre_id GROUP BY g.name;

--3o erwthma -> 674 rows
SELECT g.name, EXTRACT(YEAR FROM release_date), COUNT(g.id)
FROM movie_genres as mg,genre as g,movie as m
WHERE g.id = mg.genre_id AND m.id = mg.movie_id AND EXTRACT(YEAR FROM release_date) IS NOT NULL
GROUP BY g.name,EXTRACT(YEAR FROM release_date);

--4o erwthma -> 97 rows
SELECT MAX(m.budget) as Maximum_Budget_of_the_Year, EXTRACT(YEAR FROM release_date) AS Year
FROM movie as m
WHERE EXTRACT(YEAR FROM release_date) IS NOT Null
GROUP BY EXTRACT(YEAR FROM release_date);

-- 5o erwthma -> 11 rows
SELECT SUM(movie.revenue) as revenue,EXTRACT(YEAR FROM release_date)as year
FROM person,movie,movie_cast,actor
WHERE person.name = 'George Clooney' AND movie_cast.person_id = person.id AND person.id = actor.person_id AND movie.id = movie_cast.movie_id
GROUP BY EXTRACT(YEAR FROM release_date)
ORDER BY EXTRACT(YEAR FROM release_date);

--6o erwthma -> 671 rows
SELECT user_id ,AVG(rating)
FROM ratings
GROUP BY user_id
Order By user_id;

--7o erwthma -> 671 rows
SELECT COUNT(rating),ratings.user_id
FROM ratings
GROUP BY user_id
ORDER BY user_id;

--8o erwthma -> 671 rows
SELECT COUNT(rating),AVG(ratings.rating),ratings.user_id
FROM ratings
GROUP BY user_id
ORDER BY user_id;

--9o erwthma -> 9 rows
SELECT AVG(rating),genre.name
FROM genre,ratings,movie_genres
WHERE genre.id = movie_genres.genre_id AND movie_genres.movie_id = ratings.movie_id
GROUP BY genre.id;