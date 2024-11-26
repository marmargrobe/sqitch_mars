-- Revert sqitch_mars:create-rawstd-insta-download-saved-reels-details from pg

BEGIN;

DROP TABLE IF EXISTS rawstd.insta_download_saved_reels_details;

COMMIT;
