-- Revert sqitch_mars:clean-travel-place-choices from pg

BEGIN;

DROP TABLE clean.travel_place_choices;

COMMIT;
