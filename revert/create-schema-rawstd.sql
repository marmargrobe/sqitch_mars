-- Revert sqitch_mars:create-schema-rawstd from pg

BEGIN;

DROP SCHEMA IF EXISTS rawstd;

COMMIT;
