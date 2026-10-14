-- Verify sqitch_mars:reference-exercises on pg

BEGIN;

SELECT id, name, level, category, equipment, primary_muscles, secondary_muscles, instructions, images
FROM reference.exercises WHERE FALSE;

ROLLBACK;
