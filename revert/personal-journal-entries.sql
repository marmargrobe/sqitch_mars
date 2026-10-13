-- Revert sqitch_mars:personal-journal-entries from pg
-- Careful: this deletes every journal entry. Back them up first:
--   pg_dump -d mars -n personal -f journal_backup.sql

BEGIN;

DROP TABLE personal.journal_entries;
DROP SCHEMA personal;

COMMIT;
