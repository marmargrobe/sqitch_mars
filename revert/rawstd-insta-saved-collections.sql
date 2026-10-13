-- Revert sqitch_mars:rawstd-insta-saved-collections from pg

BEGIN;

DROP TABLE IF EXISTS rawstd.insta_saved_collections;

COMMIT;
