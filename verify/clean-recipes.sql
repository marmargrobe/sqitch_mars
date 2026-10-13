-- Verify sqitch_mars:clean-recipes on pg

BEGIN;

SELECT code, recipe_name, servings, ingredients, steps, status, recipe_link, how_to_get,
       meal_type, cuisine, diet_tags, notes, user_edited, extractor_version, extracted_at
FROM clean.recipes WHERE FALSE;

ROLLBACK;
