ALTER TABLE movie_crew
ADD PRIMARY KEY (movie_id, person_id, job);

-- efoson to person_id kathorizei synartisiaka to name kai to gender, 
-- kai to person_id anikei sto primary key
-- den xreiazetai na mpei to name kai to gender
-- sto primary_key. Ws pros to department, me dedomeni mia tainia,
-- ena atomo kai mia douleia, den mporoume na exoume diaforetika departments
-- opote den xreiazetai na mpei sto primary key.

--Me merika parapanw logia,
-- ->To {person_id,movie_id,job} einai ena yperkleidi 
-- ->kai epeidh einai to elaxisto synolo yperkleidiou 
-- ->8ewreite ej orismou kai kleidi 

-- H shmasia autou tou kleidiou einai h ejhs:
-- Ena atomo (person_id) pou symmetexei sto crew mias tainias
-- (movie_id) se mia douleia (job), sigoura 8a exei ena monadiko gender 
-- kai ena monadiko department sto opoio 8a douleuei

-- Oso gia thn epalh8eush tou,to query 
-- 
   SELECT movie_id,person_id,job
   FROM movie_crew as mc
   GROUP BY (movie_id,person_id,job)
   HAVING (COUNT(DISTINCT(department,job,gender))>1);
  
-- epalh8euei to apotelesma me eksodo 0 rows