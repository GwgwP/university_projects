-- Gia to 4o erwtima

--Gia tin dimioyrgia twn newn pinakwn exoume:
create table Person(
   id int,
   gender int,
   name varchar(40)
   primary key (id)
);
create table Actor(
   person_id int,
   primary key (person_id),
   FOREIGN KEY (person_id) REFERENCES Person(id)
);
create table CrewMember(
   person_id int,
   primary key (person_id),
   FOREIGN KEY (person_id) REFERENCES Person(id)
);

--Gia to 5o erwtima exoume tis eksis erwtiseis:
select distinct mc.person_id
from movie_cast as mc
inner join movie_crew as mr on mr.person_id = mc.person_id
where mc.name <> mr.name OR mc.gender <> mr.gender
-- kanontas inner join tous pinakes movie_cast kai movie_crew, ws pros to person_id tous, vriskoume osous
-- exoun diaforetiko name gia to idio person_id kai emfanizoume to 

--Vrikame oti o peter malota exei diaforetiko gender, opote kanoume update to gender tou se 2 (afoy einai andras)
UPDATE movie_cast
SET gender = 2
WHERE name = 'Peter Malota';

UPDATE movie_crew
set gender = 2
WHERE name = 'Peter Malota'; 

--Gia to 6o erwtima
INSERT INTO Person (id, gender, name)
select mc.person_id, mc.gender, mc.name 
from movie_cast as mc
union
select mr.person_id, mr.gender, mr.name 
from movie_crew as mr

INSERT INTO crewmember (person_id)
SELECT distinct(person_id)
FROM movie_crew

INSERT INTO actor (person_id)
SELECT distinct(person_id)
FROM movie_cast

--gia to 7o erwtima
--prwta dhmiourgoume antigrafa
create table Movie_Crew2 as
table movie_crew

create table Movie_Cast2 as
table movie_cast

--prosthetwntas tous periorismous...
ALTER TABLE movie_crew2
ADD PRIMARY KEY (movie_id, person_id, job);
ALTER TABLE movie_crew2
ADD FOREIGN KEY (movie_id) REFERENCES movie(id);

ALTER TABLE movie_cast2
ADD PRIMARY KEY (movie_id, cast_id, character, person_id);
ALTER TABLE movie_cast2
ADD FOREIGN KEY (movie_id) REFERENCES movie(id);
--until here...

ALTER TABLE movie_cast
DROP COLUMN gender,
DROP COLUMN name;

ALTER TABLE movie_crew
DROP COLUMN gender,
DROP COLUMN name;

ALTER TABLE movie_crew
ADD FOREIGN KEY (person_id) REFERENCES crewmember(person_id);

ALTER TABLE movie_cast
ADD FOREIGN KEY (person_id) REFERENCES actor(person_id);
