-- Revert sqitch_mars:clean-recipes from pg

BEGIN;

DROP TABLE clean.recipes;

COMMIT;
