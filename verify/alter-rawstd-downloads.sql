-- Verify sqitch_mars:alter-rawstd-downloads on pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_collections
ADD insta_account VARCHAR;

ALTER TABLE rawstd.insta_download_saved_reels
ADD insta_account VARCHAR;
ROLLBACK;
