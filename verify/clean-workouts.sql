-- Verify sqitch_mars:clean-workouts on pg

BEGIN;

SELECT code, title, workout_type, body_areas, exercises, sets_reps, equipment, status, user_edited
FROM clean.workouts WHERE FALSE;

ROLLBACK;
