-- Deploy sqitch_mars:rawstd-insta-saved-collections to pg

BEGIN;

CREATE TABLE rawstd.insta_saved_collections (
    id VARCHAR(50) PRIMARY KEY,
    "name" VARCHAR(50),
    media_count INTEGER,
    last_updated TIMESTAMP
);

COMMIT;
