-- Revert sqitch_mars:clean-saved-posts-view from pg

BEGIN;

DROP VIEW clean.saved_posts;

COMMIT;
