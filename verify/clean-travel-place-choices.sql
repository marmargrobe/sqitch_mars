-- Verify sqitch_mars:clean-travel-place-choices on pg

BEGIN;

SELECT code, chosen_name, chosen_source, place_type, hidden, note, updated_at
FROM clean.travel_place_choices WHERE FALSE;

ROLLBACK;
