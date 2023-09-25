/*
->Bres mou ta onomata twn production companies opou oles oi tainies exoun budget > 100000000
(INNER JOIN)
->358 rows
*/

SELECT DISTINCT pc.name
FROM productioncompany as pc
WHERE pc.id IN (
    SELECT DISTINCT mpc.pc_id
    FROM movie_productioncompanies as mpc
	INNER JOIN movie as mo
    ON mpc.movie_id = mo.id 
    GROUP BY mpc.pc_id
    HAVING SUM(budget) > 100000000
);
/*****************************      1        *******************************/
/*
->Bres mou tis tainies tou Leonardo DiCaprio pou eixan average ba8mologia panw apo 1.5
(INNER JOIN)
->5 rows
*/
SELECT DISTINCT m.title 
FROM movie as m
INNER JOIN movie_cast as mc 
ON mc.movie_id = m.id
WHERE mc.name = 'Leonardo DiCaprio' AND m.id IN
(
	SELECT DISTINCT m.id
	FROM movie as m
	FULL OUTER JOIN ratings ON m.id = ratings.movie_id
	GROUP BY m.id
	HAVING AVG(ratings.rating) > 1.5
)
ORDER BY m.title 
LIMIT 5;

/*****************************      2        *******************************/
/*
->Emfanise ta movie kai to ka8e collection tou, 
pou eixan xarakthristiko tin sxesi an8rwpou - zwou ,esoda panw apo 5000000 kai perieixan peripeteia
(INNER JOIN)
->4 rows
*/

SELECT m.title,c.name
FROM movie as m,movie_collection as mc,collection as c
WHERE m.id = mc.movie_id AND c.id = mc.collection_id AND m.revenue > 5000000 AND m.id IN
(
	SELECT DISTINCT m.id
	FROM movie as m,keyword as k,movie_keywords as mk
	WHERE m.id = mk.movie_id AND k.id = mk.keyword_id AND k.name = 'human animal relationship'
	INTERSECT
	SELECT m.id
	FROM movie as m 
	WHERE m.id IN
	(
		SELECT DISTINCT mg.movie_id
		FROM movie_genres as mg
		INNER JOIN genre as g
		ON g.id = mg.genre_id
		WHERE g.name IN ('Adventure')
	)
);
/*****************************      3        *******************************/
/*
->Bres to plh8os twn tainiwn eixan meso oro kritikwn panw apo 2.0  4.0 kai htan tupou adventure
(INNER JOIN)
->1 row
*/

SELECT COUNT(*)
FROM movie as m,genre as g,movie_genres as mg
WHERE m.id = mg.movie_id AND mg.genre_id = g.id AND g.name = 'Adventure' 
AND m.id IN
(
    SELECT DISTINCT m.id
    FROM movie as m
    INNER JOIN ratings as r
    ON m.id = r.movie_id 
    GROUP BY m.id
    HAVING AVG(r.rating) BETWEEN 2.0 AND 4.0 
);
/*****************************      4        *******************************/

/*
->Bres mou tous h8opoious pou ka8e tainia tous exei meso oro anamesa se 2.0 kai 4.0
2*(INNER JOIN)
->19634 rows
*/
SELECT DISTINCT mc.name
FROM movie as m
INNER JOIN 
movie_cast as mc
ON mc.movie_id = m.id
WHERE m.id IN 
(
	SELECT m.id
	FROM movie as m
	INNER JOIN ratings as r
	ON r.movie_id = m.id 
	GROUP BY m.id	
	HAVING AVG(r.rating) BETWEEN 2.0 AND 4.0
);
/*****************************      5        *******************************/
/*
->Emfanise mou olous tous andres h8opoious pou epaijan se tainies tou James Bond  
(periexei full outer join)

->238 rows
*/
SELECT DISTINCT mc.name
FROM movie_cast as mc
WHERE mc.gender = 2 AND mc.movie_id IN
(
    SELECT DISTINCT movie_id
    FROM movie_collection as mc
    FULL OUTER JOIN collection as c
    ON mc.collection_id = c.id
    WHERE name = 'James Bond Collection'
);
/*****************************      6        *******************************/
/*
->Emfanise gia ka8e tainia pou paixthke meta to 2005,to kalutero kai xeirotero kai to average rating pou elabe xronologika diatetagmenes
(INNER JOIN)
->11 rows
*/

SELECT m.title,MIN(r.rating) as Minimum_Rating,MAX(r.rating) as Maximum_Rating,AVG(r.rating) as Average_Rating
FROM movie as m
INNER JOIN ratings as r
ON m.id = r.movie_id 
WHERE m.id IN 
(
    SELECT m.id
    FROM movie as m
    WHERE m.release_date > '01/01/2005'
)
GROUP BY m.id, m.title
ORDER BY m.release_date;
/*****************************      7        *******************************/
/*
->Bres mou ton titlo,ta esoda tis tainias kai to plh8os twn an8rwpwn 
sto crew pou na htan parapanw apo 5 atoma kai katw apo 20 
kai to tagline tous na perieixe 
Money or money( periexei full outer join)

->18 rows
*/

SELECT m.title,m.revenue as Revenue_Of_The_Movie,COUNT(mc.person_id) as Number_of_People_In_the_Crew
FROM movie as m
FULL OUTER JOIN movie_crew as mc
ON mc.movie_id = m.id
WHERE m.id IN
(
	SELECT m.id
	FROM movie as m
	WHERE m.tagline LIKE '%Money%' OR  m.tagline LIKE '%money%'
)
GROUP BY m.id
HAVING COUNT(mc.person_id) BETWEEN 5 AND 20
/*****************************      8        *******************************/
/*
->Gia ka8e eidos tainias emfanise thn tainia me ta megalutera esoda ths,ton titlo ths tainias pou to katafere auto

->9 rows
*/

SELECT g.name,m.title as Most_Profitable_Movie,m.revenue as Maximum_Revenue
FROM genre as g,movie_genres as mg,movie as m
WHERE mg.genre_id = g.id AND mg.movie_id = m.id
AND (g.name,m.revenue) IN 
(
	SELECT g.name,MAX(m.revenue)
	FROM genre as g,movie_genres as mg,movie as m
	WHERE mg.genre_id = g.id AND mg.movie_id = m.id 
	GROUP BY g.name
)
/*****************************      9        *******************************/
/*
->Bres tis paragwges pou eftiajan tainies thn teleutaia dekaetia (2010-2020)
ka8ws kai to plh8os twn h8opoiwn gia ka8e paragwgh pou epaijan 
stis parapanw tainies

->7 rows
*/

SELECT pc.name,COUNT(ca.person_id) as Number_Of_Actors_In_The_Production_Company
FROM movie as m,movie_productioncompanies as mpc,productioncompany as pc,movie_cast as ca
WHERE mpc.pc_id = pc.id AND mpc.movie_id = m.id AND m.id = ca.movie_id AND pc.name IN
(
	SELECT DISTINCT pc.name
	FROM movie as m,movie_productioncompanies as mpc,productioncompany as pc
	WHERE m.release_date > '01/01/2010' AND mpc.pc_id = pc.id AND mpc.movie_id = m.id
	GROUP BY pc.name
)
GROUP BY pc.name 
/*****************************      10        *******************************/
/*
->Bres tis paragwges pou eftiaksan apo 10 ews 30 tainies metaksi 1990 kai toy 2010 
kai mazi me tis paragwges emfanise to profit,kai ton ari8mo tainiwn 

->105 rows
*/
SELECT pc.name,COUNT(m.id) as Number_of_Movies_Between_1990_and_2010,SUM(m.revenue) - Sum(m.budget) as Total_Profit
FROM productioncompany as pc,movie_productioncompanies as mpc,movie as m
WHERE mpc.pc_id = pc.id AND mpc.movie_id = m.id AND mpc.movie_id IN
(
	SELECT m.id
	FROM movie as m
	WHERE m.release_date > '01/01/1990' AND  m.release_date < '01/01/2010'
)
GROUP BY pc.name 
HAVING COUNT(m.id) BETWEEN 10 and 30 
/*****************************      11       *******************************/
/*
->Bres mou tis paragwges pou eixan estw se mia dramatikh tainia & average rating panw apo 2.5 
kai emfanise to average budget gia tis parapanw tainies ka8e paragwghs
2*(INNER JOIN)
->1044 rows
*/

SELECT DISTINCT p.name,AVG(m.budget)
FROM movie as m,movie_productioncompanies as mc,productioncompany as p 
WHERE m.id = mc.movie_id AND mc.pc_id = p.id AND mc.movie_id IN
(
	SELECT m.id
	FROM movie as m,ratings as r,movie_genres as mg,genre as g
	WHERE m.id = r.movie_id AND m.id = mg.movie_id AND g.id = mg.genre_id AND g.name = 'Drama'
	GROUP BY m.id
	HAVING AVG(r.rating) > 2.5
)
GROUP BY p.name
/*****************************      12       *******************************/
/* 
->Emfanise mou tis tainies pou exei skinothetisei to Quentin Tarantino 
(INNER JOIN)
->6 rows
*/
SELECT title
FROM movie
INNER JOIN movie_crew
ON movie.id = movie_crew.movie_id
WHERE movie_crew.name = 'Quentin Tarantino' AND movie_crew.job = 'Director'
/*****************************      13       *******************************/