-- Revert sqitch_mars:alter-rawstd-insta-downloads from pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_collections
DROP CONSTRAINT unique_columns_ridsc,
DROP COLUMN python_script,
DROP COLUMN python_runtime;

ALTER TABLE rawstd.insta_download_saved_reels
DROP CONSTRAINT unique_columns_ridsr,
DROP COLUMN python_script, 
DROP COLUMN python_runtime;
COMMIT;
