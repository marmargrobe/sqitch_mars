-- Revert sqitch_mars:ops-pipeline-runs from pg

BEGIN;

DROP TABLE ops.pipeline_runs;
DROP SCHEMA ops;

COMMIT;
