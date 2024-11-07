-- Revert sqitch_mars:rawstd-insta-saved-reels from pg

BEGIN;

DROP TABLE IF EXISTS rawstd.insta_saved_reels;

COMMIT;
