-- Revert sqitch_mars:rawstd-download-reels-nulls-not-distinct from pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_reels
DROP CONSTRAINT unique_columns_ridsr,
ADD CONSTRAINT unique_columns_ridsr UNIQUE (collection_name, reel_url, insta_account);

COMMIT;
