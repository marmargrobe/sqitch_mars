-- Verify sqitch_mars:rawstd-insta-saved-collections on pg

BEGIN;

SELECT id FROM rawstd.insta_saved_collections limit 1;

ROLLBACK;
