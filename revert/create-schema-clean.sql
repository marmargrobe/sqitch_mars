-- Revert sqitch_mars:create-schema-clean from pg

BEGIN;

DROP SCHEMA IF EXISTS clean;

COMMIT;
