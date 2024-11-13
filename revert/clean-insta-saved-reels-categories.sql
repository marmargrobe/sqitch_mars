-- Revert sqitch_mars:clean-insta-saved-reels-categories from pg

BEGIN;

DROP TABLE IF EXISTS clean.insta_saved_reels_categories;

COMMIT;
