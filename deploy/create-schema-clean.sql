-- Deploy sqitch_mars:create-schema-clean to pg

BEGIN;

CREATE SCHEMA IF NOT EXISTS clean;

COMMIT;
