-- Verify sqitch_mars:create-schema-clean on pg

BEGIN;

CREATE SCHEMA IF NOT EXISTS clean;

ROLLBACK;
