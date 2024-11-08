-- Deploy sqitch_mars:alter-rawstd-insta-saved-reels-dtype to pg

BEGIN;

ALTER TABLE rawstd.insta_saved_reels 
ALTER COLUMN video_url TYPE VARCHAR;

COMMIT;
