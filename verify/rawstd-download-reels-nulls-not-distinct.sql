-- Verify sqitch_mars:rawstd-download-reels-nulls-not-distinct on pg

BEGIN;

SELECT 1/COUNT(*)
FROM pg_index i
JOIN pg_class c ON c.oid = i.indexrelid
WHERE c.relname = 'unique_columns_ridsr'
  AND i.indnullsnotdistinct;

ROLLBACK;
