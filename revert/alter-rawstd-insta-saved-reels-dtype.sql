-- Revert sqitch_mars:alter-rawstd-insta-saved-reels-dtype from pg

BEGIN;

ALTER TABLE rawstd.insta_saved_reels 
ALTER COLUMN video_url TYPE VARCHAR(100);

COMMIT;
