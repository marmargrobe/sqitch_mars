-- Revert sqitch_mars:clean-travel-places from pg

BEGIN;

DROP TABLE clean.travel_places;
DROP TABLE clean.geocode_cache;

COMMIT;
