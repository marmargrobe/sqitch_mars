-- Deploy sqitch_mars:alter-clean-insta-saved-reels-add-location-list to pg

BEGIN;

ALTER TABLE clean.insta_saved_reels
ADD locations_from_caption VARCHAR[];

COMMIT;
