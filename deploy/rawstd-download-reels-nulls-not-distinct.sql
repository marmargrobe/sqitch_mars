-- Deploy sqitch_mars:rawstd-download-reels-nulls-not-distinct to pg

BEGIN;

-- Saved posts outside a collection have collection_name NULL. By default NULLs never
-- conflict, so re-importing an export duplicated them. Requires Postgres 15+.
ALTER TABLE rawstd.insta_download_saved_reels
DROP CONSTRAINT unique_columns_ridsr,
ADD CONSTRAINT unique_columns_ridsr UNIQUE NULLS NOT DISTINCT (collection_name, reel_url, insta_account);

COMMIT;
