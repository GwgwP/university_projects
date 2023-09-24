-- 3o Erwtima
select person_id
from movie_cast as mc
group by mc.person_id
having (count (distinct (mc.name, mc.gender))>1)
/*
 *      Leitourgia erwtimatos:
 *              Omadopoihsh twn pleiadwn me basi to person_id
 *              elegxos gia kathe person_id (mesw tou having) ean yparxoun 2 i perissoteroi syndiasmoi
 *              diaforetikoi twn idiothtwn name kai gender. Ean to plithos twn diaforetikwn syndiasmwn
 *              einai megalytero tou 1 tote epistrefei to person_id
 *
*/
--4o Erwtima
select person_id
from movie_crew as mc
group by mc.person_id
having (count (distinct (mc.name, mc.gender))>1)
/*
 *      Leitourgia erwtimatos:
 *              Omadopoihsh twn pleiadwn me basi to person_id
 *              elegxos gia kathe person_id (mesw tou having) ean yparxoun 2 i perissoteroi syndiasmoi
 *              diaforetikoi twn idiothtwn name kai gender. Ean to plithos twn diaforetikwn syndiasmwn
 *              einai megalytero tou 1 tote epistrefei to person_id
 *
*/
/*              Genika to person_id->{name,gender} einai o symbolismos ths synarthsiakhs ejarthshs kai shmainei oti
 *              oti gia ka8e person_id exoume mia antistoixia mono antistoixia-syndiasmo 
 *              me {name,gender},kai shmasiologika shmainei oti ena atomo exei ena monadiko onoma kai gender
*/