-- Deploy sqitch_mars:clean-recipes to pg
-- requires: clean-saved-posts-view

BEGIN;

-- One row per post in a recipes collection, filled by src/data_cleaner/recipes_extract.py.
-- status: full | ingredients_only | external | description_only | not_a_recipe | no_caption
CREATE TABLE clean.recipes (
    code VARCHAR(50) PRIMARY KEY,           -- Instagram shortcode, matches clean.saved_posts.code
    recipe_name VARCHAR,
    servings VARCHAR,
    ingredients TEXT[] NOT NULL DEFAULT '{}',
    steps TEXT[] NOT NULL DEFAULT '{}',
    status VARCHAR(20) NOT NULL,
    recipe_link VARCHAR,                    -- website link found in the caption
    how_to_get VARCHAR,                     -- e.g. 'Comment "BUN"', 'Link in bio'
    meal_type VARCHAR(30),
    cuisine VARCHAR(30),
    diet_tags TEXT[] NOT NULL DEFAULT '{}',
    notes VARCHAR,
    user_edited BOOLEAN NOT NULL DEFAULT FALSE,  -- true once edited by hand; re-extraction skips it
    extractor_version VARCHAR(10),
    extracted_at TIMESTAMP
);

COMMIT;
