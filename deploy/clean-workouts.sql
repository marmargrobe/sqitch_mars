-- Deploy sqitch_mars:clean-workouts to pg
-- requires: clean-saved-posts-view

BEGIN;

-- One row per post in the workouts tab (Workouts, Massages, Face yoga).
-- Filled by src/data_cleaner/workouts_extract.py; rows with user_edited = true are never overwritten.
CREATE TABLE clean.workouts (
    code VARCHAR(50) PRIMARY KEY,                 -- clean.saved_posts.code
    title VARCHAR,
    workout_type VARCHAR(20),                     -- strength | pilates | yoga | mobility | cardio | calisthenics | massage | face
    body_areas TEXT[] NOT NULL DEFAULT '{}',      -- neck, shoulders, back, chest, arms, core, glutes, hips, legs, face, full body
    exercises TEXT[] NOT NULL DEFAULT '{}',
    sets_reps VARCHAR,
    equipment TEXT[] NOT NULL DEFAULT '{}',
    status VARCHAR(20) NOT NULL,                  -- exercises | routine | how_to | no_details | no_caption
    user_edited BOOLEAN NOT NULL DEFAULT FALSE,
    extractor_version VARCHAR(10),
    extracted_at TIMESTAMP
);

COMMIT;
