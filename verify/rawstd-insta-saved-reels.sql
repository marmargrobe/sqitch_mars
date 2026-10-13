-- Verify sqitch_mars:rawstd-insta-saved-reels on pg

BEGIN;

CREATE TABLE IF NOT EXISTS rawstd.insta_saved_reels (
    pk VARCHAR(50), -- This value alligns with the collections data ID
    id VARCHAR(50) PRIMARY KEY,
    code VARCHAR(50),
    taken_at TIMESTAMP,
    media_type VARCHAR(10),
    image_versions2 JSONB,
    product_type VARCHAR(50),
    thumbnail_url VARCHAR,
    "location" JSONB,
    "user" JSONB,
    comment_count INTEGER,
    comments_disabled BOOLEAN,
    commenting_disabled_for_viewer BOOLEAN,
    like_count INTEGER,
    play_count INTEGER,
    has_liked BOOLEAN,
    caption_text VARCHAR,
    accessibility_caption VARCHAR,
    usertags JSONB,
    sponsor_tags JSONB,
    video_url VARCHAR(100),
    view_count INTEGER,
    video_duration FLOAT,
    title VARCHAR,
    resources JSONB,
    clips_metadata JSONB,
    last_updated TIMESTAMP,
    FOREIGN KEY (pk) REFERENCES rawstd.insta_saved_collections(id)
);

ROLLBACK;
