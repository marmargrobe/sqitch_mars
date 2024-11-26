-- Deploy sqitch_mars:rawstd-download-tables to pg

BEGIN;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE rawstd.insta_download_saved_reels (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID as primary key, auto-generated
    collection_name VARCHAR(50),  -- Instagram collection name
    user_name VARCHAR(100),  -- Full name of the user
    reel_url TEXT,  -- URL of the reel
    added_time TIMESTAMP  -- Date and time when the reel was added
);

CREATE TABLE rawstd.insta_download_saved_collections (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),  -- UUID as primary key, auto-generated
    collection_name VARCHAR(50),  -- Instagram collection name
    creation_time TIMESTAMP,  -- Date and time when the collection was created
    update_time TIMESTAMP  -- Date and time when the collection was last updated
);

COMMIT;
