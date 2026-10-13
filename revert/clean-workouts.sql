-- Revert sqitch_mars:clean-workouts from pg

BEGIN;

DROP TABLE clean.workouts;

COMMIT;
