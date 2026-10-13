-- Revert sqitch_mars:reference-imdb-titles from pg

BEGIN;

DROP TABLE reference.imdb_titles;
DROP SCHEMA reference;

COMMIT;
