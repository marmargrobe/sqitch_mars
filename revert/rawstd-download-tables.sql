-- Revert sqitch_mars:rawstd-download-tables from pg

BEGIN;

DROP TABLE IF EXISTS rawstd.insta_download_saved_collections;

DROP TABLE IF EXISTS rawstd.insta_download_saved_reels;
COMMIT;
