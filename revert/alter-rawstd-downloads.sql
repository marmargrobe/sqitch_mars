-- Revert sqitch_mars:alter-rawstd-downloads from pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_collections
DROP IF EXISTS insta_account VARCHAR;

ALTER TABLE rawstd.insta_download_saved_reels
DROP IF EXISTS insta_account VARCHAR;

COMMIT;
