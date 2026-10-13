-- Verify sqitch_mars:ops-pipeline-runs on pg

BEGIN;

SELECT id, run_id, step, status, triggered_by, started_at, finished_at, summary, error
FROM ops.pipeline_runs WHERE FALSE;

ROLLBACK;
