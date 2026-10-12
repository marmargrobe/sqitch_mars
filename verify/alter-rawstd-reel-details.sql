-- Verify sqitch_mars:alter-rawstd-reel-details on pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_reels_details
ADD hashtags VARCHAR[];

ROLLBACK;
