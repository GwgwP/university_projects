
/********************************* Prwto erwtima ***********************************************/
/*
Bres moy tis tainies pou exoun panw apo apo 150 an8rwpous sto cast & ta esoda uperbainoun 
ta 5.000.000€
Output: 13 rows
*/
SELECT movie.title
FROM movie
WHERE movie.id IN
(
    SELECT movie.id
    FROM movie_cast
    JOIN movie ON movie.id = movie_cast.movie_id 
    JOIN person ON movie_cast.person_id = person.id
    GROUP BY movie.id
    HAVING (COUNT(DISTINCT person_id) > 150) AND movie.revenue > 50000000
)
/********************************* Deytero erwtima ***********************************************/
/*
Ektypwse ta onomata twn etairiwn paragwghs tainiwn, oi opoies eixan toulaxiston 9 tainies,
stis opoies symmeteixe enas toulaxiston andras ws melos tou crew kai tou cast
Output: 31 rows
*/
select productioncompany.name
from movie_productioncompanies
INNER JOIN productioncompany 
ON movie_productioncompanies.pc_id = productioncompany.id
WHERE movie_productioncompanies.movie_id IN
(--einai oi tainies pou estw enas andras einai meros tou cast kai tou crew
    select distinct(movie_cast.movie_id)
    from movie_cast, movie_crew, person
    where movie_cast.movie_id = movie_crew.movie_id
    and movie_cast.person_id = movie_crew.person_id
    and person.id = movie_cast.person_id and gender = 2
)
GROUP BY productioncompany.name
HAVING (COUNT(DISTINCT movie_productioncompanies.movie_id) >= 9)

/********************************* Trito erwtima ***********************************************/
/*
Emfanise ta onomata twn gunaikwn pou eixan estw kai mia
dramatikh tainia pou epaijan kai eixe kata meso oro ba8mologia apo tous xrhstes = 5
Output: 69 rows
*/
SELECT DISTINCT person.name
FROM person
JOIN movie_cast ON movie_cast.person_id = person.id
JOIN ratings ON ratings.movie_id = movie_cast.movie_id
WHERE person.gender = 1 
AND movie_cast.movie_id IN
(
    SELECT movie.id
    FROM movie
    JOIN ratings ON ratings.movie_id = movie.id
    GROUP BY movie.id
    HAVING (AVG(ratings.rating) = 5)
    INTERSECT
    SELECT movie.id
    FROM movie,movie_genres,genre
    WHERE genre.name = 'Drama' AND genre.id = movie_genres.genre_id 
    AND movie_genres.movie_id = movie.id
)