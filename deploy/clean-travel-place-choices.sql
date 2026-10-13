-- Deploy sqitch_mars:clean-travel-place-choices to pg
-- requires: clean-travel-places

BEGIN;

-- Corrections made in the app. travel_extract.py rebuilds clean.travel_places but never
-- touches this table; the app applies these choices on top.
CREATE TABLE clean.travel_place_choices (
    code VARCHAR(50) PRIMARY KEY,       -- clean.saved_posts.code
    chosen_name VARCHAR,                -- clean.travel_places.name to use as the post's place
    chosen_source VARCHAR(10),          -- with its source (pin / geotag / caption)
    place_type VARCHAR(20),             -- overrides the detected type
    hidden BOOLEAN NOT NULL DEFAULT FALSE,  -- not a place; leave it off the map
    note VARCHAR,
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

COMMIT;
