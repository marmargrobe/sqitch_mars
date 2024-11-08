-- Revert sqitch_mars:drop-fk-constraint-rawstd-insta-saved-reels from pg

BEGIN;

ALTER TABLE rawstd.insta_saved_reels
ADD CONSTRAINT insta_saved_reels_pk_fkey 
FOREIGN KEY (pk) REFERENCES rawstd.insta_saved_collections(id);

COMMIT;
