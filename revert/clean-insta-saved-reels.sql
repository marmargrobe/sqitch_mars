-- Revert sqitch_mars:clean-insta-saved-reels from pg

BEGIN;

DROP TABLE IF EXISTS clean.insta_saved_collections;

DROP TABLE IF EXISTS clean.insta_user;

DROP TABLE IF EXISTS clean.insta_usertags;

COMMIT;
