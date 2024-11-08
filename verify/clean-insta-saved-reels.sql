-- Verify sqitch_mars:clean-insta-saved-reels on pg

BEGIN;

CREATE TABLE clean.insta_user (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(50),
    full_name VARCHAR(100),
    profile_pic_url VARCHAR
);

CREATE TABLE clean.insta_saved_reels (
    pk VARCHAR(50),
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
    -- commenting_disabled_for_viewer BOOLEAN,
    like_count INTEGER,
    play_count INTEGER,
    has_liked BOOLEAN,
    caption_text VARCHAR,
    -- accessibility_caption VARCHAR,
    usertags JSONB,
    sponsor_tags JSONB,
    video_url VARCHAR(100),
    view_count INTEGER,
    video_duration FLOAT,
    -- title VARCHAR,
    resources JSONB,
    clips_metadata JSONB,

    -- new columns
    last_updated TIMESTAMP,
    hashtags VARCHAR[],
    lng FLOAT,
    lat FLOAT,
    city VARCHAR,
    location_name VARCHAR,
    user_pk VARCHAR(50),
    FOREIGN KEY (user_pk) REFERENCES clean.insta_user(id)
);


CREATE TABLE clean.insta_usertags (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(50),
    full_name VARCHAR(100),
    profile_pic_url VARCHAR,
    tagged_by_insta_user_id VARCHAR(50),
    insta_saved_reels_id VARCHAR(50),
    FOREIGN KEY (tagged_by_insta_user_id) REFERENCES clean.insta_user(id),
    FOREIGN KEY (insta_saved_reels_id) REFERENCES clean.insta_saved_reels(id)
);

ROLLBACK;
