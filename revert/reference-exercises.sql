-- Revert sqitch_mars:reference-exercises from pg

BEGIN;

DROP TABLE reference.exercises;

COMMIT;
