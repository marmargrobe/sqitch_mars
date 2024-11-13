-- Revert sqitch_mars:alter-clean-insta-saved-reels-dtype from pg

BEGIN;

ALTER TABLE clean.insta_saved_reels 
ALTER COLUMN video_url TYPE VARCHAR(100);

COMMIT;
