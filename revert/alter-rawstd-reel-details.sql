-- Revert sqitch_mars:alter-rawstd-reel-details from pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_reels_details
DROP COLUMN hashtags;

COMMIT;
