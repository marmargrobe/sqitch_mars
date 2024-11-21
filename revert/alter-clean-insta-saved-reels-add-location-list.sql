-- Revert sqitch_mars:alter-clean-insta-saved-reels-add-location-list from pg

BEGIN;

ALTER TABLE clean.insta_saved_reels
DROP IF EXISTS locations_from_caption;

COMMIT;