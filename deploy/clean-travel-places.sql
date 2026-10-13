-- Deploy sqitch_mars:clean-travel-places to pg
-- requires: clean-saved-posts-view

BEGIN;

-- Nominatim (OpenStreetMap) lookups, so each place name is only looked up once.
CREATE TABLE clean.geocode_cache (
    query VARCHAR NOT NULL,
    country_codes VARCHAR NOT NULL DEFAULT '',   -- comma-separated ISO codes the lookup was limited to
    found BOOLEAN NOT NULL,
    result JSONB,                                 -- raw Nominatim result
    looked_up_at TIMESTAMP NOT NULL DEFAULT now(),
    PRIMARY KEY (query, country_codes)
);

-- Every place found for a travel post. Rebuilt by src/data_cleaner/travel_extract.py.
-- source: pin (📍 in caption) | geotag (post location) | caption (place names spaCy finds)
CREATE TABLE clean.travel_places (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,          -- clean.saved_posts.code
    name VARCHAR NOT NULL,              -- the place as written in the post
    source VARCHAR(10) NOT NULL,
    rank SMALLINT NOT NULL,             -- lower = more trusted (pin 1, geotag 2, caption 3-4)
    lat DOUBLE PRECISION,
    lng DOUBLE PRECISION,
    matched_name VARCHAR,               -- what OpenStreetMap matched
    city VARCHAR,
    region VARCHAR,
    country VARCHAR,
    country_code VARCHAR(2),
    osm_class VARCHAR(30),
    osm_type VARCHAR(30),
    place_type VARCHAR(20),             -- café, restaurant, hike/trail, beach, landmark, ...
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,  -- best place for the post
    on_map BOOLEAN NOT NULL DEFAULT FALSE,      -- primary place, or one of several 📍 places
    extractor_version VARCHAR(10),
    extracted_at TIMESTAMP,
    UNIQUE (code, source, name)
);
CREATE INDEX travel_places_code_idx ON clean.travel_places (code);

COMMIT;
