-- Deploy sqitch_mars:create-rawstd-insta-download-saved-reels-details to pg

BEGIN;

CREATE TABLE rawstd.insta_download_saved_reels_details (
    id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    reel_id UUID,
    user_name VARCHAR(100),
    reel_url VARCHAR,
    caption_text VARCHAR,
    location_name VARCHAR,
    insta_account VARCHAR,
    python_script VARCHAR,
    python_runtime TIMESTAMP NOT NULL,
    CONSTRAINT fk_reel_id FOREIGN KEY (reel_id) REFERENCES rawstd.insta_download_saved_reels (id)

);

COMMIT;
