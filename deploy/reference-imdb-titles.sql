-- Deploy sqitch_mars:reference-imdb-titles to pg

BEGIN;

-- Lookup data from outside sources (not from Instagram).
CREATE SCHEMA IF NOT EXISTS reference;

-- Movies, TV series and mini-series from IMDb's non-commercial datasets
-- (https://datasets.imdbws.com, title.basics + title.ratings). Loaded by src/data_cleaner/imdb_load.py.
CREATE TABLE reference.imdb_titles (
    tconst VARCHAR(12) PRIMARY KEY,       -- IMDb id: imdb.com/title/<tconst>
    title_type VARCHAR(20) NOT NULL,      -- movie | tvSeries | tvMiniSeries | tvMovie
    primary_title VARCHAR NOT NULL,
    original_title VARCHAR,
    start_year SMALLINT,
    runtime_minutes INTEGER,
    genres TEXT[] NOT NULL DEFAULT '{}',
    average_rating NUMERIC(3,1),
    num_votes INTEGER,
    title_key VARCHAR NOT NULL,           -- normalized primary_title, for matching captions
    original_key VARCHAR                  -- normalized original_title
);
CREATE INDEX imdb_titles_title_key_idx ON reference.imdb_titles (title_key);
CREATE INDEX imdb_titles_original_key_idx ON reference.imdb_titles (original_key);

COMMIT;
