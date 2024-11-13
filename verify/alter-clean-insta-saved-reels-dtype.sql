-- Verify sqitch_mars:alter-clean-insta-saved-reels-dtype on pg

BEGIN;

ALTER TABLE rawstd.insta_saved_reels 
ALTER COLUMN video_url TYPE VARCHAR;

ROLLBACK;
