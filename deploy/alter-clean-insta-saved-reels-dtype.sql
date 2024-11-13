-- Deploy sqitch_mars:alter-clean-insta-saved-reels-dtype to pg

BEGIN;

ALTER TABLE clean.insta_saved_reels 
ALTER COLUMN video_url TYPE VARCHAR;

COMMIT;
