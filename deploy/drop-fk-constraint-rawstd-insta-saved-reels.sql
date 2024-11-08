-- Deploy sqitch_mars:drop-fk-constraint-rawstd-insta-saved-reels to pg

BEGIN;

ALTER TABLE rawstd.insta_saved_reels
DROP CONSTRAINT insta_saved_reels_pk_fkey;

COMMIT;
