-- Verify sqitch_mars:alter-clean-insta-saved-reels-add-location-list on pg

BEGIN;

ALTER TABLE clean.insta_saved_reels
ADD locations_from_caption VARCHAR[];

ROLLBACK;
