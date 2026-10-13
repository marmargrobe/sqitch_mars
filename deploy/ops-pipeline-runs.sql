-- Deploy sqitch_mars:ops-pipeline-runs to pg

BEGIN;

-- Operational data (not content).
CREATE SCHEMA IF NOT EXISTS ops;

-- One row per step of each refresh (python -m src.pipeline.refresh). The app reads it for
-- "Last updated" and the progress of a running refresh.
CREATE TABLE ops.pipeline_runs (
    id SERIAL PRIMARY KEY,
    run_id VARCHAR(36) NOT NULL,        -- groups the steps of one refresh
    step VARCHAR(30) NOT NULL,          -- import | imdb | recipes | travel | watch_read | workouts | journal | thumbnails
    status VARCHAR(10) NOT NULL,        -- running | done | skipped | failed
    triggered_by VARCHAR(10) NOT NULL,  -- cli | app | schedule
    started_at TIMESTAMP NOT NULL DEFAULT now(),
    finished_at TIMESTAMP,
    summary VARCHAR,
    error TEXT
);
CREATE INDEX pipeline_runs_run_idx ON ops.pipeline_runs (run_id);
CREATE INDEX pipeline_runs_started_idx ON ops.pipeline_runs (started_at);

COMMIT;
