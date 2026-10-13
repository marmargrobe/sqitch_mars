-- Verify sqitch_mars:create-schema-rawstd on pg

BEGIN;

CREATE SCHEMA IF NOT EXISTS rawstd;


ROLLBACK;
