-- Verify sqitch_mars:clean-insta-saved-reels-categories on pg

BEGIN;

CREATE TABLE clean.insta_saved_reels_categories (
    id VARCHAR(50) NOT NULL,
    processor_category VARCHAR[] NOT NULL,
    processor_version VARCHAR(20) NOT NULL,
    processor_input JSONB NOT NULL,
    last_updated TIMESTAMP,
-- Constraints
    PRIMARY KEY (id, processor_category, processor_version, processor_input),
    FOREIGN KEY (id) REFERENCES clean.insta_saved_reels(id)
    );

ROLLBACK;
