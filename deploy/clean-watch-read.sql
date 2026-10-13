-- Deploy sqitch_mars:clean-watch-read to pg
-- requires: clean-saved-posts-view
-- requires: reference-imdb-titles

BEGIN;

-- One row per title found in a Watch / read post. Rebuilt by src/data_cleaner/watch_read_extract.py.
CREATE TABLE clean.watch_read_titles (
    id SERIAL PRIMARY KEY,
    code VARCHAR(50) NOT NULL,          -- clean.saved_posts.code
    title VARCHAR NOT NULL,             -- as written in the caption, e.g. 'MIRROR'
    found_by VARCHAR(20) NOT NULL,      -- title_year | quoted | emoji | caps | spacy | reading
    kind VARCHAR(10),                   -- movie | series | book
    matched_title VARCHAR,              -- e.g. 'Mirror' (IMDb / Open Library)
    year SMALLINT,
    genres TEXT[] NOT NULL DEFAULT '{}',
    rating NUMERIC(3,1),                -- IMDb average rating
    votes INTEGER,
    runtime_minutes INTEGER,
    imdb_id VARCHAR(12),                -- reference.imdb_titles.tconst
    openlibrary_key VARCHAR,            -- e.g. /works/OL17930368W
    author VARCHAR,                     -- books
    is_primary BOOLEAN NOT NULL DEFAULT FALSE,  -- the post's main title
    extractor_version VARCHAR(10),
    extracted_at TIMESTAMP,
    UNIQUE (code, title)
);
CREATE INDEX watch_read_titles_code_idx ON clean.watch_read_titles (code);

-- My own list. Extraction never touches it.
CREATE TABLE clean.watch_read_choices (
    item_key VARCHAR PRIMARY KEY,       -- imdb_id, or 'book:<openlibrary key or title>'
    watched BOOLEAN NOT NULL DEFAULT FALSE,
    hidden BOOLEAN NOT NULL DEFAULT FALSE,  -- not interested
    updated_at TIMESTAMP NOT NULL DEFAULT now()
);

COMMIT;
