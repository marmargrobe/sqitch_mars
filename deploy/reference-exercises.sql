-- Deploy sqitch_mars:reference-exercises to pg
-- requires: reference-imdb-titles

BEGIN;

-- Exercises from free-exercise-db (https://github.com/yuhonas/free-exercise-db, Unlicense / public domain).
-- Loaded by src/data_cleaner/exercises_load.py; shown under "Load more exercises" in the Workouts tab.
CREATE TABLE reference.exercises (
    id VARCHAR PRIMARY KEY,                       -- e.g. '3_4_Sit-Up'
    name VARCHAR NOT NULL,
    level VARCHAR(20),                            -- beginner | intermediate | expert
    category VARCHAR(30),                         -- strength | stretching | plyometrics | cardio | ...
    equipment VARCHAR(30),                        -- body only | dumbbell | barbell | cable | ...
    force VARCHAR(10),                            -- push | pull | static
    mechanic VARCHAR(20),                         -- compound | isolation
    primary_muscles TEXT[] NOT NULL DEFAULT '{}', -- quadriceps, glutes, abdominals, ...
    secondary_muscles TEXT[] NOT NULL DEFAULT '{}',
    instructions TEXT[] NOT NULL DEFAULT '{}',
    images TEXT[] NOT NULL DEFAULT '{}'           -- paths inside the free-exercise-db repo (exercises/<path>)
);
CREATE INDEX exercises_primary_muscles_idx ON reference.exercises USING GIN (primary_muscles);

COMMIT;
