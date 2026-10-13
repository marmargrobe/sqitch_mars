-- Verify sqitch_mars:rawstd-insta-saved-collections on pg

BEGIN;

CREATE TABLE IF NOT EXISTS rawstd.insta_saved_collections (
    id VARCHAR(50) PRIMARY KEY,
    "name" VARCHAR(50),
    media_count INTEGER,
    last_updated TIMESTAMP
);

ROLLBACK;
