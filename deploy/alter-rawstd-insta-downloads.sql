-- Deploy sqitch_mars:alter-rawstd-insta-downloads to pg

BEGIN;

ALTER TABLE rawstd.insta_download_saved_collections
ADD CONSTRAINT unique_columns_ridsc UNIQUE (collection_name, insta_account, creation_time),
ADD COLUMN python_script VARCHAR,
ADD COLUMN python_runtime TIMESTAMP;

ALTER TABLE rawstd.insta_download_saved_reels
ADD CONSTRAINT unique_columns_ridsr UNIQUE (collection_name, reel_url, insta_account),
ADD COLUMN python_script VARCHAR,
ADD COLUMN python_runtime TIMESTAMP;

COMMIT;
