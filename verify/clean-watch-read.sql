-- Verify sqitch_mars:clean-watch-read on pg

BEGIN;

SELECT id, code, title, found_by, kind, matched_title, year, genres, rating, imdb_id, is_primary
FROM clean.watch_read_titles WHERE FALSE;
SELECT item_key, watched, hidden FROM clean.watch_read_choices WHERE FALSE;

ROLLBACK;
