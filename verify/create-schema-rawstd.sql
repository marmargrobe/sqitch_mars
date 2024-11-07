-- Verify sqitch_mars:create-schema-rawstd on pg

BEGIN;

SELECT schema_name
FROM information_schema.schemata
WHERE schema_name = 'rawstd';

ROLLBACK;
