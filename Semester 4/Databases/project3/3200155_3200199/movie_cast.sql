ALTER TABLE movie_cast
ADD PRIMARY KEY (movie_id, cast_id, character, person_id);
-- edw to {movie_id,character,cast_id,person_id} einai ena yperkleidi kai to elaxisto ka8ws kai h 
-- synarthsiakh ejarthsh {movie_id,character,cast_id,person_id} -> {name,gender}
-- shmainei oti ena atomo tou casting (person_id,cast_id) einai charakthras (character) se mia tainia(movie_id)
-- kai einai ena sygkekrimeno atomo me onoma(name) kai person _id

-- parapanw orismata sto primary key den xreiazetai dioti tote den 8a einai elaxisto to kleidi
-- enw ligotera orismata 8a dinoun diplotypa apotelesmata,ta opoia den synadoun me ton orismo 
-- kleidiou