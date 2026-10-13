-- Revert sqitch_mars:clean-watch-read from pg

BEGIN;

DROP TABLE clean.watch_read_choices;
DROP TABLE clean.watch_read_titles;

COMMIT;
