-- Verify sqitch_mars:reference-imdb-titles on pg

BEGIN;

SELECT tconst, title_type, primary_title, start_year, genres, average_rating, num_votes, title_key
FROM reference.imdb_titles WHERE FALSE;

ROLLBACK;
