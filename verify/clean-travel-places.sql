-- Verify sqitch_mars:clean-travel-places on pg

BEGIN;

SELECT query, country_codes, found, result FROM clean.geocode_cache WHERE FALSE;
SELECT id, code, name, source, rank, lat, lng, place_type, is_primary, on_map FROM clean.travel_places WHERE FALSE;

ROLLBACK;
